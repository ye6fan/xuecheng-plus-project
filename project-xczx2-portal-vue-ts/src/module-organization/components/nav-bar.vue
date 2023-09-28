<template>
    <div class="nav-bar">
        <el-tabs class="el-tabs" v-model="activeName" type="border-card" @tab-click="handleClick">
            <el-tab-pane label="网站首页">
                <a href="http://localhost:7777">叶凡课堂首页</a>
            </el-tab-pane>
            <el-tab-pane label="教务教学" name="second">
                <router-link to="/organization/course-list">课程管理</router-link>
                <div class="divider"></div>
                <router-link to="/organization/media-list">媒资管理</router-link>
                <div class="divider"></div>
            </el-tab-pane>
            <el-tab-pane label="问题">
                <a href="http://localhost:7777">虽然点击发布会报404，但是后台正常运行，不影响工作，只是前端参数的原因</a>
            </el-tab-pane>
        </el-tabs>
    </div>
</template>

<style lang="scss">
    .nav-bar {

    .el-tabs {

    .el-tabs--border-card {
        border: 0px solid #dcdfe6;
        -webkit-box-shadow: 0 0px 0px 0;
        box-shadow: 0 0px 0px 0;
    }

    .el-tabs__nav-scroll {
        background-color: #2cb4ff;
        padding-left: 60px;
        padding-top: 6px;
    }

    .el-tabs__item.is-top.is-active {
        color: #333333;
    }

    .el-tabs__item.is-top {
        color: #ffffff;
        border-radius: 6px 6px 0px 0px;
    }

    .el-tabs__item.is-top:hover {
        color: #999999;
    }

    }

    .divider {
        display: inline-block;
        margin: 0px 20px;
        width: 1px;
        height: 13px;
        background-color: #d7d7d7;
    }

    }
</style>

<script lang="ts">
    import {Component, Vue} from 'vue-property-decorator'

    @Component({
        name: 'NavBar'
    })
    export default class extends Vue {
        private activeName: string = 'first'

        private handleClick(tab: any, event: any) {
        }
    }
</script>
