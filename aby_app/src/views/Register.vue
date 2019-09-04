<template>
    <div>
        <router-link :to="`/Home`" class="back"><span class="iconfont icon-arrow-left"></span></router-link>
        <div class="login">
            <div>
                <h1>账号密码注册</h1>
                <div>
                <span>用户名</span>
                <input type="text" id="phone"> 
                </div>
                <div>
                    <span>密码</span>
                    <input type="password" id="upwd">
                </div>
                  <div>
                    <span>确认密码</span>
                    <input type="password" id="upwd1">
                </div>
                <div class="btn">
                    <a href="javascript:" @click="reg()">立即注册</a>
                </div>
                <div class="reg_btn">
                    <router-link  to="/Home" class="toLogin"><span>已有账号,请登录?</span></router-link>
                </div>
            </div>
        </div>
    </div>
    
</template>
<script>
export default {
    data() {
        return {
            
        }
    },
    methods: {
        reg(){
            console.log(!phone.value)
            if(!!phone.value && !!upwd.value && !!upwd1.value && upwd.value==upwd1.value){
                var data=new URLSearchParams();
                data.append('uname',phone.value);
                data.append('upwd',upwd.value);
                this.axios.post(
                    "/user/reg",
                    data
                ).then(res=>{
                    console.log(res)
                    if(res.data.code>0){
                        this.$router.push("/Home")
                    }else{
                        
                    }
                }).catch(err=>{
                    console.log(err)
                })
            }
        }
    },
}
</script>
<style scoped>
    h1{
        font-size:28px;
    }
    .login{
        margin:16px 5%;
        color: #484848;
    }
    .login p{
        
        font-size: 15px;
        margin: 2% 0;
    }
    .login .toLogin{
        display: block;
        font-size: 14px;
        margin-top: 20px;
        color: #484848;
    }
    .login div  div span{
        display: block;
        font-size: 14px;
        margin-top: 20px;
    }
    .login div  div input{
        border:0;
        outline: 0;
        border-bottom: 1px solid #999;
        width: 100%;
        line-height: 40px;
        color: #484848;
    }
    .login div.btn{
        border:1px solid #008489;
        background:#008489 ;
        text-align: center;
        padding: 3% 0;
        border-radius: 5px;
        margin-top:10%;
    }
    .login div  div a{
        color:#fff;
        font-size: 14px;
    }
    .login div.reg_btn{
        text-align: right;
    }
    .back{
        display: inline-block;
        margin: 20px 0px 0 20px;
        font-size: 20px;
        font-weight: bold;
    }
</style>
