<template>
    <div>
        <div style="height:20px"></div>
        <div class="login">
            <div>
                <h1>账号密码登录</h1>
                <div>
                <span>用户名</span>
                <input type="text" id="uname"> 
                </div>
                <div>
                    <span>密码</span>
                    <input type="password" id="upwd">
                </div>
                <div class="btn">
                    <a href="javascript:" @click="Login">立即登录</a>
                </div>
                <div class="reg_btn">
                    <router-link  to="/Register" class="toReg"><span>立即注册?</span></router-link>
                </div>
            
            </div>
        </div>
    </div>
    
</template>
<script>
import {mapState} from 'vuex'
export default {
    data() {
        return {
            
        }
    },
    computed: {
        ...mapState({
            uid:state=>state.uid
        })
    },
    methods: {
        Login(){
                if(!!uname.value && !!upwd.value){
                    this.axios.get(
                        "/user/login",{
                        params:{
                            uname:uname.value,
                            upwd:upwd.value
                        }}
                    ).then(res=>{
                        console.log(res)
                        if(res.data.code>0){
                            this.$store.dispatch("upUid")
                            uname.value=""
                            upwd.value=""
                        }else{
                            this.$toast({
                                message:res.data.msg
                            })
                        }
                        
                    }).catch(err=>{
                        console.log(err)
                    })
                }else{
                    this.$toast({
                        message:"用户名密码不能为空"
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
    .login .toReg{
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
