<template>
    <div>
        <div class="container">
            <div id="search">
                <input type="text" placeholder="搜索杭州的美食故事">
                <span class="iconfont icon-iconset0157"></span>
            </div>
            <div id="nav">
                <mt-navbar v-model="selected">
                    <mt-tab-item id="d1">名宿</mt-tab-item>
                    <mt-tab-item id="d2">美食</mt-tab-item>
                    <mt-tab-item id="d3">景点</mt-tab-item>
                    <mt-tab-item id="d4">艺术</mt-tab-item>
                </mt-navbar>
            </div> 
        </div>
        <div id="nav-page">
             <mt-tab-container v-model="selected">
                <mt-tab-container-item id="d1">
                     <h1>有趣房东</h1>
                      <message></message>
                </mt-tab-container-item>
                <mt-tab-container-item id="d2">
                    asdsa
                </mt-tab-container-item>
                <mt-tab-container-item id="d3">
                  sdasd
                </mt-tab-container-item>
                <mt-tab-container-item id="d4">
                   sadsadsa
                </mt-tab-container-item>
            </mt-tab-container>
        </div>

        <div class="write_story" @click="tcpl">
            <span >写故事</span>
            <span class="iconfont icon-jia "></span>
        </div>   
        <div class="tcpl">
             <div class="fb_story">
                <span class="iconfont icon-chacha" @click="closepl"></span>
                <span>发布</span>
             </div>
             <div class="tjzp">
                 <div >
                    <span class="iconfont icon-jia"></span>
                    <span>添加照片</span>
                 </div>
             </div>
             <div class="xbt"> 
                 <div>
                     <textarea name="" id="" placeholder="故事标题" maxlength="30"></textarea>
                 </div>
                 <div>
                     <textarea name="" id="" placeholder="分享让您印象深刻的旅行故事，比如有趣的瞬间，新奇的发现，让人回味的体验"></textarea>
                 </div>
             </div>
         </div>
    </div>    
</template>
<script>
import Message from "../components/story/message.vue"
export default {
     data(){
        return{
            selected:"d1",
        }
    },
    methods: {
          tcpl(){
            var plk=document.querySelector(".tcpl");
            plk.style.height="100%";
            plk.style.overflow="auto";
        },
        closepl(){
             var plk=document.querySelector(".tcpl");
            plk.style.height="0";
        },
    },

    components:{
        Message,
    }
}
</script>
<style scoped>
.mint-navbar{
    width: 100% !important;
}
    .container{
        position: fixed;
        width: 100%;
        z-index: 220;
        background: #fff;
    }
    #search{
        position: relative;
    }
    #search span{
        position: absolute;
        top:24px;
        left:29px;
    }
    #search input{
        box-shadow:0px 0px 15px 5px rgb(0,0,0,0.1);
        border: 0;
        margin: 15px 5%;
        width: 90%;
        padding: 10px 30px;
        outline: none;
        box-sizing: border-box;
    }
    #nav{
        color:#999;
        
        box-shadow:0px 2px 5px 0px rgb(0,0,0,0.1);
    }
    .mint-navbar .mint-tab-item.is-selected {
        border-bottom: 2px solid #000;
        color: #000;
    }

    .write_story{
        background: #fff;
        position: fixed;
        bottom: 80px;
        left:38%;
        padding: 8px 15px;
        border-radius: 50px;
        box-shadow: 0 0 15px 1px #999;
    }
    .write_story:hover{
        background: #d3d2d2;
    }
    .write_story span:first-child{
        font-size: 13px;
        margin-right: 10px;
        columns: #484848;
    }
    .write_story span:last-child{
        color:#484848;
        font-size:17px;
    }
    .tcpl{
        position: fixed;
        z-index: 222;
        bottom:0;
        background: #fff;
        width: 100%;
        height: 0px;
        transition:height .2s linear;
        overflow: hidden;
    }
    .tcpl div.fb_story{
        display: flex;
        position: fixed;
        width: 88%;
        justify-content: space-between;
        height:60px;
        line-height: 60px;
        font-size: 14px;
       border-bottom:1px  solid #999;
       padding:0 25px;
       background: #fff;
    }
    .tcpl div.fb_story span:last-child{
        color:#008489;
    }
    .tcpl div.tjzp{
        display: flex;
        justify-content: center;
    }
    .tcpl div.tjzp div{
        border: 1px solid #ddd;
        margin-top:110px;
        display: flex;
        flex-flow: column;
        padding: 120px 120px;
        text-align: center;
        color:#008489;
    }
    .tcpl div:nth-child(2) div span:first-child{
        font-size: 30px;
    }
    .xbt{
        margin:30px 50px;
    }
    .xbt textarea{
        border:0;
        outline: 0;
        width: 100%;
        color:#484848;
    }
    .xbt div:first-child textarea{
        font-size: 20px;
        font-weight: bold;
        display: in
    }
    .xbt div:last-child textarea{
        line-height: 20px;
        font-size:14px;
         height: 200px;
    }
    #nav-page h1{
        margin-top: 120px;
        margin-left: 5%;
        font-size: 28px;
        font-weight: 700
    }
    
</style>
