<template>
    <div class="hd">
        <!-- 头部 -->
        <div class="fixed_top">
            <div class="pr">
                <div @click="toH" ><span class="iconfont icon-zuo top_back"></span> </div>
                <span v-if="!wishBtn" @click="addWish" class="iconfont icon-aixin collect"></span>
                <span v-else @click="addWish" class="iconfont icon-aixin1 collect1"></span>
            </div>
        </div>
        <!-- 轮播图 -->
        <div style="height:240px;"> <carousel :pics="pics" :height="`240px`"/> </div>
        <!-- 基本信息 -->
        <div class="baseinfo base">
            <div class="title_top" v-cloak><b>{{data.city}}</b> · <b>{{data.h_type}}</b></div>
            <div class="title">{{data.title}}</div>
            <div class="info_tag">
                <ul class="tags">
                    <li class="green" :style="sh1">新房源</li>
                    <li class="green" :style="sh2">超赞房东</li>
                    <li class="orange">整套房子</li>
                    <li class="huise" v-for="(item,index) of tags" :key="index">{{item}}</li>
                </ul>
            </div>
        </div>
        <!-- 优惠模块 -->
        <div class="base youhui">
            <div class="youhui_bg">
                <div><img src="images/h_detail_notice.gif" alt=""></div>
                <div><b>{{data.h_b_discount}}</b>{{data.h_discount}}</div>
            </div>
        </div>
        <!-- 房源概览 -->
        <div class="base fangyuangailan">
            <h2>房源概览</h2>
            <div class="icon_notice">
                <ul>
                    <li><span class="iconfont icon-icon-p_lianxirenguanli"></span><i>{{data.h_info_member}}</i>位房客</li>
                    <li><span class="iconfont icon-woshi"></span><i>{{data.h_info_rooms}}</i>间卧室</li>
                    <li><span class="iconfont icon-woshi1"></span><i>{{data.h_info_beds}}</i>张床</li>
                </ul>
            </div>
            <div class="fygl_info">
                <HouseFygs :fygl="fygl"/>
            </div>
        </div>
        <!-- 摘要 -->
        <div class="abstract base">
            <h2>摘要</h2>
            <div>{{data.detail}}</div>
            <router-link :to="`/HDetail/abstract/${hid}`" class="abstract_view">查看详情</router-link>
        </div>
        <!-- 评价 -->
        <div class="remark base">
            <h2>评价</h2>
            <div class="remark_star_w">
                <div>   
                    <span class="remark_star"></span>
                    <span class="remark_star"></span>
                    <span class="remark_star"></span>
                    <span class="remark_star"></span>
                    <span class="remark_star"></span>
                </div>
            </div>
            <div class="remark_user">
                <div>
                    <img src="images/h_detail/01/01.jpg" class="remark_head_pic" alt="">
                    <div>
                        <p>{{runame}}</p>
                        <span>{{rr_time}}</span>
                    </div>
                </div>
                <div>
                    {{rr_remark}}
                </div>
                <router-link :to="`/HDetail/remark/${hid}`" class="remark_view">阅读全部评价</router-link>
            </div>
        </div>
        <!-- 房源位置 -->
        <div class="base h_local">
            <h2>房源位置</h2>
            <div class="h_local_info">
                <div>
                    <span>{{address1}}</span>
                </div>
                <span><img src="images/map_local.png" alt=""></span>
            </div>
            <div class="h_local_cont">
                {{address2}}
            </div>
        </div>
        <!-- 服务设施 -->
        <div class="server">
            <h2>设施/服务</h2>
            <div class="server_cont">
                <div class="server_type">
                    <div>
                        <span class="iconfont icon-mendianliebiao"></span>
                        入住服务
                    </div>
                    <ul>
                        <li>可预订长期住宿</li>
                        <li>独立入口</li>
                        <li>可以存放行李</li>
                    </ul>
                </div>
                <div class="server_type">
                    <div>
                        <span class="iconfont icon-wuxian"></span>
                        基础设施
                    </div>
                    <ul>
                        <li>空调</li>
                        <li>洗衣机</li>
                        <li>无线网络</li>
                        <li>暖气</li>
                    </ul>
                </div>
                <div class="server_type">
                    <div>
                        <span class="iconfont icon-yugang"></span>
                        洗浴设施
                    </div>
                    <ul>
                        <li>洗发水</li>
                        <li>吹风机</li>
                        <li>生活必需品</li>
                        <li>热水</li>
                    </ul>
                </div>
                <div class="server_type">
                    <div>
                        <span class="iconfont icon-canju"></span>
                        厨房用品
                    </div>
                    <ul>
                        <li>厨房</li>
                    </ul>
                </div>
                <!-- <router-link to="/HDetail/server" class="server_view">查看全部</router-link> -->
            </div>
        </div>
        <!-- 入住须知 -->
        <div class="base into_know">
            <h2>入住须知</h2>
            <div>
                <h3>入住与退房</h3>
                <span>{{data.h_enterleave_time}}</span>
            </div>
            <div>
                <h3>取消政策</h3>
                <div>{{data.h_cancel}}</div>
            </div>
            <div>
                <h3>入住须知</h3>
                <ul>
                    <li class="know_list">适合儿童(2-12岁)</li>
                    <li class="know_list">适合婴幼儿(2岁以下)</li>
                    <li class="know_list">允许举办派对和活动</li>
                    <li class="know_list">不允许携带宠物</li>
                    <li class="know_list">禁止吸烟</li>
                </ul>
            </div>
        </div>
        <!-- 底部 -->
        <div class="base bottom_bar">
            <div>
                <span>￥{{data.price}}<s>￥{{data.original_price}}</s><i>/晚</i></span>
            </div>
            <router-link :to="`/HDetail/reserve/${data.hid}`"  class="reserve">立即预定</router-link>
        </div>
    </div>
</template>
<script>
import Carousel from '../../components/carousel'
import HouseFygs from '../../components/hdetail/house_fygs'
export default {
    data() {
        return {
            st:240,
            data:[],
            remark:[],
            runame:"",
            rr_time:"",
            rr_remark:"",
            sh1:{
                display:"inline-block"
            },
            sh2:{
                display:"inline-block"
            },
            tags:[],
            fygl:[],
            address1:"",
            address2:"",
            reserve:[],
            pics:[],
            // 心愿单按钮
            wishBtn:false
        }
    },
    props:{
        hid:{default:""}
    },
    components:{
        Carousel,
        HouseFygs,
    },
    watch: {
        '$route'(){
            this.load()
        }
    },
    created() {
        window.addEventListener("scroll",this.watchScroll,false);
        this.load();
    },
    methods: {
        toH(){
            window.removeEventListener("scroll",this.watchScroll,false);
            this.$router.push({path:"/Home"})
        },
        addWish(){
            if(this.wishBtn){
                var data=new URLSearchParams();
                data.append("hid",this.hid)
                this.axios.post("/house/delhouseZan",data).then(res=>{
                    if(res.data.code>0){
                        this.load()
                    }
                    }
                ).catch(err=>{
                    console.log(err)
                })
            }else{
                var data=new URLSearchParams();
                data.append("hid",this.hid);
                this.axios.post(
                    "/house/houseZan",
                    data
                ).then(res=>{
                    if(res.data.code<0){
                        this.$toast({
                            message:"请先登陆账户",
                            duration:1000,
                            position:'middle'
                        })
                    }else{
                        this.load()
                    }
                }).catch(err=>{
                    console.log(err)
                })
            }
        },
        load(){
            this.axios.get(
                "house/hdetail",
                {
                    params:{
                        hid:this.hid
                    }
                }).then(res=>{
                    console.log(res);
                    // 房源数据
                    this.data=res.data.data[0][0];
                    // 房源评论
                    this.remark=res.data.data[1];
                    this.runame=this.remark[0].uname;
                    this.rr_time=this.remark[0].r_time;
                    this.rr_remark=this.remark[0].r_remark;
                    if(!this.data.new_house){this.sh2.display="none"}
                    if(!this.data.landlord){this.sh1.display="none"}
                    // 房源标签
                    this.tags=this.data.tags.split("/");
                    // 房源概览
                    this.fygl=this.data.h_subinfo.split(",");
                    this.fygl.pop();
                    // 地址
                    this.address1=this.data.addr_detail.split("/")[0];
                    this.address2=this.data.addr_detail.split("/")[1];
                    // 立即预定
                    this.reserve.push(this.data.price);
                    this.reserve.push(this.data.original_price);
                    this.reserve.push(this.data.original_price);
                    // 轮播图地址
                    this.pics=this.data.pic_address.split(",");
                    this.wishBtn=res.data.data[2]
                    console.log(this.wishBtn)
                });
            
        },
        watchScroll(){
            var top=Math.max(document.body.scrollTop || document.documentElement.scrollTop);
            var div=document.querySelector(".fixed_top");
            var topBack=document.querySelector(".top_back");
            var topLike=document.querySelector(".collect");
            if(top<240){
                div.style.position="absolute";
                div.style.top=0;
                div.style.background="transparent";
                div.style.height="60px";
                div.style.boxShadow="none";
                topBack.style.color="#fff";
                if(!this.wishBtn){
                    topLike.style.color="#fff";
                }
            }else if(top>this.st && top>240){
                div.style.height="0px"
            }else if(top<this.st && top>240){
                div.style.position="fixed";
                div.style.top=0;
                div.style.background="#fff";
                div.style.height="60px";
                div.style.boxShadow=" 0 0 10px 0 rgba(0, 0, 0, .3)";
                topBack.style.color="#484848";
                if(!this.wishBtn){
                    topLike.style.color="#484848";
                }
                
            }
            this.st=top+1;
        },
    },
}
</script>
<style scoped>
    .hd{
        background: #F2F2F2 !important;
        color: #484848;
        font-size: 14px;
        width: 100%;
        box-sizing: border-box;
        overflow:hidden
        }
    .collect{
        display: inline-block;
        position: absolute;
        right: 5%;
        top:10px;
        padding: 8px;
        color: #f8f8f8;
        z-index: 98;
    }
    .collect1{
        display: inline-block;
        position: absolute;
        right: 5%;
        top:10px;
        padding: 8px;
        color: #FF5A5F;
        z-index: 98;
    }
    .fixed_top{
        position: absolute;
        background: transparent;
        width: 100%;
        height: 60px;
        z-index: 9;
        transition: all .3s linear;
        overflow: hidden;
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
    .fixed_top .pr div:first-child{
        left: 20px;
        color: #fff;
        cursor: pointer;
        padding: 8px;
        margin-top: -8px;
        font-size: 20px;
    }
    .fixed_top .pr div:first-child span{
        font-size: 20px;
        display: inline-block;
        font-weight: bold;
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
    /* 房源基本信息 */
    .base{
        padding: 16px 5%;
        background: #fff;
        color: #484848;
    }
    .base h2{
        font-size: 18px;
        margin-bottom: 20px;
    }
    .baseinfo{
        color: #484848;
    }
    .title_top{
        color: #341e13;
        font-size: 12px;
        margin-bottom: 4px;
    }
    .title{
        color: #484848;
        font-size: 18px;
        margin-bottom: 8px;
        font-weight: bold;
    }
    .info_tag .tags{
        padding-bottom: 16px;
        color: #484848;
    }
    .info_tag .tags li{
        padding: 6px 10px;
        font-size: 12px;
        line-height: 16px;
        font-weight: bold;
        height: 28px;
        box-sizing: border-box;
        display: inline-block;
        border-radius: 4px;
        margin-top: 4px; 
    }
    .info_tag .tags li~li{
        margin-left: 4px;
    }
    .info_tag .tags li.green{
        background: #EAF7EA !important;
        color: #296E00 !important;
    }
    .info_tag .tags li.orange{
        background: #f7f3ea !important;
        color: #8A2400 !important;
    }
    .info_tag .tags li.orange ~li{
        background: #F2F2F2 !important;
    }
    /* 优惠内容 */
    .hd .youhui{
        margin-top: 1px;
    }
    .hd .youhui .youhui_bg{
        padding: 8px;
        display: flex;
        align-items: center;
        box-sizing: border-box;
    }
    .hd .youhui .youhui_bg div{
        margin: 0 10px;
    }
    .hd .youhui .youhui_bg div img{
        width: 24px;
        background: transparent;
        vertical-align: middle;
    }
    /* 房源概览 */
    .fangyuangailan{
        margin-top: 5px;
    }
    .fangyuangailan .icon_notice ul{
        display: flex;
    }
    .fangyuangailan .icon_notice ul li span{
        display: block;
        text-align: center;
        margin-bottom: 5px;
    }
    .fangyuangailan .icon_notice ul li~li{
        margin-left: 20px;
    }
    /* 摘要 */
    .abstract{
        margin-top: 1px;
        font-size: 14px;
    }
    .abstract div{
        overflow: hidden;
        text-overflow:ellipsis;
        white-space: nowrap;
    }
    .abstract .abstract_view{
        color: #008489;
        display: inline-block;
        margin-top: 16px;
    }
    
    /* 评论 */
    .remark{
        margin-top: 5px;
    }
            /* 这里来判断调整显示的星级 */
    .remark .remark_star_w{
        width: 75px;
        height: 15px;
        overflow: hidden;
        margin-top: -10px;
    }
    .remark .remark_star_w div{
        width: 75px;
        height: 15px;                                                                                                        
    }
    .remark .remark_star_w div .remark_star{
        display: inline-block;
        width: 15px;
        height: 15px;
        background: url("../../../public/images/remark_star.png") repeat-x;
        background-size: cover;
    }
    .remark .remark_user{
        display: flex;
        flex-flow: column nowrap;
    }
    .remark .remark_user div:nth-child(1){
        display: flex;
        flex-flow: row nowrap;
        margin-top: 20px;
    }
    .remark .remark_user div:nth-child(1) img{
        width: 30px;
        height: 30px;
        border-radius: 50%;
        vertical-align: middle;
    }
    .remark .remark_user div:nth-child(1) div{
        margin-left: 12px;
        margin-top: -2px;
    }
    .remark .remark_user div:nth-child(1) div p{
        font-size: 14px;
        font-weight: bold;
    }
    .remark .remark_user div:nth-child(1) div span{
        font-size: 12px;
    }
    .remark .remark_user div:nth-child(2){
        font-size: 16px;
        padding-bottom: 16px;
    }
    .remark .remark_user .remark_view{
        color: #008489;
        display: inline-block;
        margin-top: 16px;
    }
    /* 房源位置 */
    .h_local{
        margin-top: 5px;
    }
    .h_local .h_local_info{
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    .h_local .h_local_info img{
        vertical-align: middle;
        margin-right: 20px;
    }
    .h_local .h_local_cont{
        margin-top: 20px;
        text-indent: 28px;
    }
    /* 服务设施 */
    .server{
        margin-top: 5px;
        font-size: 14px;
        padding: 16px 0px;
        background: #fff;
        color: #484848;
    }
    .server h2{
        font-size: 18px;
        padding: 0 24px;
    }
    .server .server_type{
        border-bottom: 1px solid #ddd;
        padding: 10px 24px;
        display: flex;
    }
    .server .server_cont .server_type:nth-child(4){
        border-bottom: 0;
    }
    .server .server_type div:nth-child(1){
        display: inline-block;
        font-size: 10px;
        font-weight: bold;
    }
    .server .server_type div:nth-child(1) span{
        display: block;
        text-align: center;
        font-size: 25px;
        font-weight: 500;
    }
    .server .server_type ul{
        padding: 5px 0;
        display: flex;
        flex-flow: column wrap;
        justify-content: space-between;
        align-items: stretch;
        height: 30px;
        margin-left: 30px;
    }
    .server .server_type ul li{
        background: url("../../../public/images/right.png") no-repeat left;
        background-size: contain;
        padding-left: 20px;
        font-size: 12px;
        width: 120px;
        text-overflow: ellipsis;
        overflow: hidden;
    }
    .server .server_cont .server_view{
        color: #008489;
        display: inline-block;
        margin-left: 24px;
    }
    /* 入住须知 */
    .into_know{
        margin-top: 5px;
        margin-bottom: 60px;
    }
    .into_know div h3{
        font-size: 14px;
    }
    .into_know div:nth-child(2) span{
        font-size: 13px;
        display: inline-block;
        margin: 10px 0;
    }
    .into_know div div{
        font-size: 13px;
        margin: 10px 0;
    }
    .into_know div:nth-child(4) ul{
        font-size: 12px;
        margin: 10px 0;
        display: flex;
        flex-flow: row wrap;
    }
    /* 入住须知里的勾勾背景和叉叉背景样式 */
    .into_know div:nth-child(4) ul li.know_list{
        background: url("../../../public/images/right.png") no-repeat left;
        background-size: contain;
        padding-left: 20px;
        width:50%;
        margin-top: 5px;
        box-sizing: border-box;
    }
    .into_know div:nth-child(4) ul li.nknow_list{
        background: url("../../../public/images/right.png") no-repeat left;
        background-size: contain;
        padding-left: 20px;
        width:50%;
        margin-top: 5px;
        box-sizing: border-box;
    }

    /* 底部模块 */
    .bottom_bar{
        position: fixed;
        bottom: 0;
        width: 100vw;
        box-shadow: 0 0 10px 0 rgba(0, 0, 0, .3);
        height: 65px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        box-sizing: border-box;
        z-index: 99;
    }
    .bottom_bar div:first-child span{
        font-size: 22px;
    }
    .bottom_bar div:first-child span s{
        font-size: 12px;
    }
    .bottom_bar div:first-child span i{
        font-size: 14px;
    }
    .bottom_bar .reserve{
        background: #ff5a5f;
        color: #fff;
        width: 160px;
        height: 48px;
        text-align: center;
        line-height: 48px;
        border-radius: 4px;
        font-size: 16px;
        cursor: pointer;
    }
</style>
