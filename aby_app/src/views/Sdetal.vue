<template>
    <div>
        <div>
                <div class="fixed_top" :style="divstyle" >
                <div class="pr">
                    <div @click="toHome"><span :style="spanstyle" class="iconfont icon-zuo"></span></div>
                    <div><span :style="spanstyle" class="iconfont icon-aixin collect"></span></div>
                </div>
            </div>
            <!-- 轮播图 -->
            <div style="height:240px;"><carousel :height="`240px`" :pics="images"></carousel></div>
            <div id="page">
                <div class="fy_page">
                    <div>
                        <p class="fybt">{{story.subtitle}}</p>
                        <h2>{{story.story_title}}</h2>
                    </div>
                    <div class="zan">
                            <div>
                                <img src="../../public/images/story/tx.jpg" alt="">
                            </div>
                            <div>
                                <h5>Lena</h5>
                                <span>{{story.story_date}}</span>
                            </div>
                    </div>
                    <div><p>{{story.story_content}}</p></div>
                    <div>
                        <span class="iconfont icon-dianzan"></span>
                        <span>833人已赞</span>
                    </div>
                </div>
                    <!-- 房源概览 -->
                <div class="tjfy">
                    <h4>推荐房源</h4>
                    <div class="fygl_info">
                        <House/>
                    </div>
                </div>
                <div class="pl">
                    <div class="pl-title">
                        <h4>{{remark_l}}条评论</h4>
                        <span @click="tcpl"><a href="javascript:">写评论</a></span>
                    </div>
                    <div>
                        <div>
                            <div>
                                <span>{{remark.uname}}</span><span>{{remark.r_time}}</span>
                            </div>
                        </div>
                        <p class="plnra">{{remark.r_remark}}</p>
                    </div>
                    
                
                    <div class="btn" @click="tcplnr">
                        <a href="javescript:">查看全部评论</a>
                    </div>
                </div>
        
            </div>
        
            <div class="tabbar">
                    <div @click="tcpl">添加评论</div>
                    <div> <span>833个赞</span>
                    <span class="iconfont icon-dianzan1"></span></div>
            </div>
            <div class="tcpl">
                <div>
                    <span class="iconfont icon-chacha" @click="closepl"></span>
                    <span @click="tjpage">提交</span>
                </div>
                <div>
                    <textarea name="" id="" v-model="plpage" placeholder="说点什么..."></textarea>
                </div>
            </div>
            <div class="plnrk" >
                <div class="fh">
                    <span class="iconfont icon-zuo " @click="closeplnr"></span>
                </div>
            <div class="plnr">
                    <div class="plnrbt">
                        <span>{{remark_l}}条评论</span>
                        <span @click="tcpl">添加评论</span>
                    </div>
                    <div class="pl_bottom" v-for="(item,i) of pl" :key="i">
                        <div class="pl_page" >
                                <div>
                                    <img src="../../public/images/story/tx.jpg" alt="">
                                    <div>
                                        <span>{{item.uname}}</span>
                                        <span>{{item.r_time}}</span>
                                    </div>
                                </div>
                        </div>
                        <p>{{item.r_remark}}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
import Carousel from "../components/carousel.vue"
import House from "../components/story/house.vue"
export default {
    data() {
        return {
            divstyle:{
                background:"transparent",
                borderBottom:0,
            },
            spanstyle:{
                color:"#fff"
            },
            story:[],
            data:[],
            images:[],
            remark:[],
            remark_l:0,
            pl:[],
            plpage:''
        }
    },
    props:["storyid"],
    mounted() {
        window.addEventListener("scroll",this.handleScroll,true)
    },
    methods: {
        toHome(){
            this.$router.push("/Home")
        },
        loadMore(){
            var url="/story/sdetail";
            this.axios.get(url,{params:{
                storyid:this.storyid
            }}).then(res=>{
                this.story=res.data.data[0][0];
               this.data=res.data.data[0];
               this.images=this.data[0].story_pic.split(",");
               this.remark=res.data.data[1][0];
               console.log(this.remark)
               this.remark_l=res.data.data[1].length
               this.pl=res.data.data[1]
            })
        },
        tjpage(){
            var url="/story/addremark"
            if(!this.plpage){
                this.$toast("内容不能为空")
            }else{
                this.axios.get(url,{
                params:{
                    storyid:this.storyid,
                    r_remark:this.plpage,
                }
                }).then(res=>{
                    console.log(res)
                    if(res.data.code<0){
                         this.$toast("请先登录")
                         this.plpage=""
                    }else{
                        this.$toast("提交成功")
                        this.plpage=""
                    }
                })
            }
            
        },
        handleScroll(){
            let st=Math.max(document.body.scrollTop || document.documentElement.scrollTop);
            if(st>200){
                this.divstyle.background="#fff"
                this.divstyle.borderBottom="1px solid #999"
                this.spanstyle.color="#000"
            }else{
                this.divstyle.background="transparent"
                this.divstyle.borderBottom=0
                this.spanstyle.color="#fff"
            }

        },
        tcpl(){
            var plk=document.querySelector(".tcpl");
            plk.style.height="100%"
            var srk=document.querySelector(".tcpl textarea");
            srk.focus();
        },
        closepl(){
             var plk=document.querySelector(".tcpl");
            plk.style.height="0"
        },
        tcplnr(){
            var plk=document.querySelector(".plnrk");
            plk.style.width="100%"


        },
         closeplnr(){
             var plfh=document.querySelector(".plnrk")
            plfh.style.width="0"
    
        },
        
    },
    components:{
        Carousel,
        House
    },
    created() {
        this.loadMore()
    },
}
</script>
<style scoped>
     .fixed_top{
        position: fixed;
        top:0;
        background: transparent;
        width: 100%;
        height: 60px;
        z-index: 9; 
        /* 
        position:fixed;
        background:#fff;
        */
    }
    .fixed_top .pr{
        position: relative;
        text-align: center;
        z-index: 9;
    }
    .fixed_top .pr div{
        position: absolute;
        top: 14px;
        cursor: pointer;
    }
    .fixed_top .pr div:first-child span{
        color: #fff;
        cursor: pointer;
        padding: 20px;
        margin-top: -8px;
        font-size: 26px;
    }
    .fixed_top .pr div:last-child{
        width: 32px;
        height: 32px;
        border-radius: 50%;
        line-height: 30px;
        color: #fff;
        right: 20px;
    }
    .fixed_top .pr div:last-child span{
        font-size: 20px;
    }
    .zan{
        display: flex;
        margin-bottom: 20px;
    }
    .zan div img{
        width: 30px;
    }
    .zan div span{
        font-size: 13px;
        color: #999;
    }
    .zan div img{
        border-radius: 50%;
        margin-right: 15px;
        margin-top:5px;
    }
    .fy_page div:first-child p{
        font-size:12px;
        font-weight: bold;
        color:rgb(141, 78, 7);
        margin-bottom: 8px;
    }
    #page{
        margin:20px 25px;
    }
    .fy_page div:nth-child(3) p{
        font-size: 15px;
        margin-bottom: 20px;
        color:#484848;
    }
    .fy_page div:last-child{
        margin-bottom: 25px;
    }
    .fy_page div:last-child span:first-child{
        font-size: 14px;
        margin-right: 10px;
        color:#555555
    }
     .fy_page div:last-child span:last-child{
        font-size: 12px;
    }
    .fy_page h2{
        width:75%;
        margin-bottom: 20px;
    }
    .pl-title{
        display: flex;
        justify-content: space-between;
        margin-top:35px;
        margin-bottom:20px;
    }
    .pl-title span a{
        font-size: 13px;
        font-weight: 500;
        
        color:rgb(83, 134, 136);
    }
    .pl div:nth-child(2) div{
        display: flex;
        justify-content: space-between;
        font-size: 12px;
        margin-bottom: 4px;
    }
    .pl div:nth-child(2) div :first-child span:last-child{
        color:#999;
        margin-left: 10px;
    }
     .pl div:nth-child(2) div :last-child span:last-child{
        color:#666;
        margin-left:5px;
    }
    .pl .btn{
        width: 30%;
        padding:12px 0;
        margin-top:10px;
        margin-bottom:80px;
    }
    .pl .btn a{
        color:cadetblue;
        font-size: 14px;
    }
    .pl .plnra{
        color:#484848;
        font-size: 14px;
    }
    .tabbar{
        position: fixed;
        bottom:0;
        width: 100%;
        height: 60px;
        background: #fff;
        border-top: 1px solid #999;
        z-index: 111;
        display: flex;
        align-items: center;
        align-items: center;
        font-size: 12px;
        color:#999;
    }
    .tabbar div:first-child{
        border-bottom: 1px solid #999;
        padding-right:150px;
        padding-bottom:8px;
        margin:0 50px;
    }
    .tabbar div:last-child span:first-child{
        margin-right: 10px;
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
    .tcpl div:first-child{
        display: flex;
        justify-content: space-between;
        margin:25px 25px;
        font-size: 14px;
    }
    .tcpl div:nth-child(2){
        box-sizing: border-box;
        padding: 0 25px;
    }
    .tcpl div textarea{
        border: 0;
        outline: 0;
        font-size: 16px;
        width: 100%;
        height:70vh;
    }
     .plnrk{
        position: fixed;
        z-index: 200;
        top: 0;
        right:0;
        background: #fff;
        width: 0;
        height: 100%;
        transition:width .1s linear;  
    }
    .plnrk div.fh span{
        height: 60px;
        width: 100%;
        line-height: 60px;
        font-size: 25px;
        margin:0 20px;
    }
    .plnr{
        margin:5px 25px;
    }
    .plnrk .pl_bottom{
        padding-bottom: 20px;
        border-bottom: 1px solid #999;
    }
    .plnrk .plnr .plnrbt{
        border-bottom: 1px solid #999;
        display: flex;
        justify-content: space-between;
        padding-bottom: 20px;
        
    }
    .plnrk .plnr .plnrbt span:last-child{
        color:rgb(83, 134, 136);
    }
    .plnrk .pl_page{
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding:20px 0;
    }
    .plnrk .pl_page img{
        width: 40px;
        height:40px;
        border-radius: 50%;
        margin-right: 10px;
    }
    .plnrk .pl_page div:first-child{
        display: flex;
    }
    .plnrk .pl_page div div span:first-child{
        display: block;
        font-size:14px;
        color:#484848;
    }
    .plnrk .pl_page div div span:last-child{
        
        font-size:10px;
        color:#999;
    }
    .plnrk .pl_page div.dianzan span:first-child{
        color:#484848;
        font-size: 12px;
        margin-right: 10px;
    }
</style>
