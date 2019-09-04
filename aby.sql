set names utf8;
DROP DATABASE IF EXISTS aby;
CREATE DATABASE aby CHARSET=UTF8;
use aby;

CREATE TABLE aby_user(
    uid INT PRIMARY KEY AUTO_INCREMENT,
    uname VARCHAR(32), #用户名
    upwd VARCHAR(20),  #密码
    gender BOOL,       #性别 0女 1男
    realname VARCHAR(32),  #真实姓名
    birthday VARCHAR(32),  #出生日期 
    email VARCHAR(32),     #邮箱
    phone VARCHAR(11),     #电话
    idcard VARCHAR(32),    #身份证
    u_pic  VARCHAR(32)   #头像地址
);
#创建保存地区房源信息的表
create table aby_house(
    hid INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(128),  #标题
    h_type VARCHAR(32), #房源类型
    city VARCHAR(16),   #城市
    harea VARCHAR(16),  #房源区域
    h_info_member VARCHAR(16),     #房源概览房客人数
    h_info_rooms VARCHAR(32),      #房源概览卧室数
    h_info_beds VARCHAR(32), 	   #房源概览床的数量
    price DECIMAL(6,2),  #价格
    original_price DECIMAL(6,2), #原价格
    detail VARCHAR(256), #摘要
    addr_detail VARCHAR(256),   #详细地址
    pic_address VARCHAR(256),   #轮播图图片地址
    arpic_address VARCHAR(256), #ar缩略图地址
    h_b_discount VARCHAR(64),           #优惠加粗内容
    h_discount VARCHAR(64),             #优惠内容
    h_zhekou VARCHAR(32),               #折扣
    h_subinfo VARCHAR(128),              #概览介绍,0开始的偶数下标为标题，奇数下标为介绍，都用/隔开，之后拆分成数组使用
    h_server_price INT,         #服务费
    h_enterleave_time VARCHAR(32), #入住与退房的时间
    h_cancel VARCHAR(32),       #取消政策内容
    h_allow VARCHAR(32),       #入住须知 存储五个值 0不允许  1允许  逗号隔开  拆分数组使用
    create_h_time VARCHAR(32),  #创建日期
    #绿色标签  0没有 1有
    landlord BOOL,          #超赞房东
    new_house BOOL          #超赞新房
);
insert into aby_house values(null,"B1 Design Studio: 设计师自住SOHO,临近西溪湿地,地铁五号线,阿里巴巴,浙江大学","整套酒店式公寓","杭州市","西湖区","1","1","1",268.00,358.00,"位于西溪国家湿地公园北门附近小区。现代风格,简洁明朗,物业管理完善安全。玄关小巧,客厅精致,餐厅宽敞,卫生间干净，卧室整洁,书房巧妙,露台明亮,工作室自在。","杭州，浙江，中国/房子位于滨江风雅钱塘小区西侧,家具家电全,面积约32平左右,带独立卫生间,配备洗衣机｡房间收拾的非常干净整洁,进房间需要换下拖鞋哈^_^,周边衣食住行都非常方便｡","images/h_detail/01/01.jpg,images/h_detail/01/02.jpg,images/h_detail/01/03.jpg,images/h_detail/01/04.jpg,images/h_detail/01/05.jpg","images/h_detail/01/01.jpg,images/h_detail/01/02.jpg,images/h_detail/01/03.jpg,images/h_detail/01/04.jpg,images/h_detail/01/05.jpg","享受8月16日-9月12日期间的8.8折优惠","在24天内完成预定，锁定限时好价","8.8","卧室1/1张标准的双人床,",31,"14:00后/12:00","48小时内免费退订","1/1/1/1/1","2018/6/6",true,false);
insert into aby_house values(null,"B1 Design Studio: 设计师自住SOHO,临近西溪湿地,地铁五号线,阿里巴巴,浙江大学","整套酒店式公寓","杭州市","拱墅区","1","1","1",268.00,358.00,"位于西溪国家湿地公园北门附近小区。现代风格,简洁明朗,物业管理完善安全。玄关小巧,客厅精致,餐厅宽敞,卫生间干净，卧室整洁,书房巧妙,露台明亮,工作室自在。","杭州，浙江，中国/房子位于滨江风雅钱塘小区西侧,家具家电全,面积约32平左右,带独立卫生间,配备洗衣机｡房间收拾的非常干净整洁,进房间需要换下拖鞋哈^_^,周边衣食住行都非常方便｡","images/h_detail/01/01.jpg,images/h_detail/01/02.jpg,images/h_detail/01/03.jpg,images/h_detail/01/04.jpg,images/h_detail/01/05.jpg","images/h_detail/01/01.jpg,images/h_detail/01/02.jpg,images/h_detail/01/03.jpg,images/h_detail/01/04.jpg,images/h_detail/01/05.jpg","享受8月16日-9月12日期间的8.8折优惠","在24天内完成预定，锁定限时好价","8.8","卧室1/1张标准的双人床,",31,"14:00后/12:00","48小时内免费退订","1/1/1/1/1","2018/7/5",true,false);
insert into aby_house values(null,"B1 Design Studio: 设计师自住SOHO,临近西溪湿地,地铁五号线,阿里巴巴,浙江大学","整套酒店式公寓","杭州市","拱墅区","1","1","1",268.00,358.00,"位于西溪国家湿地公园北门附近小区。现代风格,简洁明朗,物业管理完善安全。玄关小巧,客厅精致,餐厅宽敞,卫生间干净，卧室整洁,书房巧妙,露台明亮,工作室自在。","杭州，浙江，中国/房子位于滨江风雅钱塘小区西侧,家具家电全,面积约32平左右,带独立卫生间,配备洗衣机｡房间收拾的非常干净整洁,进房间需要换下拖鞋哈^_^,周边衣食住行都非常方便｡","images/h_detail/01/01.jpg,images/h_detail/01/02.jpg,images/h_detail/01/03.jpg,images/h_detail/01/04.jpg,images/h_detail/01/05.jpg","images/h_detail/01/01.jpg,images/h_detail/01/02.jpg,images/h_detail/01/03.jpg,images/h_detail/01/04.jpg,images/h_detail/01/05.jpg","享受8月16日-9月12日期间的8.8折优惠","在24天内完成预定，锁定限时好价","8.8","卧室1/1张标准的双人床,",31,"14:00后/12:00","48小时内免费退订","1/1/1/1/1","2018/7/4",true,false);
insert into aby_house values(null,"B1 Design Studio: 设计师自住SOHO,临近西溪湿地,地铁五号线,阿里巴巴,浙江大学","整套酒店式公寓","杭州市","拱墅区","1","1","1",268.00,358.00,"位于西溪国家湿地公园北门附近小区。现代风格,简洁明朗,物业管理完善安全。玄关小巧,客厅精致,餐厅宽敞,卫生间干净，卧室整洁,书房巧妙,露台明亮,工作室自在。","杭州，浙江，中国/房子位于滨江风雅钱塘小区西侧,家具家电全,面积约32平左右,带独立卫生间,配备洗衣机｡房间收拾的非常干净整洁,进房间需要换下拖鞋哈^_^,周边衣食住行都非常方便｡","images/h_detail/01/01.jpg,images/h_detail/01/02.jpg,images/h_detail/01/03.jpg,images/h_detail/01/04.jpg,images/h_detail/01/05.jpg","images/h_detail/01/01.jpg,images/h_detail/01/02.jpg,images/h_detail/01/03.jpg,images/h_detail/01/04.jpg,images/h_detail/01/05.jpg","享受8月16日-9月12日期间的8.8折优惠","在24天内完成预定，锁定限时好价","8.8","卧室1/1张标准的双人床,",31,"14:00后/12:00","48小时内免费退订","1/1/1/1/1","2018/7/3",true,false);
insert into aby_house values(null,"B1 Design Studio: 设计师自住SOHO,临近西溪湿地,地铁五号线,阿里巴巴,浙江大学","整套酒店式公寓","杭州市","滨江区","1","1","1",268.00,358.00,"位于西溪国家湿地公园北门附近小区。现代风格,简洁明朗,物业管理完善安全。玄关小巧,客厅精致,餐厅宽敞,卫生间干净，卧室整洁,书房巧妙,露台明亮,工作室自在。","杭州，浙江，中国/房子位于滨江风雅钱塘小区西侧,家具家电全,面积约32平左右,带独立卫生间,配备洗衣机｡房间收拾的非常干净整洁,进房间需要换下拖鞋哈^_^,周边衣食住行都非常方便｡","images/h_detail/01/01.jpg,images/h_detail/01/02.jpg,images/h_detail/01/03.jpg,images/h_detail/01/04.jpg,images/h_detail/01/05.jpg","images/h_detail/01/01.jpg,images/h_detail/01/02.jpg,images/h_detail/01/03.jpg,images/h_detail/01/04.jpg,images/h_detail/01/05.jpg","享受8月16日-9月12日期间的8.8折优惠","在24天内完成预定，锁定限时好价","8.8","卧室1/1张标准的双人床,",31,"14:00后/12:00","48小时内免费退订","1/1/1/1/1","2018/8/6",true,false);
insert into aby_house values(null,"B1 Design Studio: 设计师自住SOHO,临近西溪湿地,地铁五号线,阿里巴巴,浙江大学","整套酒店式公寓","杭州市","江干区","1","1","1",268.00,358.00,"位于西溪国家湿地公园北门附近小区。现代风格,简洁明朗,物业管理完善安全。玄关小巧,客厅精致,餐厅宽敞,卫生间干净，卧室整洁,书房巧妙,露台明亮,工作室自在。","杭州，浙江，中国/房子位于滨江风雅钱塘小区西侧,家具家电全,面积约32平左右,带独立卫生间,配备洗衣机｡房间收拾的非常干净整洁,进房间需要换下拖鞋哈^_^,周边衣食住行都非常方便｡","images/h_detail/01/01.jpg,images/h_detail/01/02.jpg,images/h_detail/01/03.jpg,images/h_detail/01/04.jpg,images/h_detail/01/05.jpg","images/h_detail/01/01.jpg,images/h_detail/01/02.jpg,images/h_detail/01/03.jpg,images/h_detail/01/04.jpg,images/h_detail/01/05.jpg","享受8月16日-9月12日期间的8.8折优惠","在24天内完成预定，锁定限时好价","8.8","卧室1/1张标准的双人床,",31,"14:00后/12:00","48小时内免费退订","1/1/1/1/1","2018/7/2",true,false);
insert into aby_house values(null,"B1 Design Studio: 设计师自住SOHO,临近西溪湿地,地铁五号线,阿里巴巴,浙江大学","整套酒店式公寓","杭州市","江干区","1","1","1",268.00,358.00,"位于西溪国家湿地公园北门附近小区。现代风格,简洁明朗,物业管理完善安全。玄关小巧,客厅精致,餐厅宽敞,卫生间干净，卧室整洁,书房巧妙,露台明亮,工作室自在。","杭州，浙江，中国/房子位于滨江风雅钱塘小区西侧,家具家电全,面积约32平左右,带独立卫生间,配备洗衣机｡房间收拾的非常干净整洁,进房间需要换下拖鞋哈^_^,周边衣食住行都非常方便｡","images/h_detail/01/01.jpg,images/h_detail/01/02.jpg,images/h_detail/01/03.jpg,images/h_detail/01/04.jpg,images/h_detail/01/05.jpg","images/h_detail/01/01.jpg,images/h_detail/01/02.jpg,images/h_detail/01/03.jpg,images/h_detail/01/04.jpg,images/h_detail/01/05.jpg","享受8月16日-9月12日期间的8.8折优惠","在24天内完成预定，锁定限时好价","8.8","卧室1/1张标准的双人床,",31,"14:00后/12:00","48小时内免费退订","1/1/1/1/1","2018/7/15",true,false);
#创建保存房源标签的表
CREATE TABLE aby_Tags(
    tid INT PRIMARY KEY AUTO_INCREMENT,
    hid INT,
    tags VARCHAR(128) #保存房源的灰色标签内容用/隔开，之后分割成数组来使用
);
insert into aby_Tags values(null,1,"可以做饭/可以停车/有烘干机");
insert into aby_Tags values(null,2,"可以轰趴/可以停车/有烘干机");
insert into aby_Tags values(null,3,"可以做饭/可以停车");
insert into aby_Tags values(null,4,"可以做饭/可以停车/可以长租");
insert into aby_Tags values(null,5,"可以做饭/可以停车/可以长租");
insert into aby_Tags values(null,6,"可以做饭/可以停车/可以长租");
insert into aby_Tags values(null,7,"可以做饭/可以停车/可以长租");
#创建保存房源便利设施的表
CREATE TABLE aby_server(
    sid INT PRIMARY KEY AUTO_INCREMENT,
    hid INT,
    #s_type INT,      #0代表入住服务 1代表基础设施 2代表洗浴设施 3代表厨房用品 4代表安全设施
    pid INT          #对应服务的图片编号
);
#创建保存遍历设施图片地址的表
CREATE TABLE aby_pic(
    pid INT PRIMARY KEY AUTO_INCREMENT,
    s_type INT,#0代表入住服务 1代表基础设施 2代表洗浴设施 3代表厨房用品 4代表安全设施
    p_address VARCHAR(256)
);
#创建保存故事信息的表
CREATE TABLE aby_story(
    storyid INT PRIMARY KEY AUTO_INCREMENT,
    uid INT,
    type VARCHAR(32),  #故事类别 例如美食，民宿，景点
    subtitle VARCHAR(32),  #小标题  其实是地点定位
    story_title VARCHAR(32),  #故事标题
    story_content VARCHAR(2048), #故事内容,段落用
    story_pic VARCHAR(256),   #图片路径
    story_date VARCHAR(32),   #发布日期
    zan  INT                  #点赞数
);
insert into aby_story values(null,1,"名宿","清迈","清迈有一家有“大象叫早服务”的名宿","在北方的海边度过了冬季两个月，一直在想春天去哪里生活。我喜欢大海，以往在南方海边住了五年，Y先生说，找个山里。他说加缪住在山上的时候，每日早晨起来就去散步，一边走路一边思考，过年后天气还是冷，山中要更冷几度，下了很多雨。从客厅去往卧室要经过大院子，院子里草木还枯黄着，鞋子踩上去很柔软的感觉，走下台阶，小径通往另一个小院。围墙边有桂花树和枇杷，这时节只有茶花盛开着。在这样的地方住几天，大概可以算是我来泰国以来最最特别的旅行体验了～","images/h_detail/01/01.jpg,images/h_detail/01/02.jpg,images/h_detail/01/03.jpg,images/h_detail/01/04.jpg,images/h_detail/01/05.jpg","2018年5月1日",99);
insert into aby_story values(null,1,"名宿","清迈","清迈有一家有“大象叫早服务”的名宿","在这样的地方住几天，大概可以算是我来泰国以来最最特别的旅行体验了～","images/h_detail/01/01.jpg,images/h_detail/01/02.jpg,images/h_detail/01/03.jpg,images/h_detail/01/04.jpg,images/h_detail/01/05.jpg","2018年5月1日",99);
insert into aby_story values(null,1,"名宿","清迈","清迈有一家有“大象叫早服务”的名宿","在这样的地方住几天，大概可以算是我来泰国以来最最特别的旅行体验了～","images/h_detail/01/01.jpg,images/h_detail/01/02.jpg,images/h_detail/01/03.jpg,images/h_detail/01/04.jpg,images/h_detail/01/05.jpg","2018年5月1日",99);
insert into aby_story values(null,1,"名宿","清迈","清迈有一家有“大象叫早服务”的名宿","在这样的地方住几天，大概可以算是我来泰国以来最最特别的旅行体验了～","images/h_detail/01/01.jpg,images/h_detail/01/02.jpg,images/h_detail/01/03.jpg,images/h_detail/01/04.jpg,images/h_detail/01/05.jpg","2018年5月1日",99);
insert into aby_story values(null,1,"名宿","清迈","清迈有一家有“大象叫早服务”的名宿","在这样的地方住几天，大概可以算是我来泰国以来最最特别的旅行体验了～","images/h_detail/01/01.jpg,images/h_detail/01/02.jpg,images/h_detail/01/03.jpg,images/h_detail/01/04.jpg,images/h_detail/01/05.jpg","2018年5月1日",99);
insert into aby_story values(null,1,"名宿","清迈","清迈有一家有“大象叫早服务”的名宿","在这样的地方住几天，大概可以算是我来泰国以来最最特别的旅行体验了～","images/h_detail/01/01.jpg,images/h_detail/01/02.jpg,images/h_detail/01/03.jpg,images/h_detail/01/04.jpg,images/h_detail/01/05.jpg","2018年5月1日",99);
insert into aby_story values(null,1,"名宿","清迈","清迈有一家有“大象叫早服务”的名宿","在这样的地方住几天，大概可以算是我来泰国以来最最特别的旅行体验了～","images/h_detail/01/01.jpg,images/h_detail/01/02.jpg,images/h_detail/01/03.jpg,images/h_detail/01/04.jpg,images/h_detail/01/05.jpg","2018年5月1日",99);
#创建用户房源评论表
CREATE TABLE aby_remark(
    rid INT PRIMARY KEY AUTO_INCREMENT,  #评论表ID
    hid INT,
    uname VARCHAR(32),        #用户名
    r_time VARCHAR(32),       #时间
    r_remark VARCHAR(256)     #评论
);
insert into aby_remark values(null,1,"扩达","2019/7/7","老板很负责,房子热水24小时供应,还有一个超大的投影仪,还有一个蓝牙音箱让我高兴坏了,对于喜欢听歌的我来说是真爱,床也很大两个人完全没有问题,一句话,老哥稳~");
insert into aby_remark values(null,1,"扩达","2019/7/7","老板很负责,房子热水24小时供应,还有一个超大的投影仪,还有一个蓝牙音箱让我高兴坏了,对于喜欢听歌的我来说是真爱,床也很大两个人完全没有问题,一句话,老哥稳~");
insert into aby_remark values(null,1,"扩达","2019/7/7","老板很负责,房子热水24小时供应,还有一个超大的投影仪,还有一个蓝牙音箱让我高兴坏了,对于喜欢听歌的我来说是真爱,床也很大两个人完全没有问题,一句话,老哥稳~");
insert into aby_remark values(null,1,"扩达","2019/7/7","老板很负责,房子热水24小时供应,还有一个超大的投影仪,还有一个蓝牙音箱让我高兴坏了,对于喜欢听歌的我来说是真爱,床也很大两个人完全没有问题,一句话,老哥稳~");
insert into aby_remark values(null,1,"扩达","2019/7/7","老板很负责,房子热水24小时供应,还有一个超大的投影仪,还有一个蓝牙音箱让我高兴坏了,对于喜欢听歌的我来说是真爱,床也很大两个人完全没有问题,一句话,老哥稳~");
insert into aby_remark values(null,1,"扩达","2019/7/7","老板很负责,房子热水24小时供应,还有一个超大的投影仪,还有一个蓝牙音箱让我高兴坏了,对于喜欢听歌的我来说是真爱,床也很大两个人完全没有问题,一句话,老哥稳~");
insert into aby_remark values(null,2,"扩达","2019/7/7","老板很负责,房子热水24小时供应,还有一个超大的投影仪,还有一个蓝牙音箱让我高兴坏了,对于喜欢听歌的我来说是真爱,床也很大两个人完全没有问题,一句话,老哥稳~");
insert into aby_remark values(null,3,"扩达","2019/7/7","老板很负责,房子热水24小时供应,还有一个超大的投影仪,还有一个蓝牙音箱让我高兴坏了,对于喜欢听歌的我来说是真爱,床也很大两个人完全没有问题,一句话,老哥稳~");
insert into aby_remark values(null,4,"扩达","2019/7/7","老板很负责,房子热水24小时供应,还有一个超大的投影仪,还有一个蓝牙音箱让我高兴坏了,对于喜欢听歌的我来说是真爱,床也很大两个人完全没有问题,一句话,老哥稳~");
insert into aby_remark values(null,5,"扩达","2019/7/7","老板很负责,房子热水24小时供应,还有一个超大的投影仪,还有一个蓝牙音箱让我高兴坏了,对于喜欢听歌的我来说是真爱,床也很大两个人完全没有问题,一句话,老哥稳~");
insert into aby_remark values(null,6,"扩达","2019/7/7","老板很负责,房子热水24小时供应,还有一个超大的投影仪,还有一个蓝牙音箱让我高兴坏了,对于喜欢听歌的我来说是真爱,床也很大两个人完全没有问题,一句话,老哥稳~");
insert into aby_remark values(null,7,"扩达","2019/7/7","老板很负责,房子热水24小时供应,还有一个超大的投影仪,还有一个蓝牙音箱让我高兴坏了,对于喜欢听歌的我来说是真爱,床也很大两个人完全没有问题,一句话,老哥稳~");
insert into aby_remark values(null,6,"扩达","2019/7/7","老板很负责,房子热水24小时供应,还有一个超大的投影仪,还有一个蓝牙音箱让我高兴坏了,对于喜欢听歌的我来说是真爱,床也很大两个人完全没有问题,一句话,老哥稳~");
#创建用户故事评论表
CREATE TABLE aby_storyremark(
    srid INT PRIMARY KEY AUTO_INCREMENT,  #故事评论表ID
    storyid INT,
    uname VARCHAR(32),        #用户名
    r_time VARCHAR(32),       #时间
    r_remark VARCHAR(256)    #评论
);
insert into aby_storyremark values(null,1,"张东","2019年7月7日","老板很负责,房子热水24小时供应,还有一个超大的投影仪,还有一个蓝牙音箱让我高兴坏了,对于喜欢听歌的我来说是真爱,床也很大两个人完全没有问题,一句话,老哥稳~");
insert into aby_storyremark values(null,1,"文华","2019年7月8日","老板很负责,房子热水24小时供应,还有一个蓝牙音箱让我高兴坏了,对于喜欢听歌的我来说是真爱,床也很大两个人完全没有问题,一句话,老哥稳~");
insert into aby_storyremark values(null,1,"老曹","2019年7月9日","老板很负责,房子热水24小时供应,还有一个超大的投影仪,,对于喜欢听歌的我来说是真爱,床也很大两个人完全没有问题,一句话,老哥稳~");
insert into aby_storyremark values(null,1,"老马","2019年7月1日","老板很负责,房子热水24小时供应,还有一个超大的投影仪,,对于喜欢听歌的我来说是真爱,床也很大两个人完全没有问题,一句话,老哥稳~");
insert into aby_storyremark values(null,1,"吴亦凡","2019年7月2日","老板很负责,房子热水24小时供应,还有一个超大的投影仪,还有一个蓝牙音箱让我高兴坏了,,床也很大两个人完全没有问题,一句话,老哥稳~");
insert into aby_storyremark values(null,1,"蔡玉坤","2019年7月3日","老板很负责,房子热水24小时供应,还有一个超大的投影仪,还有一个蓝牙音箱让我高兴坏了,对于喜欢听歌的我来说是真爱,一句话,老哥稳~");
#创建用户房源订单表
CREATE TABLE aby_order(
    oid INT PRIMARY KEY AUTO_INCREMENT,   #预定表id
    s_staet VARCHAR(32),     #出租时间
    s_stop VARCHAR(32),     #结束时间
    hid INT,                #房源ID
    o_state INT             #订单表状态  0代表历史订单已取消预定  1代表预定订单  2代表已完结订单
);
#创建用户心愿单
create table aby_wish(
    wid INT PRIMARY KEY AUTO_INCREMENT,   #心愿单id
    hid INT,                  #心愿单标题
    uid INT
);
#心愿单故事
create table aby_wish_content(
    wcid INT PRIMARY KEY AUTO_INCREMENT,
    storyid INT,
    hid INT
);
insert into aby_wish_content values(null,1,1);
insert into aby_wish_content values(null,1,1);