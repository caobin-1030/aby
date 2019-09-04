<template>
  <div>
    <div class="swiper-container fygs_infoc">
    <div class="swiper-wrapper">
        <div class="swiper-slide">
            <div class="fygl_border">
                <div><img src="../../../public/images/story/tx.jpg" alt=""></div>
                <span>独立房间</span>
                <p>Chai Lai Orchid Modern Bungalow near CHiang</p>
            </div>
        </div>
          <div class="swiper-slide">
            <div class="fygl_border">
                <div><img src="../../../public/images/story/tx.jpg" alt=""></div>
                <span>独立房间</span>
                <p>Chai Lai Orchid Modern Bungalow near CHiang</p>
            </div>
        </div>
          <div class="swiper-slide">
            <div class="fygl_border">
                <div><img src="../../../public/images/story/tx.jpg" alt=""></div>
                <span>独立房间</span>
                <p>Chai Lai Orchid Modern Bungalow near CHiang</p>
            </div>
        </div>
          <div class="swiper-slide">
            <div class="fygl_border">
                <div><img src="../../../public/images/story/tx.jpg" alt=""></div>
                <span>独立房间</span>
                <p>Chai Lai Orchid Modern Bungalow near CHiang</p>
            </div>
        </div>
    </div>
  </div>
  </div>
</template>
<script>
import Swiper from 'swiper'
export default {
  mounted() {
      new Swiper('.fygs_infoc', {
            slidesPerView: 'auto',
            spaceBetween: 30,
        });
  },
}
</script>
<style scoped>
    .fygs_infoc{
        margin-top: 20px;
        color: #484848;
    }
    .fygs_infoc .fygl_border img{
        width: 100%;
    }
    .fygs_infoc .fygl_border span{
        display: block;
        margin:5px 0;
        color:#341e13
    }
    
    .fygs_infoc .fygl_border{
        padding: 0;
    }

    .swiper-container {
      width: 100%;
      height: 100%;
      margin-bottom: 50px;
    }
    .swiper-slide {
      text-align: left;
      font-size: 12px;
      background: #fff;
      width: 100%;
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
      width: 142px;
    } 
</style>
