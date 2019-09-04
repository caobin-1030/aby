<template>
  <div>
    <div class="fangdong">
      <img src="./img/fangdong.jpg" alt="">
      <div class="zuoxia">
        <p class="cwfd">成为房东/体验达人</p>
        <p class="cz">了解出租您的房屋可以为您带来多少收入</p>
        <mt-button class="ljxq" size="small">了解详情</mt-button>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  
}
</script>
<style>
  .fangdong{
    width: 90%;
    height: 50%!important;
    margin: 0 auto;
    position: relative;
  }
  .fangdong>img{
    width: 100%;
    height: 50%;
  }
  .zuoxia{
    position: absolute;
    left: 10px;
    bottom: 10px;
  }
  .cwfd{
    color: #fff;
    font-size: 20px;
  }
  .cz{
    margin-top: 10px;
    color: #fff;
    font-size: 14px;
  }
  .ljxq {
    margin-top: 10px;
    background-color:rgba(255, 255, 255,0)!important;
    color: #fff !important;
    border: 1px solid rgba(255, 255, 255, 0.5) !important;
  }
</style>