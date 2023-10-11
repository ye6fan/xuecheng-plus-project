<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="/static/img/asset-favicon.ico">
    <title>叶凡课堂-${model.courseBase.name}</title>

    <link rel="stylesheet" href="/static/plugins/normalize-css/normalize.css"/>
    <link rel="stylesheet" href="/static/plugins/bootstrap/dist/css/bootstrap.css"/>
    <link rel="stylesheet" href="/static/css/page-learing-article.css"/>
</head>

<body data-spy="scroll" data-target="#articleNavbar" data-offset="150">
<!-- 页面头部 -->
<!--#include virtual="/include/header.html"-->
<!--页面头部结束sss-->
<div id="learningArea">
    <div class="article-banner">
        <div class="banner-bg"></div>
        <div class="banner-info">
            <div class="banner-left">
                <p>${model.courseBase.mtName}<span>\ ${model.courseBase.stName}</span></p>
                <p class="tit">${model.courseBase.name}</p>
                <p class="pic">
                    <#if model.courseBase.charge=='201000'>
                        <span class="new-pic">免费</span>
                    <#else>
                        <span class="new-pic">特惠价格￥${model.courseBase.price!''}</span>
                        <span class="old-pic">原价￥${model.courseBase.originalPrice!''}</span>
                    </#if>
                </p>
                <p class="info">
                    <a href="#" @click.prevent="startLearning()">马上学习</a>
                    <span><em>难度等级</em>
                <#if model.courseBase.grade=='204001'>
                    初级
                <#elseif model.courseBase.grade=='204002'>
                    中级
                <#elseif model.courseBase.grade=='204003'>
                    高级
                </#if>
                </span>
                    <span><em>课程时长</em>1小时</span>
                    <span><em>评分</em>5分</span>
                    <span><em>授课模式</em>
                 <#if model.courseBase.teachmode=='200002'>
                     录播
                 <#elseif model.courseBase.teachmode=='200003'>
                     直播
                 </#if>
                </span>
                </p>
            </div>
            <div class="banner-rit">
                <p>
                    <a href="https://www.yefan.xyz/course/preview/learning.html?id=${model.courseBase.id}"
                       target="_blank">
                        <#if model.courseBase.pic??>
                            <img src="https://www.yefan.xyz${model.courseBase.pic}" alt="" width="160" height="160">
                        <#else>
                            <img src="/static/img/widget-video.png" alt="" width="160" height="160">
                        </#if>

                    </a>
                </p>
                <p class="vid-act"><span><i class="i-heart"></i>收藏</span>666</p>
            </div>
        </div>
    </div>
    <div class="article-cont">
        <div class="tit-list">
            <a href="javascript:;" id="articleClass" class="active">课程介绍</a>
            <a href="javascript:;" id="articleItem">课程章节与视频</a>
        </div>
        <div class="article-box">
            <div class="articleClass" style="display: block">
                <!--<div class="rit-title">评价</div>-->
                <div class="article-cont">
                    <div class="article-left-box">
                        <div class="content">

                            <div class="content-com suit">
                                <div class="title"><span>适用人群</span></div>
                                <div class="cont cktop">
                                    <div>
                                        <p>${model.courseBase.users!""}</p>
                                    </div>
                                    <!--<span class="on-off">更多 <i class="i-chevron-bot"></i></span>-->
                                </div>
                            </div>
                            <div class="content-com course">
                                <div class="title"><span>课程制作</span></div>
                                <div class="cont">
                                    <div class="img-box"><img
                                                src="https://www.yefan.xyz${model.courseTeacher.photograph}" alt=""
                                                width="120" height="120"></div>
                                    <div class="info-box">
                                        <p class="name">教学方：<em>${model.courseTeacher.teacherName!''}</em></p>
                                        <!-- <p class="lab">高级前端开发工程师 10年开发经验</p>-->
                                        <p class="info">${model.courseTeacher.introduction!''}</p>
                                    </div>
                                </div>

                            </div>
                            <div class="content-com about">
                                <div class="title"><span>课程介绍</span></div>
                                <div class="cont cktop">
                                    <div>
                                        <p>${model.courseBase.description!""}</p>
                                    </div>
                                    <!--<span class="on-off">更多 <i class="i-chevron-bot"></i></span>-->
                                </div>
                            </div>
                            <div class="content-com prob">
                                <div class="title"><span>常见问题</span></div>
                                <div class="cont">
                                    <ul>
                                        <li class="item"><span class="on-off"><i class="i-chevron-bot"></i> 我什么时候能够访问课程视频与作业？</span>
                                            <div class="drop-down">
                                                <p>课程上线后，或者购买课程后</p>
                                            </div>
                                        </li>
                                        <li class="item"><span class="on-off"><i class="i-chevron-bot"></i> 如果需要额外的时间来完成课程会怎么样？</span>
                                            <div class="drop-down">
                                                <p>时间就是金钱</p>
                                            </div>
                                        </li>
                                        <li class="item"><span class="on-off"><i class="i-chevron-bot"></i> 我支付次课程之后会得到什么？</span>
                                            <div class="drop-down">
                                                <p>会获得课程</p>
                                            </div>
                                        </li>
                                        <li class="item"><span class="on-off"><i class="i-chevron-bot"></i> 退款条例是如何规定的？</span>
                                            <div class="drop-down">
                                                <p>买都买了，别退了</p>
                                            </div>
                                        </li>
                                        <li class="item"><span class="on-off"><i
                                                        class="i-chevron-bot"></i> 有助学金？</span>
                                            <div class="drop-down">
                                                <p>考上清华就有</p>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!--侧边栏-->
                    <!--#include virtual="/include/course_detail_side.html"-->
                    <!--侧边栏-->

                </div>
            </div>
            <div class="articleItem" style="display: none">
                <div class="article-cont-catalog">
                    <div class="article-left-box">
                        <div class="content">
                            <#list model.teachplans as firstNode>
                                <div class="item">
                                    <div class="title act"><i class="i-chevron-top"></i>${firstNode.pname}<span
                                                class="time">0.1小时</span></div>
                                    <div class="drop-down" style="height: 260px;">
                                        <ul class="list-box">
                                            <#list firstNode.teachPlanTreeNodes as secondNode>
                                                <li>
                                                    <a href="https://www.yefan.xyz/course/preview/learning.html?id=${model.courseBase.id}&chapter=${secondNode.teachplanMedia.teachplanId!''}"
                                                       target="_blank">${secondNode.pname}</a></li>
                                            </#list>
                                        </ul>
                                    </div>
                                </div>
                            </#list>
                            <#-- <div class="item">
                                 <div class="title act"><i class="i-chevron-top"></i>第一阶段 HTTP协议基础详解<span class="time">8小时</span></div>
                                 <div class="about">使用Java消息中间件处理异步消息成为了分布式系统中的必修课，通过本门课程可以深入浅出的学习如何在Java中使用消息中间件并且一步一步打造更优雅的最佳实践方案。</div>
                                 <div class="drop-down" style="height: 260px;">
                                     <ul class="list-box">
                                         <li class="active">1.1 阅读：分级政策细节 <span>97’33”</span></li>
                                         <li>1.2 视频：为什么分为 A 部分、B 部分、C 部分 <span>66’15”</span></li>
                                         <li>1.3 视频：软件安装介绍 <span>86’42”</span></li>
                                         <li>1.4 阅读：Emacs安装 <span>59’00”</span></li>
                                         <li>1.5 作业1：Emacs安装 <span>93’29”</span></li>
                                         <li>阶段测试</li>
                                     </ul>
                                 </div>
                             </div>-->


                        </div>
                    </div>
                    <!--侧边栏-->
                    <!--#include virtual="/include/course_detail_side.html"-->
                    <!--侧边栏-->
                </div>
            </div>
        </div>
    </div>
    <div class="popup-course">
        <div class="mask"></div>
        <!--欢迎访问课程弹窗- start -->
        <div class="popup-course-box">
            <div class="title">${model.courseBase.name} <span class="close-popup-course-box">×</span></div>
            <div class="content">
                <p>欢迎学习本课程，本课程免费您可以立即学习，也可加入我的课程表享受更优质的服务。</p>
                <p>
                    <a href="#" @click.prevent="addCourseTable()">加入我的课程表</a>
                    <a href="#" @click.prevent="startLearngin()">立即学习</a>
                </p>
            </div>
        </div>
    </div>
    <div class="popup-box">
        <div class="mask"></div>
        <!--支付弹窗- start -->
        <div class="popup-pay-box">
            <div class="title">${model.courseBase.name} <span class="close-popup-pay-box">×</span></div>
            <div class="content">
                <img :src="qrcode" width="200" height="200" alt="请点击支付宝支付，生成二维码。"/>

                <div class="info">
                    <p class="info-tit">${model.courseBase.name}<span>课程有效期:${model.courseBase.validDays}天</span>
                    </p>
                    <p class="info-pic">课程价格 : <span>￥${model.courseBase.originalPrice!''}元</span></p>
                    <p class="info-new-pic">优惠价格 : <span>￥${model.courseBase.price!''}元</span></p>
                </div>
            </div>
            <div class="fact-pic">实际支付: <span>￥${model.courseBase.price!''}元</span></div>
            <div class="go-pay">
                <a href="#" @click.prevent="aliPay()">支付宝支付</a>
                <a href="#" @click.prevent="querypayresult()">支付完成</a>
            </div>
        </div>
        <!--支付弹窗- end -->
        <div class="popup-comment-box">

        </div>
    </div>
    <!-- 页面底部 -->
    <!--底部版权-->
    <!--#include virtual="/include/footer.html"-->
    <!--底部版权-->
</div>
<script>var courseId = "${model.courseBase.id}";
    var courseCharge = "${model.courseBase.charge}"</script>
<!--#include virtual="/include/course_detail_dynamic.html"-->
</body>
