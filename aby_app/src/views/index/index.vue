<template>
  <div style="margin-bottom:100px"> 
    <carousel></carousel>
    <div class="fy">
      <mt-navbar v-model="selected">
        <mt-tab-item id="fangyuan">房源</mt-tab-item>
      </mt-navbar>
      <mt-tab-container v-model="selected">
        <mt-tab-container-item id="fangyuan">
          <div @click="dingwei" :class="searchBarFixed==true ?'fixed-top' :'dingwei'">
            <div class="chengshi">
              <span>杭州</span>
            </div>
            <div class="dingwei1">
              <input v-model="jingdian" type="text" placeholder="输入景点、地址或房源名称" >
            </div>

          </div>
          <mt-button class="ss_fy" size="large" @click="search_H">搜索房源</mt-button>
        </mt-tab-container-item>
        <mt-tab-container-item id="tiyan">
          <div class="dingwei">
            <div class="dingwei1">
              <input type="text" placeholder="输入景点、地址或房源名称">
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
    <zuixin :data="data" :images="images"></zuixin>
    <!-- <xjbfy></xjbfy>
    <gfhp></gfhp> -->
    <fangdong></fangdong>
    <div class="quan-1">
      <div class="quan-2">
        <div class="ser">
          <div class="search">
            <div class="hangzhou">
              <span>杭州</span>
            </div>
            <div class="inp">
              <input v-model="text" v-focus @keyup.13="search" type="search" ref="input1" placeholder="输入景点、地址或房源名">
            </div>
          </div>
          <mt-button @click="quxiao" class="quxiao">取消</mt-button>
        </div>
        <div @click="diqu(item)" class="diqu" v-for="(item,i) of column" :key="i">  
          <div class="fdq">
            <div class="fdq-icon">
              <span class="iconfont icon-dianzan1"></span>
            </div>
            <div class="fdq-1">
              <span class="fdq-font">{{item}}</span>
              <p class="fdq-font-1">中国·浙江省·杭州市</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import carousel from './carousel'
import zuixin from './zuixin'
import xjbfy from './xjbfy'
import gfhp from './gfhp'
import fangdong from './fangdong'
export default {
  data() {
    return {
      selected:"fangyuan",
      city:"",
      searchBarFixed:false,
      jingdian:"",
      text:"",
      data:[],
      images:[],
      pno:0,
      column:[
        "西湖区",
        "拱墅区",
        "江干区",
        "上城区",
        "下城区",
        "萧山区",
        "临安区",
        "滨江区",
        "余杭区",
        "富阳区"
      ]
    }
  },
  components:{carousel,zuixin,xjbfy,gfhp,fangdong},
  created() {
    window.addEventListener('scroll',this.handleScroll,true);
    this.showMore();
  },
  watch: {
    '$route'(){
      this.showMore()
    }
  },
  directives:{
    focus:{
      inserted:function(el,{value}){
        if(value)
        {el.focus()}
      }
    }
  },
  methods: {
    search(){
      console.log(`查找 ${this.kwords} 相关的内容...`);
      this.$refs.input1.blur();
    },
    search_H(){
      if(!this.jingdian){
        this.$toast({
          message:"请选择区域",
          position:"middle",
          duration:1000
        })
      }else{
        this.$router.push(`/Search/${this.jingdian}`)
      }
    },
    handleScroll(){
      var scrollTop=window.pageYOffset||document.documentElement.scrollTop||document.body.scrollTop;
      if (scrollTop>200){
        this.searchBarFixed=true;
      }else{
        this.searchBarFixed=false;
      }
    },
    dingwei(){
      var quan=document.querySelector(".quan-1");
      quan.style.display="block";
      this.text="";
      this.jingdian="";
    },
    quxiao(){
      this.text="";
      var quan=document.querySelector(".quan-1");
      quan.style.display="none";
    },
    // diqu(e){
    //   var a=e.target;
    //   var b=document.querySelector(".fdq-font");
    //   if(a.nodeName=="SPAN"||a.nodeName=="P"||a.nodeName=="DIV"){
    //     this.text=b.textContent;
    //   };
    //   var quan=document.querySelector(".quan-1");
    //   quan.style.display="none";
    //   this.jingdian=this.text;
    // },
    diqu(item){
      this.text=item;
      var quan=document.querySelector(".quan-1");
      quan.style.display="none";
      this.jingdian=this.text;
    },
    showMore(){
      this.axios.get(
        "/house/houseByTime"
      ).then(res=>{
        this.data=res.data.data;
        for(var i=0;i<this.data.length;i++){
          this.images[i]=this.data[i].pic_address.split(",")
        }
        console.log(this.data)
      }).catch(err=>{

      })
    }
  },
  watch:{
    text(){
      this.search();
    }
  }
}
</script>
<style>
@import "./css/index.css";
</style>