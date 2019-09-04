<template>
    <div class="abstract">
        <router-link :to="`/HDetail/${hid}`" class="back"><span class="iconfont icon-arrow-left"></span></router-link>
        <div class="abstract_p">
            <h2>房源介绍</h2>
            <h3>摘要</h3>
            <div>
               {{data.detail}}
            </div>
        </div>
        
    </div>
</template>

<script>
export default {
    data() {
        return {
            data:[]
        }
    },
    created() {
        this.load();
    },
    methods: {
        load(){
            this.axios.get(
                "/house/hdetail",
                {
                    params:{
                        hid:this.hid
                    }
                }).then(res=>{
                    console.log(res.data.data[0][0]);
                    // 房源数据
                    this.data=res.data.data[0][0];
                });
        }
        
    },
    props:["hid"]

}
</script>

<style scoped>
    .abstract{
        color: #484848;
        font-size: 14px;
    }
    .back{
        display: inline-block;
        margin: 20px 0px 0 20px;
        font-size: 20px;
        font-weight: bold;
    }
    .abstract_p{
        margin: 20px 20px;
    }
    h2{
        margin-bottom: 30px;
    }
    h3{
        margin-bottom: 15px;
        font-size: 14px;
    }
    .abstract_p{
        padding-bottom: 20px;
        border-bottom: 1px solid #ddd;
    }
</style>
