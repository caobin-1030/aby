<template>
  <div>
    <div class="swiper-container fygs_infoc">
    <div class="swiper-wrapper">
        <div class="swiper-slide">
            <div class="fygl_border">
                <div>整个房源</div>
                <div>独自使用整个空间</div>
            </div>
        </div>
        <div class="swiper-slide" v-for="(item,index) of fygl" :key="index">
            <div class="fygl_border">
                <div>{{item[0]}}</div>
                <div><span class="iconfont icon-woshi"></span></div>
                <div>{{item[1]}}</div>
            </div>
        </div>
    </div>
  </div>
  </div>
</template>
<script>
import Swiper from 'swiper'
export default {
    data() {
        return {
        }
    },
    mounted() {
        new Swiper('.fygs_infoc', {
                slidesPerView: 'auto',
                spaceBetween: 30,
            });
    },
    props:["fygl"],
    watch: {
        fygl(){
            for(var i=0;i<this.fygl.length;i++){
                this.fygl[i]=this.fygl[i].split("/")
            }
        }
    },
}
</script>
<style scoped>
    .fygs_infoc{
        height: 125px ;
        margin-top: 20px;
        color: #484848;
    }
    .fygs_infoc .fygl_border{
        border: 1px solid #EBEBEB !important;
        border-radius: 4px;
        padding: 12px 16px 12px 16px !important;
        width: 152px ;
        height: 80px;
    }
    .fygs_infoc .fygl_border div{
        text-align: left;
    }
    .fygs_infoc .fygl_border div:first-child{
        font-size: 10px;
        font-weight: bold;
    }
    .fygs_infoc .fygl_border div:nth-child(2){
        font-size: 14px;
        margin: 16px 0 8px 0;
    }
    .fygs_infoc .fygl_border div:nth-child(3){
        font-size: 12px;
    }
    .swiper-container {
      width: 100%;
      height: 100%;
    }
    .swiper-slide {
      text-align: center;
      font-size: 18px;
      background: #fff;
      width: 80%;
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
    .swiper-slide {
      width: 152px;
    } 
</style>
