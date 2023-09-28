<template>
  <footer>
    <div class="container">
      <div class="row">
        <div class="col-md-7">
          <div>
            <!--<h1 style="display: inline-block">叶凡网</h1>-->
            <img src="@/assets/img/logoIco.png" alt />
          </div>
          <div>叶凡课堂是在线学习平台</div>
          <div>© 2023年保留所有权利。-豫ICP备2023006358号</div>
        </div>
        <div class="col-md-5 row">
          <dl class="col-md-4">
            <dt>合作伙伴</dt>
            <dd>阿李巴巴</dd>
            <dd>腾迅</dd>
            <dd>字节调动</dd>
            <dd>哔里哔里</dd>
            <dd>网宜</dd>
            <dd>米哈鼬</dd>
          </dl>
        </div>
      </div>
    </div>
  </footer>
</template>

<script lang="ts">
import { Component, Prop, Vue } from "vue-property-decorator";

@Component({
  name: "PortalFooter"
})
export default class extends Vue {}
</script>

<style lang="scss" scoped>
@import "index";
</style>