<template>
  <div class="xinjiabi">
    <p class="xjbfy">性价比房源</p>
    <div class="quan">
      <div v-for="i of 4" :key="i" @click="showMore" class="fyys">
        <div class="pic">
          <!-- <carousel :pics="``" :height="`100px`"/> -->
        </div>
        <div class="wenzi">
          <span class="h_type"><span>整套房子</span><strong>·</strong><i>杭州</i></span>
          <p class="title">黄金地段88888888888888888888</p>
          <span class="price">￥234<s>￥250</s>/晚</span>
          <p class="pingjia">*****<span>18</span></p>
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
    showMore(){}
  },
}
</script>
<style scoped>
.xinjiabi{
  width: 90%;
  height: 100%;
  margin: 0 auto;
  margin-top:30px; 
  margin-bottom: 30px;
  /* border: 1px solid #000; */
}
.xjbfy{
  font-size: 24px;
  font-family: Circular, "PingFang-SC", "Hiragino Sans GB", "微软雅黑", "Microsoft YaHei", "Heiti SC" !important;
  margin-bottom: 10px;
}
.quan{
  width: 100%;
  height: 100%;
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between
}
.fyys{
  margin-top: 5px;
  width: 48% !important;
  height: 46% !important;
  padding-top: 8px !important;
  padding-bottom: 12px !important;
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
  display: inline-block;
}
.price s{
  font-size: 12px;
  display: inline-block;
  margin: 0 2px;
}
.pingjia{
  margin-top: 5px;
}
.xsgd{
  margin-top: 10px;
  font-size: 10px!important;
  color: #00848A!important;
  background-color: #fff!important;
  border:1px solid #00848A!important;
}

</style>
