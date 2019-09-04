<template>
    <div id="container">
        <div class="m-list">
            <div class="message"  v-for="(item,i) of list" :key="i">
                <div class="imga">
                    <router-link :to="`/Sdetal/1`"><img :src="images[0][2]" alt=""></router-link>
                    <span class="iconfont icon-dianzan1"></span>
                    <div>房源</div>
                </div>
                
                <p>{{item.subtitle}}</p><span>{{item.story_title}}</span>
                <div class="zan">
                    <div>
                         <img src="../../../public/images/story/tx.jpg" alt="">
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
            <div class="btn" @click="loadMore" v-if="pd==true">
                <a href="javascript:">显示更多故事</a>
            </div>
    </div>
    
</template>
<script>
export default {
    data() {
        return {
            list:[],
            pno:0,
            images:[],
            pd:true
        }
    },
    methods: {  
        loadMore(){
            var url="/story/story";
            this.pno++;
            var obj={pno:this.pno}
            this.axios.get(url,{params:obj}).then(res=>{
                var rows=this.list.concat(res.data.data);
                console.log(rows)
                if(res.data.data.length>0){
                    this.pd=true
                }else{
                    this.pd=false
                }
                this.list=rows;
                for(var i=0;i<this.list.length;i++){
                    this.images[i]=this.list[i].story_pic;
                    this.images[i]=this.images[i].split(",");
                }
            })
        },
    
    },
    created() {
        this.loadMore()
    },
    watch: {
        '$route'(){
            this.pno=0;
            this.data=[]
            this.list=[]
            this.images=[]
            this.pd=true
            this.loadMore()
        }
    },
}
</script>
<style scoped>
    #container{
        margin: 0px 20px 120px 20px;
    }
    .m-list{
        display: flex;
        justify-content: space-between;
        flex-flow:row wrap;
    }
    .message{
        width: 48%;
        margin-top:30px;
        font-size: 14px;
    }
    .message img{
        border-radius: 5px;
        width: 100%;
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
    .btn{
        border: 1px solid #008489;
        padding: 12px 0;
        text-align: center;
        border-radius: 5px;
        margin: 5% 5%;
    }
    .btn a{
        color:#008489;
        font-size: 14px;
        font-weight: bold;
    }
    .btn a:hover{
        color:#089ca1;
    }
</style>
