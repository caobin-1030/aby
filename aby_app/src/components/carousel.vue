<template>
  <div :style="divHeight">
    <div class="swiper-container carousel">
    <div class="swiper-wrapper">
      <div class="swiper-slide" v-for="(item,index) of pics" :key="index"><img :src="item" alt=""></div>
    </div>
    <!-- Add Pagination -->
    <div class="swiper-pagination"></div>
  </div>
  </div>
</template>
<script>
import Swiper from 'swiper'
export default {
  data() {
    return {
      divHeight:{
        height:this.height
      }
    }
  },
  mounted() {
    setTimeout(function(){
      new Swiper('.carousel', {
        pagination: {
          el:'.swiper-pagination',
          dynamicBullets: true,
        },
      });
    },1000)

  },
  props:["pics","height"]
}
</script>
<style scoped>
  img{
    width: 100%;
  }
   .swiper-container {
      width: 100%;
      height: 100%;
    }
    .swiper-slide {
      text-align: center;
      font-size: 18px;
      background: #fff;

      /* Center slide text vertically */
      display: -webkit-box;
      display: -ms-flexbox;
      display: -webkit-flex;
      display: flex;
      -webkit-box-pack: center;
      -ms-flex-pack: center;
      -webkit-justify-content: center;
      justify-content: center;
      -webkit-box-align: center;
      -ms-flex-align: center;
      -webkit-align-items: center;
      align-items: center;
    }
    
</style>
