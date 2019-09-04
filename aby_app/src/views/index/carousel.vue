<template>
  <div>
    <mt-swipe class="banner" >
      <mt-swipe-item  @click="banner1()">
        <img class="banner1" src="./img/banner1.png" alt="">
        <div class="title">
          <p>好住处让旅游更新奇</p>
          <p>亲子游国内房源推荐</p>
          <mt-button type="default">进入特惠专场</mt-button>
        </div>
      </mt-swipe-item>
      <mt-swipe-item @click="banner2()">
        <img class="banner1" src="./img/banner2.png" alt="">
        <div class="title">
          <p>出发，让夏天凉下来</p>
          <p>精选国内避暑目的地</p>
          <mt-button type="default">查看合集</mt-button>
        </div>
      </mt-swipe-item>
      <mt-swipe-item @click="banner3()">
        <img class="banner1" src="./img/banner3.png" alt="">
        <div class="title">
          <p>听一场海的蓝色变奏</p>
          <p>国内海边度假地推荐</p>
          <mt-button type="default">查看合集</mt-button>
        </div>
      </mt-swipe-item>
    </mt-swipe>
  </div>
</template>
<script>
export default {
  data(){
    return {

    }
  },
  created(){

  },
  methods:{
    banner1(){
      this.$route.push('/banner1')
    },
    banner2(){
      this.$route.push('/banner2')
    },
    banner3(){
      this.$route.push('/banner3')
    },
  }
}
</script>
<style scoped>
@import url("./css/reset.css");
.banner{
  height: 171px;
}
.banner1{
  width: 100%;
  height: 100%;
}
.title{
  z-index: 999;
  position: absolute;
  left: 10px;
  top: 50px;
}
.title>p{
  background: none;
  color: #fff;
  margin: 6px;
  font-family:sans-serif;
}

.title>.mint-button{
  background: none;
  color: #fff;
  border:1px solid #fff; 
  margin-top: 10px;

}
</style>


