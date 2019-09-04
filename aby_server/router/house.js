const express=require("express");
var router=express.Router();
const pool=require("../pool");

//房源详情
router.get("/hdetail",(req,res)=>{
    var hid=req.query.hid;
    var uid=req.session.uid;
    var sql=`select * from aby_house inner join aby_Tags on aby_house.hid=aby_Tags.hid where aby_house.hid=?`;
    pool.query(sql,[hid],(err,result)=>{
        if(err) throw err;
        var data=[];
        data.length=2;
        if(result.length){
            data[0]=result;
            sql=`select * from aby_remark where hid=?`;
            pool.query(sql,[hid],(err,result1)=>{
                if(err) throw err;
                if(result1.length>0){
                    data[1]=result1;
                    if(!uid){
                        res.send({code:1,msg:"查询成功",data:data});
                        return;
                    }
                    sql=`select * from aby_wish where uid=? and hid=?`;
                    pool.query(sql,[uid,hid],(err,result1)=>{
                        if(err) throw err;
                        if(result1.length){
                            data[2]=true;
                            res.send({code:1,msg:"查询成功",data:data});
                        }else{
                            data[2]=false;
                            res.send({code:1,msg:"查询成功",data:data});
                        }
                    }) 
                }else{
                    data[1]=[];
                    res.send({code:1,msg:"查询成功",data:data});
                }
            })
        }else{
            res.send({code:-1,msg:"查询失败",data:""});
        }
    })
});
// 查询评论
router.get("/remark",(req,res)=>{
    var hid=req.query.hid;
    var sql=`select * from aby_remark where hid=?`;
    pool.query(sql,[hid],(err,result)=>{
        if(err) throw err;
        if(result.length>0){
            res.send({code:1,msg:"查询成功",data:result});
        }else{
            res.send({code:-1,msg:"查询失败",data:""});
        }
    })
})
//查询所有房源按时间倒序 每次查询4条
router.get("/houseByTime",(req,res)=>{
    var p=req.query.pno;
    var ps=req.query.pagesize;
    if(!p){p=1}
    if(!ps){ps=4}
    var offset=(p-1)*ps;
    ps=parseInt(ps);
    var sql=`select * from aby_house group by create_h_time desc  limit ?,?`;
    pool.query(sql,[offset,ps],(err,result)=>{
        if(err) throw err;
        if(result.length>0){
            res.send({code:1,msg:"查询成功",data:result});
        }else{
            res.send({code:-1,msg:"查询失败",data:""});
        }
    })
});
//查询所有房源倒序 每次查询9条
router.get("/houseByArea",(req,res)=>{
    var p=req.query.pno;
    var ps=req.query.pagesize;
    var area=req.query.area;
    if(!p){p=1}
    if(!ps){ps=9}
    var offset=(p-1)*ps;
    ps=parseInt(ps);
    var sql=`select * from aby_house where harea=? group by create_h_time desc  limit ?,?`;
    pool.query(sql,[area,offset,ps],(err,result)=>{
        if(err) throw err;
        if(result.length>0){
            res.send({code:1,msg:"查询成功",data:result});
        }else{
            res.send({code:-1,msg:"查询失败",data:""});
        }
    })
});


//房源添加心愿单
router.post("/houseZan",(req,res)=>{
    var hid=req.body.hid;
    var uid=req.session.uid;
    if(!uid){
        res.send({code:-2,msg:"请先登陆账户",data:""});
        return;
    }
    var sql=`insert into aby_wish values(null,?,?)`;
    pool.query(sql,[hid,uid],(err,result)=>{
        if(err) throw err;
        if(result.affectedRows>0){
            res.send({code:1,msg:"添加成功",data:result});
        }else{
            res.send({code:-1,msg:"添加失败",data:""});
        }
    })
});
//房源删除心愿单
router.post("/delhouseZan",(req,res)=>{
    var hid=req.body.hid;
    var uid=req.session.uid;
    if(!uid){
        res.send({code:-2,msg:"请先登陆账户",data:""});
        return;
    }
    var sql=`delete from aby_wish where uid=? and hid=?`;
    pool.query(sql,[uid,hid],(err,result)=>{
        if(err) throw err;
        if(result.affectedRows>0){
            res.send({code:1,msg:"删除成功",data:result});
        }else{
            res.send({code:-1,msg:"删除失败",data:""});
        }
    })
});
//房源心愿单查询
router.get("/getWishHouse",(req,res)=>{
    var uid=req.session.uid;
    if(!uid){
        res.send({code:-2,msg:"请先登陆账户",data:""});
        return;
    }
    var sql=`select * from aby_wish inner join aby_house on aby_wish.hid=aby_house.hid where uid=?`;
    pool.query(sql,[uid],(err,result)=>{
        if(err) throw err;
        if(result.length>0){
            res.send({code:1,msg:"查询成功",data:result});
        }else{
            res.send({code:-1,msg:"查询失败",data:""});
        }
    })
});





module.exports=router;