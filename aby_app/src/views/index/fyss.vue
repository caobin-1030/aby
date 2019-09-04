<template>
  <div>
    <div class="fy">
      <mt-navbar v-model="selected">
        <mt-tab-item id="fangyuan">房源</mt-tab-item>
        <mt-tab-item id="tiyan">体验</mt-tab-item>
      </mt-navbar>
      <mt-tab-container v-model="selected">
        <mt-tab-container-item id="fangyuan">
          <div @click="dingwei" :class="searchBarFixed==true ?'fixed-top' :'dingwei'">
            <div class="chengshi">
              <span>杭州</span>
            </div>
            <div class="dingwei1">
              <input v-model="jingdian" type="text" value="输入景点、地址或房源名称" @changed="text">
            </div>
            <span class="dingwei2">定位</span>
          </div>
          <div class="fy_time">
            <input type="text" value="入住退房时间">
          </div>
          <mt-button class="ss_fy" size="large">搜索房源</mt-button>
        </mt-tab-container-item>
        <mt-tab-container-item id="tiyan">
          <div class="dingwei">
            <div class="dingwei1">
              <input type="text" value="输入景点、地址或房源名称">
            </div>
            <span>定位</span>
          </div>
          <div class="fy_time">
            <input type="text" value="入住退房时间">
          </div>
          <mt-button class="ss_fy" size="large">搜索房源</mt-button>
        </mt-tab-container-item>
      </mt-tab-container>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      selected:"fangyuan",
      city:"",
      searchBarFixed:false,
      jingdian:"",
      
    }
  },
  mounted() {
    window.addEventListener('scroll',this.handleScroll)
  },
  methods: {
    handleScroll(){
      var scrollTop=window.pageYOffset||document.documentElement.scrollTop||document.body.scrollTop;
      var offsetTop=document.querySelector('.dingwei').offsetTop;
      if (scrollTop>offsetTop){
        this.searchBarFixed=true;
      }else{
        this.searchBarFixed=false;
      }
    },
    dingwei(){
      this.$router.replace('/jingdian');
    },
    text:function(changed){
      this.jingdian=changed;
      console.log(this.jingdian)
    } 
  },
}
</script>
<style>
  .fixed-top{
    position: fixed;
    width: 100%;
    left: 0;
    top: 0;
    border: 1px solid #eee;
    border-radius: 5px;
    box-shadow: 0 5px 5px -5px #eee;
    background: #fff;
  }
  .fy{
    width: 90%;
    height: 150px;
    margin: 0 auto;
    margin-top:10px; 
    /* border: 1px solid #000; */
  }
  .lianjie{
    padding: 2px;
  }
  .lianjie>a{
    font-size: 10px;
    color: black;
  }
  .mint-navbar{
    width: 20%;
  }
  .mint-navbar .mint-tab-item{
    padding: 5px 0!important;
  }
  a{
    color: #000;
  }
  .mint-navbar .mint-tab-item.is-selected{
    border-bottom: 3px solid #00848A!important;
    color: #00848A!important;
    margin-bottom: -3px!important;
  }
  .a{
    color: #000 !important;
  }
  .dingwei{
    display: flex;
    width: 99%;
    margin-top:10px; 
    border: 1px solid #eee;
    border-radius: 5px;
    box-shadow: 0 5px 5px -5px #eee;
    position: relative;
  }
  .fy_time{
    width: 99%;
    margin-top:7px; 
    border: 1px solid #eee;
    border-radius: 5px;
    box-shadow: 0 5px 5px -5px #eee;
    height: 30px;
    line-height: 30px;
    font-size: 10px;
  }
  .ss_fy{
    margin-top: 10px;
    background: #00848A!important;
  }
  .ss_fy>label{
    font-size: 10px;
    color: #fff;
  }
  .chengshi{
    float: left;
    font-size: 10px!important;
    height: 30px !important;
    line-height: 30px;
    width: 30%;
    text-align: center;
    color: #00848A;
    border-right: 1px solid #eee;
  }
  .dingwei1{
    width: 70%;
    line-height: 30px;
  }
  .dingwei1>input{
    font-size: 10px;
    margin-left: 10px
  }
  .dingwei2{
    position: absolute;
    right: 20px;
    top: 10px;
    color:#00848A;
    font-size: 10px!important;
  }
</style>