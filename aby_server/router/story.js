const express=require("express");
var router=express.Router();
const pool=require("../pool");


//故事详情
router.get("/sdetail",(req,res)=>{
    var storyid=req.query.storyid;
    var data=[];
    var sql=`select * from aby_story where storyid=?`;
    pool.query(sql,[storyid],(err,result)=>{
        if(err) throw err;
        if(result.length){
            data[0]=result;
            var sql=`select * from aby_storyremark where storyid=? group by r_time desc`;
            pool.query(sql,[storyid],(err,result)=>{
                if(err) throw err;
                if(result.length){
                    data[1]=result;
                    res.send({code:1,msg:"查询成功",data:data});
                }});
        }else{
            res.send({code:-1,msg:"查询失败",data:""});
        }
    })
});
//分页查询商品的列表
router.get("/story",(req,res)=>{
    var p=req.query.pno;
    var ps=req.query.pagesize;
    if(!p){p=1}
    if(!ps){ps=4}
    var offset=(p-1)*ps;
    ps=parseInt(ps);
    var sql="SELECT subtitle,story_title,story_pic,zan FROM aby_story LIMIT ?,?";
    pool.query(sql,[offset,ps],(err,result)=>{
        if(err)throw err;
        res.send({code:1,msg:"查询成功",data:result})
    })
})
//故事心愿单查询
router.get("/getStoryWish",(req,res)=>{
    var uid=req.session.uid;
    if(!uid){
        res.send({code:-2,msg:"请先登陆账户",data:""});
        return;
    }
    var sql="select * from aby_wish_content inner join aby_story on aby_wish_content.storyid=aby_story.storyid where uid=?";
    pool.query(sql,[uid],(err,result)=>{
        if(err)throw err;
        if(result.length){
            res.send({code:1,msg:"查询成功",data:result})
        }else{
            res.send({code:-1,msg:"查询心愿单故事失败",data:""})
        }
    })
})
//添加评论
router.get("/addremark",(req,res)=>{
    var uid=req.session.uid;
    var storyid=req.query.storyid
    var r_time=new Date().getFullYear()+'年'+(new Date().getMonth()+1)+'月'+new Date().getDate()+'日'
    var r_remark=req.query.r_remark
    console.log(r_time)
    if(!uid){
        res.send({code:-2,msg:'请先登录账户'})
        return;
    }else{
        var sql="select uname from aby_user where uid=?"
        pool.query(sql,[uid],(err,result)=>{
            if(err)throw err
            console.log(result[0].uname)
            var uname=result[0].uname
            var sql="INSERT INTO aby_storyremark VALUES(null,?,?,?,?) "
            pool.query(sql,[storyid,uname,r_time,r_remark],(err,result)=>{
                if(err) throw err;
                res.send({code:1,msg:"添加成功"})
             })
        })
    }
    
})


module.exports=router;