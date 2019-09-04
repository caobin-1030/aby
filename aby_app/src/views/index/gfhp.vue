<template>
  <div class="gaofenhaoping">
    <p class="gfhp">高分好评房源</p>
    <div class="quan">
      <div v-for="i of 4" :key="i" @click="showMore" class="fyys">
        <div class="pic">
          <img src="" alt="">
        </div>
        <div class="wenzi">
          <span class="h_type">整套房子</span>
          <p class="title">i</p>
          <span class="price">￥452/晚</span>
          <p class="pingjia">*****<span>18</span>·超赞房东</p>
        </div>
      </div>
      <mt-button class="xsgd" size="large">显示全部</mt-button>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {

    }
  },
	methods: {  
		showMore:function(){},
    },
    created() {
    },
}
</script>
<style scoped>
.gaofenhaoping{
  width: 90%;
  height: 100%;
  margin: 0 auto;
  margin-top:30px; 
  margin-bottom: 30px;
  /* border: 1px solid #000; */
}
.gfhp{
  font-size: 24px;
  font-family: Circular, "PingFang-SC", "Hiragino Sans GB", "微软雅黑", "Microsoft YaHei", "Heiti SC" !important;
  margin-bottom: 10px;
}
.quan{
  width: 100%;
  height: 100%;
  display: flex;
  flex-wrap: wrap;
}
.fyys{
  width: 45% !important;
  height: 46% !important;
  padding-top: 8px !important;
  padding-bottom: 12px !important;
  padding-left: 6px !important;
  padding-right: 6px !important;
  border: 1px solid #000;
}
.pic{
  width: 100%;
  height: 50%;
  border-radius: 5px;
  border: 1px solid #000;
}
.wenzi{
  box-sizing: border-box;
  width: 100%;
  height: 50%;
  border-radius: 5px;
  border: 1px solid #000;
  padding-top: 10px;
}
.h_type{
  font-size: 8px;
  color: sienna;
}
.title{
  text-overflow: ellipsis;
  overflow: hidden;
  margin-top: 8px;
}
.price{
  font-size: 14px;
  margin-top: 5px;
  display: inline-block;
}
.pingjia{
  margin-top: 10px;
}
.xsgd{
  margin-top: 10px;
  font-size: 10px!important;
  color: #00848A!important;
  background-color: #fff!important;
  border:1px solid #00848A!important;
}

</style>

