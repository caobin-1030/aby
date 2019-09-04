<template>
    <div class="nav_bar">
             <mt-tab-container v-model="selected">
                <mt-tab-container-item id="d1">
                    <Index/>
                </mt-tab-container-item>
                <mt-tab-container-item id="d2">
                    <Wish/>
                </mt-tab-container-item>
                <mt-tab-container-item id="d3">
                    <story/>
                </mt-tab-container-item>
                <mt-tab-container-item id="d4">
                    <div :class="{'USH1':SH}"><Login/></div>
                    <div :class="{'USH2':!SH}"><Me/></div>
                </mt-tab-container-item>
            </mt-tab-container>
        <mt-tabbar v-model="selected" fixed>
            <mt-tab-item id="d1">
                <p class="iconfont icon-iconset0157 "></p>
                探索
            </mt-tab-item>
            <mt-tab-item id="d2">
                 <p class="iconfont icon-aixin "></p>
                心愿单
            </mt-tab-item>
            <mt-tab-item id="d3">
                 <p class="iconfont icon-zhiwu "></p>
                故事
            </mt-tab-item>
            <mt-tab-item id="d4">
                <div>
                    <p class="iconfont icon-sousuo "></p>
                    我的
                </div>
                
        </mt-tab-item>
</mt-tabbar>
    </div>
</template>
<script>
import {mapState} from 'vuex'
import Index from './index/index'
import Story from "./story.vue"
import Login from "./Login.vue"
import Wish from "./Wish.vue"
import Me from './Me.vue'
export default {
    data() {
        return {
            selected:"d1",
            new_h_data:[],
            SH:false
        }
    },
    created() {
        this.getLogin()
    },
    methods: {
        getUid(){
            if(this.uid>=0){
                this.SH=true
            }else{
                this.SH=false
            }
        },
        getLogin(){
            this.axios.get(
                "/user/getUser"
            ).then(res=>{
                if(res.data.code>0){
                    this.$store.dispatch("upUid")
                }else{
                    this.$store.dispatch("downUid")
                }
                this.getUid();
            }).catch(err=>{console.log(err)})
        }
    },
    components:{
        Story,
        Wish,
        Me,
        Index,
        Login
    },
    computed: {
        ...mapState({
            uid:state=>state.uid
        })
    },
    watch: {
        uid(){
            this.getUid();
        }
    },
}
</script>
<style scoped>
.mint-tabbar{
    height: 60px;
   display: flex;
   align-items: center;
   border-top: 1px solid #999;
}
.mint-tabbar > .mint-tab-item.is-selected{
    color:#f00;
    background: #fff;
}
.USH1{
    display:none
}
.USH2{
    display:none
}
.mint-tabbar > .mint-tab-item.is-selected div p{
    color:#f00;
}
.mint-tab-item-label p:first-child{
    font-size: 22px;
    margin-bottom: 5px;
    color:#484848;
}
.mint-tab-item-label p.icon-zhiwu{
    font-size: 28px;
    margin-bottom: 2px;
    color:#484848;

}
mint-tab-item {
    font-size:30px !important;
}
</style>
