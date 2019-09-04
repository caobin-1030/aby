<template>
    <div>
        <div class="xyd_dl" :class="{'divSH':SH}">
            <div id="nav">
                <mt-navbar v-model="selected">
                    <mt-tab-item id="d1">房源</mt-tab-item>
                    <mt-tab-item id="d2">故事</mt-tab-item>
                </mt-navbar>
            </div> 
            <div id="nav-page">
             <mt-tab-container v-model="selected">
                <mt-tab-container-item id="d1">
                    <div class="collect_h" :class="{'divSH':!SH}">暂无收藏</div>
                    <div :class="{'divSH':SH}">
                        <router-link :to="`/HDetail/${item.hid}`"  v-for="(item,i) of data" :key="i">
                        <div class="for-car">
                            <div class="for-carousel"><carousel :height="`180px`" :pics="images[i]"></carousel></div>
                            <div class="for-xia">
                                <p class="h_type">{{item.h_type}}·{{item.city}}</p>
                                <p class="title">{{item.title}}</p>
                                <p class="pingjia">*****<span>45</span>条评论</p>
                                <hr>
                                <p class="price">￥<span>{{item.price}}</span>/晚</p>
                            </div>
                        </div>
                        </router-link>
                    </div>
                </mt-tab-container-item>
                <mt-tab-container-item id="d2">
                    <div class="collect_s" :class="{'divSH':!sWish}">暂无故事</div>
                    <div :class="{'divSH':sWish}">
                        <div class="message"  v-for="(item,i) of sData" :key="i">
                            <div class="imga">
                                <router-link :to="`/Sdetal/${item.storyid}`"><img :src="sImages[i][0]" alt=""></router-link>
                                <span class="iconfont icon-dianzan1"></span>
                                <div>房源</div>
                            </div>
                            
                            <p>{{item.subtitle}}</p><span>{{item.story_title}}</span>
                            <div class="zan">
                                <div>
                                    <img src="``" alt="">
                                </div>
                                <div>
                                    <span class="iconfont icon-dianzan1"></span>
                                    <span>{{item.zan}}</span>
                                </div>
                                <div>
                                    <span class="iconfont icon-message-fill"></span>
                                    <span>70</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </mt-tab-container-item>
            </mt-tab-container>
        </div>
        </div>
        <div class="xyd" :class="{'divSH':!SH}">
            <div class="xyd_wdl">
                <h1>心愿单</h1>
                <p>爱彼迎，查看你的心仪房源、体验与故事</p>
                <img src="../../public/images/xyd.png" alt="">
                <div>
                <router-link to="/Login1" :class="{'divlSH':lSH}">登录</router-link>
                </div>
            </div>
        </div>
    </div>
    
</template>
<script>
import {mapState} from 'vuex'
import carousel from "../components/carousel"
export default {
    data() {
        return {
            selected:"d1",
            SH:true,
            lSH:true,
            sWish:true,
            data:[],
            images:[],
            sData:[],
            sImages:[],
        }
    },
    created() {
        this.load()
        this.getState()
    },
    watch: {
        uid(){
            this.getState();
            this.load()
        },
        '$route'(){
            this.load()
        }
    },
    computed: {
        ...mapState({
            uid:state=>state.uid
        })
    },
    methods: {
        load(){
            this.axios.get(
                "/house/getWishHouse"
            ).then(res=>{
                this.data=res.data;
                if(this.data.code>0){
                    this.SH=false
                    this.data=res.data.data
                    for(var i=0;i<this.data.length;i++){
						this.images[i]=this.data[i].pic_address.split(",")
					}
                }else{
                    this.SH=true
                }
            })
            this.axios.get(
                "/story/getStoryWish"
            ).then(res=>{
                console.log(res.data)
                if(res.data.code>0){
                    this.sWish=false
                    this.sData=res.data.data;
                    for(var i=0;i<this.sData.length;i++){
                        this.sImages[i]=this.sData[i].story_pic.split(",");
                    }
                }else{
                    this.sWish=true;
                }
            })
        },
        getState(){
            if(this.uid>=0){
                this.lSH=true
            }else{
                this.lSH=false
            }
        }
    },
    components:{
        carousel
    }
}
</script>
<style scoped>
.mint-navbar{
    width: 100% !important;
}
.mint-navbar .mint-tab-item{
    display: block;
    font-size: 14px !important;
    height: 40px !important;
    padding-top: 13px !important;
}
.collect_h,.collect_s{
    text-align: center;
    margin-top: 30px;
}
.divSH{
    display: none;
}
.divlSH{
    display: none;
}
    .xyd{
        margin:5%;
    }
    .xyd_wdl h1{
        font-size: 24px;
        font-family: Circular, "PingFang-SC";
        font-weight: bold;
    }
    .xyd_wdl p{
        color:#484848;
        margin:3% 0;
        font-size: 16px;
    }
    .xyd_wdl img{
        width: 80%;
        margin-bottom: 5%;
    }
    .xyd_wdl a{
        font-size: 14px;
        color:#008489;
        font-weight: bold;
        padding: 8px 20px;
        border: 2px solid #008489;
        border-radius: 5px;
    }
    .xyd_fh{
        border-bottom: 1px solid #999;
    }
    .xyd_fh span{
        line-height: 60px;
        font-size: 30px;
        margin:0 3%;
    }
    .mint-navbar .mint-tab-item.is-selected {
    border-bottom: 2px solid #008489;
    color: #008489;
    }
    .mint-navbar{
        width: 40%;
    }
    .for-car{
        padding:20px 5%;
    }
    .for-xia{
        margin:20px 5% 0;
	}
	hr{
		color: #eee;
	}
	.h_type{
		font-size: 8px;
		color: sienna;
		margin-left: 10px;
	}
	.title{
		text-overflow: ellipsis;
		overflow: hidden;
		margin-top: 8px;
		margin-left: 10px;

	}
	.price{
		font-size: 14px;
		margin-top: 10px;
		display: inline-block;
		margin-left: 10px;
		margin-bottom: 10px;
	}
	.price>span{
		font-weight: 700;
	}
    .message{
        width: 100%;
        font-size: 14px;
        padding: 20px 5%;
        box-sizing: border-box;
    }
    .message img{
        width: 100%;
        height: 180px;
    }
    .message p{
        display: inline;
        margin-right: 8px;
        font-weight: bold;
    }
    .zan{
        display: flex;
        align-items: center;
    }

    .zan div img{
        border-radius: 50%;
         width: 22px;
        margin-right: 15px;
        margin-top:5px;
    }
    .zan div~div span:first-child{
        color:#666;
        font-size: 14px;
        vertical-align: middle;
        margin:0 2px;
    }
      .zan div~div span:last-child{
        color:#000;
        font-size:12px;
    }
    .imga{
        position: relative;
    }
    .imga span{
        position: absolute;
        top:10px;
        right:10px;
        font-size: 20px;
        color:#fff;
    }
    .imga div{
        position: absolute;
        bottom:13px;
        right:10px;
        background: #fff;
        padding: 4px 12px;
        border-radius: 3px;
        font-size:10px;
    }
</style>
