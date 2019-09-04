<template>
  <div class="quan">
    <div class="ser">
      <div class="search">
        <div class="hangzhou">
          <span>杭州</span>
        </div>
        <div class="inp">
          <input v-model="text" v-focus type="text" placeholder="输入景点、地址或房源名">
        </div>
      </div>
      <mt-button @click="quxiao" class="quxiao">取消</mt-button>
    </div>
    <div @click="diqu" class="diqu" v-for="i of 4" :key="i">  
      <div class="fdq">
        <div class="fdq-icon">
          <span class="iconfont icon-dianzan1"></span>
        </div>
        <div class="fdq-1">
          <span class="fdq-font">西湖区</span>
          <p class="fdq-font-1">中国·浙江省·杭州市</p>
        </div>
        
      </div>
      
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      text:""
    }
  },
  directives:{
    focus:{
      inserted:function(el){
        el.focus()
      }
    }
  },
  methods: {
    quxiao(){
      this.text="";
      this.$router.replace('/fyss');
    },
    diqu(e){
      var a=e.target;
      var b=document.querySelector(".fdq-font");
      if(a.nodeName=="SPAN"||a.nodeName=="P"||a.nodeName=="DIV"){
        this.text=b.textContent;
      };
      // console.log(this.text)
      this.$router.replace("/index");
      this.$emit('func',this.text)
    },
  },

}
</script>
<style scoped>
.quan{
  width: 90%;
  margin: 0 auto;
}
.ser{
  display: flex;
  font-size: 10px;
  width: 100%;
  margin-top: 10px;
  height: 30px;
  line-height: 30px;
}
.search{
  display: flex;
  border: 1px solid rgba(red, green, blue, 1);
  background: #eee;
  border-radius: 10px;
  width: 87%;
}
.inp>input{
  background: none;
  height: 30px;
  margin-left:10px; 
  border: none;
}
.hangzhou{
  border-right: 1px solid #fff;
}
.hangzhou>span{
  margin: 0 10px;
  display: inline-block;
}
.quxiao{
  height: 30px !important;
  font-size: 10px !important;
}
.diqu{
  margin-top:10px; 
  border-top:1px solid #eee; 
  width: 100%;
}
.fdq-1{
  margin: 5px;
  margin-top: 10px;
}
.fdq{
  display: flex;
}
.fdq-icon{
  padding-top:15px; 
}
.fdq-font{
  font-size: 12px;
  font-weight: 600;
  display: block;
}
.fdq-font-1{
  margin-top: 5px;
  font-size: 10px;
  font-weight: 300;
}
</style>
