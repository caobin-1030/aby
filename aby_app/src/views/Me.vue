<template>
    <div class="container">
        <div class="updata_me">
            <div>
                <h1>冰杖</h1>
                <p @click="toUpdate">查看并编辑个人资料</p>
            </div>
            <img src="../../public/images/story/tx.jpg" alt="">
        </div>
        <div class="dd">
            订单中心
        </div>
        <div @click="logOut">
            <a href="javascript:">退出登录</a>
        </div>
    </div>
</template>
<script>

export default {
    methods: {
        toUpdate(){
            this.$router.push("/MeUpdate")
        },
        logOut(){
            this.axios.get(
                "/user/logout"
            ).then(res=>{
                console.log(res)
                this.$store.dispatch("downUid");
            }).catch(err=>{

            })
            
        }
    },
    
}
</script>
<style scoped>
.container{
    margin:10% 5%;
}
.updata_me{
    display: flex;
    justify-content: space-between;
    align-items: center;
}
.updata_me div p{
    font-size: 14px;
    margin-top: 10px;
    color:#008489;
}
.updata_me img{
    width: 20%;
    height: 20%;
    border-radius: 50%;
}
.dd{
    border-top: 1px solid #ddd;
    border-bottom: 1px solid #ddd;
    padding:5% 0;
    margin: 20% 0;
    color:#484848;
    font-size:14px;
}
a{  
    display: block;
    background: #f00;
    color:#fff;
    font-weight: bold;
    width: 100%;
    font-size: 14px;
    text-align: center;
    padding: 4% 0;
    border-radius: 5px;

}
</style>
