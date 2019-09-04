<template>
    <div>
        <div class="reserve">
            <div class="topback base">
                <router-link :to="`/HDetail/${data.hid}`"><span class="iconfont icon-chacha"></span></router-link>
            </div>
            <div class="top_info base">
                <div>
                    <div>{{data.h_type}}</div>
                    <div>
                        <span>￥{{data.price}}<s>￥{{data.original_price}}</s><i>/晚</i></span>
                    </div>
                </div>
                <img src="images/h_detail/01/01.jpg" alt="">
            </div>
            <div class="base date_time">
                入住离房日期
            </div>
            <div class="base cost">
                <div class="title">费用和税收明细</div>
                <div>
                    <span><i>￥{{data.price}}</i> x <i>1</i>晚</span>
                    <span>￥{{data.price}}</span>
                </div>
                <div>
                    <span>特惠<i>{{data.h_zhekou}}</i>折</span>
                    <span>-￥{{(data.price*(10-data.h_zhekou)*0.1).toFixed(2)}}</span>
                </div>
                <div>
                    <span>清洁费</span>
                    <span>￥10</span>
                </div>
                <div>
                    <span>服务费：减免<i>￥{{data.h_server_price}}</i></span>
                    <span>￥0</span>
                </div>
            </div>
            <div class="base total">
                <span><b>总价</b></span>
                <span><b>￥{{data.price-(data.price*(10-data.h_zhekou)*0.1).toFixed(2)+10}}</b></span>
            </div>
            <div class="base">
                <router-link @click="order" to="" class="order">预定</router-link>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    props:["hid"],
    data() {
        return {
            data:[]
        }
    },
    created() {
        this.load()
    },
    methods: {
        load(){
            this.axios.get(
                "/house/hdetail",
                {params:{
                    hid:this.hid
                }}
            ).then(res=>{
                console.log(res.data.data[0][0])
                this.data=res.data.data[0][0]
            }).catch(err=>{
                console.log(err)
            })
        },
        order(){
            // 预定按钮
        }
    },
}
</script>
<style scoped>
    .reserve{
        box-sizing: border-box;
        color: #484848;
        font-size: 16px;
        background: #f2f2f2;
    }
    .base{
        background: #fff;
        margin-top: 1px;
        padding: 16px 5%;
    }
    .topback{
        font-size: 12px;
        font-weight: bold;
    }
    .top_info{
        display: flex;
        justify-content: space-between;
        align-items: center;
        font-size: 12px;
    }
    .top_info div div:first-child{
        color: #531210;
    }
    .top_info div div:nth-child(2){
        font-size: 16px;
        margin-top: 8px;
    }
    .top_info div div:nth-child(2) s{
        font-size: 12px;
    }
    .top_info div div:nth-child(2) i{
        font-size: 13px;
    }
    .top_info img{
        width: 108px;
        height: 72px;
    }
    /* 日期时间 */
    .date_time{

    }
    .cost{

    }
    .cost .title{
        font-size: 12px;
        font-weight: bold;
    }
    .cost .title~div{
        margin-top: 15px;
        display: flex;
        justify-content: space-between;
    }
    /* 总价 */
    .total{
        display: flex;
        justify-content: space-between;
    }
    /* 预定 */
    .order{
        display: block;
        width: 90%;
        height: 48px;
        text-align: center;
        line-height: 48px;
        background: #ff5a5f;
        border-radius: 4px;
        color: #fff;
        font-weight: bold;
        position: absolute;
        bottom: 20px;
    }
</style>
