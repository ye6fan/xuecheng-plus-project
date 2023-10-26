package com.xuecheng.media.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.j256.simplemagic.ContentInfo;
import com.j256.simplemagic.ContentInfoUtil;
import com.xuecheng.base.exception.XueChengPlusException;
import com.xuecheng.base.model.PageParams;
import com.xuecheng.base.model.PageResult;
import com.xuecheng.base.model.RestResponse;
import com.xuecheng.media.mapper.MediaFilesMapper;
import com.xuecheng.media.mapper.MediaProcessMapper;
import com.xuecheng.media.model.dto.QueryMediaParamsDto;
import com.xuecheng.media.model.dto.UploadFileParamsDto;
import com.xuecheng.media.model.dto.UploadFileResultDto;
import com.xuecheng.media.model.po.MediaFiles;
import com.xuecheng.media.model.po.MediaProcess;
import com.xuecheng.media.service.MediaFileService;
import io.minio.*;
import io.minio.errors.*;
import io.minio.messages.DeleteError;
import io.minio.messages.DeleteObject;
import io.minio.messages.Item;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.*;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 * @author Mr.M
 * @version 1.0
 */
@Service
@Slf4j
public class MediaFileServiceImpl implements MediaFileService {
    private static final ThreadPoolExecutor executor = new ThreadPoolExecutor(17,
            20, 60, TimeUnit.SECONDS,
            new LinkedBlockingQueue<>(200),
            new ThreadPoolExecutor.CallerRunsPolicy());


    @Value("${minio.bucket.files}")
    private String bucketFiles;
    @Value("${minio.bucket.videofiles}")
    private String bucketVideoFiles;

    @Autowired
    MediaFilesMapper mediaFilesMapper;
    @Autowired
    MinioClient minioClient;
    @Autowired
    MediaFileService mediaFileService;
    @Autowired
    MediaProcessMapper mediaProcessMapper;

    @Override
    public PageResult<MediaFiles> queryMediaFiles(Long companyId, PageParams pageParams, QueryMediaParamsDto queryMediaParamsDto) {

        //构建查询条件对象
        LambdaQueryWrapper<MediaFiles> queryWrapper = new LambdaQueryWrapper<>();
        String filename = queryMediaParamsDto.getFilename();
        String fileType = queryMediaParamsDto.getFileType();
        if (org.springframework.util.StringUtils.hasText(filename)) {
            queryWrapper.like(MediaFiles::getFilename, filename);
        }
        if (org.springframework.util.StringUtils.hasText(fileType)) {
            queryWrapper.eq(MediaFiles::getFileType, fileType);
        }
        //分页对象
        Page<MediaFiles> page = new Page<>(pageParams.getPageNo(), pageParams.getPageSize());
        // 查询数据内容获得结果
        Page<MediaFiles> pageResult = mediaFilesMapper.selectPage(page, queryWrapper);
        // 获取数据列表
        List<MediaFiles> list = pageResult.getRecords();
        // 获取数据总数
        long total = pageResult.getTotal();
        // 构建结果集
        return new PageResult<>(list, total, pageParams.getPageNo(), pageParams.getPageSize());

    }

    @Override
    public UploadFileResultDto uploadFile(Long companyId, UploadFileParamsDto uploadFileParamsDto, String localFilePath, String objectName) {
        String filename = uploadFileParamsDto.getFilename();
        String extension = filename.substring(filename.lastIndexOf("."));
        String mimeType = getMimeType(extension);
        String defaultFolderPath = getDefaultFolderPath();
        String fileMd5 = getFileMd5(new File(localFilePath));
        if (objectName == null) objectName = defaultFolderPath + fileMd5 + extension;
        boolean flag = addMediaFilesToMinIO(localFilePath, mimeType, bucketFiles, objectName);
        if (!flag) XueChengPlusException.cast("文件上传失败");
        MediaFiles mediaFiles = mediaFileService.addMediaFilesToDb(companyId, fileMd5, uploadFileParamsDto, bucketFiles, objectName);
        UploadFileResultDto dto = new UploadFileResultDto();
        assert mediaFiles != null;
        BeanUtils.copyProperties(mediaFiles, dto);
        return dto;
    }

    private String getDefaultFolderPath() {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        return simpleDateFormat.format(new Date()).replace("-", "/") + "/";
    }

    @Transactional
    @Override
    public MediaFiles addMediaFilesToDb(Long companyId, String fileMd5, UploadFileParamsDto uploadFileParamsDto, String bucket, String objectName) {
        MediaFiles mediaFiles = mediaFilesMapper.selectById(fileMd5);
        if (mediaFiles == null) {
            mediaFiles = new MediaFiles();
            BeanUtils.copyProperties(uploadFileParamsDto, mediaFiles);
            mediaFiles.setCompanyId(companyId);
            mediaFiles.setCompanyName("教育机构");
            mediaFiles.setFilePath(objectName);
            mediaFiles.setBucket(bucket);
            mediaFiles.setUrl("/" + bucket + "/" + objectName);
            mediaFiles.setId(fileMd5);
            mediaFiles.setCreateDate(LocalDateTime.now());
            mediaFiles.setStatus("1");
            mediaFiles.setAuditStatus("002003");
            mediaFiles.setFileId(fileMd5);
            int insert = mediaFilesMapper.insert(mediaFiles);
            if (insert < 0) {
                log.error("向数据库保存文件失败,bucket:{},object:{}", bucket, objectName);
                return null;
            }
            //记录待处理任务
            addWaitingTask(mediaFiles);
        }
        return mediaFiles;
    }

    @Override
    public RestResponse<Boolean> checkFile(String fileMd5) {
        MediaFiles mediaFiles = mediaFilesMapper.selectById(fileMd5);
        if (mediaFiles != null) {
            String bucket = mediaFiles.getBucket();
            String filePath = mediaFiles.getFilePath();

            try {
                minioClient.statObject(
                        StatObjectArgs.builder().bucket(bucket)
                                .object(filePath).build()
                );
            } catch (Exception e) {
                return RestResponse.success(false);
            }
            return RestResponse.success(true);
        }
        return RestResponse.success(false);
    }

    @Override
    public RestResponse<Boolean> checkChunk(String fileMd5, int chunk) {
        String chunkFileFolderPath = getChunkFileFolderPath(fileMd5);

        try {
            minioClient.statObject(
                    StatObjectArgs.builder().bucket(bucketVideoFiles)
                            .object(chunkFileFolderPath + chunk).build()
            );
        } catch (Exception e) {
            return RestResponse.success(false);
        }
        return RestResponse.success(true);

    }

    @Override
    public RestResponse<Boolean> uploadChunk(String fileMd5, int chunk, String localChunkFilePath) {
        String chunkFilePath = getChunkFileFolderPath(fileMd5) + chunk;
        String mimeType = getMimeType(null);

        Runnable uploadTask = () -> {
            try {
                // 上传分块到MinIO（假设addMediaFilesToMinIO方法已实现）
                boolean flag = addMediaFilesToMinIO(localChunkFilePath, mimeType, bucketVideoFiles, chunkFilePath);
                if (!flag) {
                    // 上传文件失败，可以根据实际情况进行错误处理
                    XueChengPlusException.cast("上传文件失败");
                }
            } catch (Exception e) {
                // 发生异常，可以根据实际情况进行错误处理
                e.printStackTrace();
            }
        };

        // 将任务提交给线程池处理
        executor.execute(uploadTask);

        return RestResponse.success(true);
    }

    @Override
    public RestResponse<Boolean> mergeChunks(Long companyId, String fileMd5, int chunkTotal, UploadFileParamsDto uploadFileParamsDto) {

        //等待，合并分块，校验文件，写数据库，删除分块
        Runnable uploadTask = () -> {
            //统计
            int fileCount = 0;
            //路径
            String chunkFileFolderPath = getChunkFileFolderPath(fileMd5);
            //等待上传成功
            try {
                while (fileCount != chunkTotal) {
                    ListObjectsArgs build = ListObjectsArgs.builder()
                            .bucket(bucketVideoFiles).prefix(chunkFileFolderPath).build();
                    // 获取目录下的文件列表
                    Iterable<Result<Item>> results = minioClient.listObjects(build);
                    // 计数器
                    // 遍历文件列表并统计文件个数
                    for (Result<Item> result : results) {
                        Item item = result.get();
                        if (item != null && !item.isDir()) {
                            fileCount++;
                        }
                    }
                    Thread.sleep(2000);
                }
            } catch (ErrorResponseException | InsufficientDataException | InternalException | InvalidKeyException |
                     InvalidResponseException | IOException | NoSuchAlgorithmException | ServerException |
                     XmlParserException | InterruptedException e) {
                e.printStackTrace();
            }

            List<ComposeSource> sourceList = Stream.iterate(0, i -> ++i)
                    .limit(chunkTotal).map(i -> ComposeSource
                            .builder()
                            .bucket(bucketVideoFiles)
                            .object(chunkFileFolderPath + i)
                            .build()).collect(Collectors.toList());
            String filename = uploadFileParamsDto.getFilename();
            String fileExt = filename.substring(filename.lastIndexOf("."));
            String objectName = getFileFolderPath(fileMd5, fileExt);
            ComposeObjectArgs composeObjectArgs = ComposeObjectArgs
                    .builder()
                    .bucket(bucketVideoFiles)
                    .object(objectName)
                    .sources(sourceList)
                    .build();
            try {
                minioClient.composeObject(composeObjectArgs);
            } catch (ErrorResponseException | InsufficientDataException | InternalException | InvalidKeyException |
                     InvalidResponseException | IOException | NoSuchAlgorithmException | ServerException |
                     XmlParserException e) {
                log.error("合并文件出错，bucket：{}，objectName：{}", bucketVideoFiles, objectName);
                e.printStackTrace();
            }
            //校验
            File file = downloadFileFromMinio(bucketVideoFiles, objectName);
            try (FileInputStream inputStream = new FileInputStream(file)) {
                String mergerMd5 = DigestUtils.md5Hex(inputStream);
                if (!mergerMd5.equals(fileMd5)) log.error("文件检验失败");
                log.info("校验文件成功");
                uploadFileParamsDto.setFileSize(file.length());
            } catch (IOException e) {
                e.printStackTrace();
            }
            //入库
            MediaFiles mediaFiles = mediaFileService.addMediaFilesToDb(companyId, fileMd5, uploadFileParamsDto, bucketVideoFiles, objectName);
            if (mediaFiles == null) log.error("文件入库失败");
            //清理
            String chunkFolderPath = getChunkFileFolderPath(fileMd5);
            clearChunkFiles(chunkFolderPath, chunkTotal);
        };

        // 将任务提交给线程池处理
        Thread thread = new Thread(uploadTask);
        thread.setDaemon(true);
        thread.start();

        return RestResponse.success(true);

    }

    @Override
    public String getFileById(String mediaId) {
        MediaFiles mediaFiles = mediaFilesMapper.selectById(mediaId);
        if (mediaFiles == null || StringUtils.isEmpty(mediaFiles.getUrl())) {
            XueChengPlusException.cast("文件出错或视频未转码");
        }
        return mediaFiles.getUrl();
    }

    @Override
    public File downloadFileFromMinio(String bucket, String objectName) {
        //临时文件
        File minioFile;
        FileOutputStream outputStream = null;
        try {
            InputStream inputStream = minioClient.getObject(GetObjectArgs
                    .builder()
                    .bucket(bucket)
                    .object(objectName)
                    .build());
            //创建临时文件
            minioFile = File.createTempFile("minio", ".merge");
            outputStream = new FileOutputStream(minioFile);
            IOUtils.copy(inputStream, outputStream);
            return minioFile;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (outputStream != null) {
                try {
                    outputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return null;
    }

    @Override
    public boolean addMediaFilesToMinIO(String localFilePath, String mimeType, String bucket, String objectName) {
        try {
            UploadObjectArgs upArgs = UploadObjectArgs.builder()
                    .bucket(bucket)
                    .filename(localFilePath)
                    .object(objectName)
                    .contentType(mimeType)
                    .build();
            minioClient.uploadObject(upArgs);
            return true;
        } catch (IOException | ErrorResponseException | InsufficientDataException | InternalException |
                 InvalidKeyException | InvalidResponseException | NoSuchAlgorithmException | ServerException |
                 XmlParserException e) {
            e.printStackTrace();
            log.error("上传文件出错: bucket:{};objectName:{};错误信息:{}", bucket, objectName, e.getMessage());
            return false;
        }
    }

    private String getFileMd5(File file) {
        try (FileInputStream fileInputStream = new FileInputStream(file)) {
            return DigestUtils.md5Hex(fileInputStream);
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }

    private String getMimeType(String extension) {
        if (extension == null) extension = "";
        ContentInfo extensionMatch = ContentInfoUtil.findExtensionMatch(extension);
        String mimeType = MediaType.APPLICATION_OCTET_STREAM_VALUE;
        if (extensionMatch != null) mimeType = extensionMatch.getMimeType();
        return mimeType;
    }

    private String getChunkFileFolderPath(String fileMd5) {
        return fileMd5.charAt(0) + "/" + fileMd5.charAt(1) + "/" + fileMd5 + "/" + "chunk" + "/";
    }

    private String getFileFolderPath(String fileMd5, String fileExt) {
        return fileMd5.charAt(0) + "/" + fileMd5.charAt(1) + "/" + fileMd5 + "/" + fileMd5 + fileExt;
    }

    private void clearChunkFiles(String chunkFileFolderPath, int chunkTotal) {
        List<DeleteObject> objectNames = Stream.iterate(0, i -> i + 1).limit(chunkTotal)
                .map(i -> new DeleteObject(chunkFileFolderPath + i)).collect(Collectors.toList());
        RemoveObjectsArgs rmArgs = RemoveObjectsArgs.builder()
                .bucket(bucketVideoFiles).objects(objectNames).build();
        Iterable<Result<DeleteError>> iterable = minioClient.removeObjects(rmArgs);
        iterable.forEach(i -> {
            try {
                DeleteError deleteError = i.get();
                System.out.println(deleteError);
            } catch (ErrorResponseException | InsufficientDataException | InternalException | InvalidKeyException |
                     InvalidResponseException | IOException | NoSuchAlgorithmException | ServerException |
                     XmlParserException e) {
                e.printStackTrace();
                log.info("删除分块失败");
            }
        });
    }

    private void addWaitingTask(MediaFiles mediaFiles) {
        String filename = mediaFiles.getFilename();
        String extension = filename.substring(filename.lastIndexOf("."));
        String mimeType = getMimeType(extension);
        if (mimeType.equals("video/x-msvideo")) {
            MediaProcess mediaProcess = new MediaProcess();
            BeanUtils.copyProperties(mediaFiles, mediaProcess);
            mediaProcess.setStatus("1");
            mediaProcess.setCreateDate(LocalDateTime.now());
            mediaProcess.setFailCount(0);
            mediaProcessMapper.insert(mediaProcess);
        }
    }
}
