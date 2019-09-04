<template>
    <div>
        <div class="fh">
            <span class="iconfont icon-zuo"></span>
            <span>保存</span>
        </div>
        <div class="u_pic" @click="pic">
            <img src="../../public/images/story/tx.jpg" alt=""> 
        </div>
        
        <ul>
            <li>
                <p>昵称</p>
                <input type="text" placeholder="wx ，">
            </li>
             <li>
                <p>姓名</p>
                <input type="text">
            </li>
             <li>
                <p>名字</p>
                <input type="text">
            </li>
             <li>
                <p>性别</p>
                <input type="radio" name="sex" checked><label for="sex">男</label>
                <input type="radio" name="sex"><label for="sex">女</label>
            </li>

             <li>
                <p>出生日期</p>
                <input type="text" @click="openPicker()" >
            </li>
             <li>
                <p>电子邮箱</p>
                <input type="text">
            </li>
            <li>
                <p>手机</p>
                <input type="text">
            </li>
        </ul>
        <div>
            <mt-datetime-picker
                    ref="picker"
                    type="date"
                    v-model="pickerValue">
            </mt-datetime-picker>
        </div>
        <div>
            <mt-actionsheet
                :actions= "actions"
                v-model="sheetVisible">
            </mt-actionsheet>
        </div>
    </div>
</template>
<script>
export default {
    data() {
        return {
            pickerValue:false,
            pickerVisible:true,
            sheetVisible:false,
            actions:[{
                name:"拍照",
                method:this.getCamera
            },
            {
                name:"从相册中选择",
                method:this.getLibrary
            }]

        }
    },
    methods: {
        pic:function(){
            this.sheetVisible=true;
        },
        getCamera:function(){
            console.log(1)
        },
        getLibrary:function(){
            console.log(2)
        },
        openPicker(){
            this.$refs.picker.open();
        },

    },
}
</script>
<style scoped>
    .fh{
        color:#484848;
        height: 60px;
        position: fixed;
        top: 0;
        left: 0;
        display: flex;
        justify-content: space-between;
        width: 100%;
        line-height: 60px;
        background: #fff;
    }
    .fh span:first-child{
        font-size: 24px;
        margin-left: 5%;
    }
    .fh span:last-child{
        font-size: 14px;
        margin-right: 5%;
    }
    .u_pic{
        background: #ddd;
        text-align: center;
        margin-top: 60px;
    }
    ul{
        margin: 5%;
        font-size: 14px;
        color:#484848;
    }
    ul li{
        border-bottom: 1px solid #ddd;
          padding-bottom: 20px;
       
    }
    ul li input{
        border: 0;
        font-size: 20px;
        margin-top: 10px;
       outline: 0;
    }
</style>
