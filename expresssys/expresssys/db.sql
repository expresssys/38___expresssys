

--用户
create table users(
usId int primary key auto_increment,  
uname varchar(20),   
upwd varchar(50), 
urealName varchar(20),   
uaddress  varchar(50) ,
uphone varchar(20),  
utel  varchar(20),--   
uemail   varchar(50),    
ustatus int ,	  --用户状态  1-在职   0-离职
res1  varchar(2000),  --用户身份   1-物流公司管理员  2 -配送点管理员  3 -普通用户
 res2  varchar(2000),   
 res3  varchar(200),  
 res4  varchar(2000)  
)

insert into users(uname,upwd,ustatus) values('yc','123',1);
insert into users(uname,upwd,ustatus) values('y','123',2);
insert into users(uname,upwd,ustatus) values('y','123',3);
select * from users;

--登录日志信息
create table logininfo(
	lid int primary key auto_increment,
	ltime datetime,			--登录时间
	lname varchar(255),		--登录名
	lip varchar(200),		--登录ip
	lstatus varchar(200),	--状态 1登录成功  0失败
	res1 varchar(2000),		-- 
	res2 varchar(2000),
	res3 varchar(2000),
	res4 varchar(2000)
)

select * from logininfo;

--运输车辆信息
create table car(
  cid int primary key auto_increment,    --车辆编号
  cnumber  varchar(50),   --车牌号
  ctype varchar(50),    --车型
  cbuyDay date ,     --购买日期
  crunNum varchar(50),   --运营证号
  cvolume  double (16,2),--容量(m^3)
  cton   double(16,2),  --吨位
  cstatus int ,     --车辆状态  (0空闲 ，1在途中)
  cisbox  int ,   --是否箱式  (0是，1不是)
  spid int ,    --所属单位                                          --
  cremark  varchar(5000),   --备注
  res1 varchar(5000),   --备用字段  1为正在使用 2为删除
  res2 varchar(5000),
  res3  varchar(2000),    --备用字段   
  res4  varchar(2000)    --备用字段
)


--配送单位
create table shipPoint(
 spid  int primary key auto_increment,   
 spname varchar(100)   ,   
 spperson varchar(20),   
 sptel varchar(20),  
  spemail  varchar(50),  
  spaddress  varchar(50)  ,
 sppersonTel varchar(20),   
 spfax varchar(100),   
sparea   varchar(100),   
spremark   varchar(5000),   
res1 varchar(5000),   
res2 varchar(5000),
res3  varchar(2000),   
res4  varchar(2000)    
)

select count(spid) from shippoint
select * from shipPoint;

--代理
create table proxy(
 prid int primary key auto_increment,   --id
 prname  varchar(50),   --代理名称
 prtime   varchar(50),  --工作时间
 prprice  double(10,2),    --价格
 prremark  varchar(5000),   --备注
spid int ,--所属单位id                                         --
 res1  varchar(2000),    --备用字段   
 res2  varchar(2000),    --备用字段
 res3  varchar(2000)    --备用字段
)
select * from proxy;
  

--配送路线
create table route(
   rid int primary key auto_increment,  
   rname varchar(100),   
   rvia  varchar(2000) ,  
   res1  varchar(2000),    
   res2  varchar(2000),   
   res3  varchar(2000),   
   res4  varchar(2000)    
)
select * from route

--司机信息
create table driver(
    did   int primary key auto_increment, 
    dname varchar(20)  ,--姓名
    dnumber varchar(20),     --驾驶证号
    dphone  varchar(20),     --联系电话
    didCard varchar(20), --身份证
    ddage   int ,--驾龄
    dstatus   int ,   --司机状态(0空闲  ,1在忙,3离职)  默认0
 	spid  int,    --所属单位                                                   --
    res1  varchar(2000),    --备用字段
    res2  varchar(2000),    --备用字段
    res3  varchar(2000),    --备用字段
    res4  varchar(2000)    --备用字段
)
select did,dname from driver where dstatus=0  

--商品信息
create table goods(
     gid int primary key auto_increment,    --货物编号
     gname varchar(50),   
     gcount int ,    --货物数量
     gunit  varchar(50),   --单位
     gprice  double(16,2) ,--货物价值
     gweight double(16,2),   --货物重量(kg)
     gvolume double(16,2),   --货物体积
     gtype    varchar(20),  --货物类别
     gremark varchar(5000),   --备注

     res1  varchar(5000),   --备用字段   货物状态
     res2    varchar(5000), --备用字段
     res3  varchar(2000),    --备用字段
     res4  varchar(2000)    --备用字段
)

select * from goods;

  
--货物交接表
create  table handover(
   hid int primary key auto_increment,    --id
   hfromSpname  varchar(50),  --初始配送点名称
   htoSpname varchar(50),    --到达配送点名称
   hstartTime Datetime,    --起始时间
   hendTime　Datetime ,  --到达时间
   hstatus  int ,   --交接单状态(0未发车，  1已发车，   2已完成)   默认0
	cid int ,   --运输车辆id                                                           --
	did  int ,-- 司机id                                                          --
	osid int ,-- 订单id                                                             --
	rid int ,--线路  id                                                        --
   hremark   varchar(5000),  --备注
   res1  varchar(2000),    --备用字段
   res2  varchar(2000) ,
   res3  varchar(2000),    --备用字段
   res4  varchar(2000)    --备用字段
)


select * from handover where hfromSpname='广州' and htoSpname='' and osid=

--订单表

create table orders(
     osid  int primary key auto_increment,   
     osendName varchar(20),   
     osendTel  varchar(20) , 
     osendAddress  varchar(50),  
     orecName varchar(20),  
     orecTel  varchar(20),   
      orecAddress varchar(50),   
      orecCode varchar(20)  ,
      orecPhone  varchar(20),   --备用字段
      otime Datetime ,   --订单日期
      oprice   double(10,2),   --配送费
       oinsurePrice  double(10,2),    --保价金额
      otype  int ,  --订单类型(0快件, 1慢件,  2大宗)
      ostatus  int ,--订单状态(0未发件, 1已发件, 2已送达,3 已取消 100前台下单)
      ostartTime  Datetime,   --要求启程时间
      oendTime  Datetime,    --要求到达时间
      orecSpname   varchar(50),   --备用字段
      oremark  varchar(5000),  --备注

      usId  int,  --用户id                                            --
      spid  int ,-- 所属单位id                                          --
      res1 varchar(2000),    --备用字段
      res2 varchar(2000),    --备用字段
      res3 varchar(2000),     --备用字段
      res4  varchar(2000)   --备用字段
)

select osid,orecName from orders;


--价格表
create table price(
    pid int primary key auto_increment,  --价格编号
    pfrom varchar(50),   --起始地址
    pto varchar(50),   --终点地址
    pfirstwei   double(16,2),  --首重价格
    prestwei    double(16,2),    --次重价格
    pfirstvol   double(16,2) ,   --首立方价格
    prestvol   double(16,2),   --次立方价格
    pretime   varchar(20),          --预计时间
    res1 varchar(2000),
    res2  varchar(2000),
    res3 varchar(2000),
    res4  varchar(2000)
)

--订单详细
create table orderInfo(
  orderId int primary key auto_increment,
  osid  int,           --订单
  gid  int ,               --商品
  rid  int,					--路线
  ostatus int,				--状态 1：可用 2：删除
  res1 varchar(2000),
  res2 varchar(2000),
  res3 varchar(2000),
  res4 varchar(2000),
  res5 varchar(2000)

)
select * from orderinfo;
select rid from orderInfo where osid=1


--数据字典  主要用于下拉列表
--字段类型
create table constType(
	ctId int  primary key auto_increment,
	ctname varchar(200),
	ctstatus int
);
--字段内容
create table const(
	cid int  primary key auto_increment,
	ctid int,
	cname varchar(200),
	cstatus int
);

select cstatus from const;


--数据字典数据
INSERT INTO `consttype` VALUES (1, '单位', 1);
INSERT INTO `consttype` VALUES (2, 'userStatus', 1);
INSERT INTO `consttype` VALUES (3, 'orderType', 1);
INSERT INTO `consttype` VALUES (4, 'carType', 1);
INSERT INTO `consttype` VALUES (5, 'carStatus', 1);
INSERT INTO `consttype` VALUES (6, 'goodsStatus', 1);
INSERT INTO `consttype` VALUES (7, 'handoverStatus', 1);
INSERT INTO `consttype` VALUES (8, 'goodsWUnit', 1);
INSERT INTO `consttype` VALUES (9, 'goodsVUnit', 1);
INSERT INTO `consttype` VALUES (10, 'carWUnit', 1);
INSERT INTO `consttype` VALUES (11, 'carVUnit', 1);
INSERT INTO `consttype` VALUES (12, 'comUnit', 1);
INSERT INTO `consttype` VALUES (13, 'expShowLeave', 1);
INSERT INTO `consttype` VALUES (14, 'expShowArr', 1);
INSERT INTO `consttype` VALUES (15, 'expShowSendTo', 1);
INSERT INTO `consttype` VALUES (16, 'expShowGet', 1);
INSERT INTO `consttype` VALUES (17, 'expShowSales', 1);
INSERT INTO `consttype` VALUES (18, 'expShowSend', 1);



INSERT INTO `const` VALUES (1, 1, 'kg', 1);
INSERT INTO `const` VALUES (2, 2, '物流公司管理员', 1);
INSERT INTO `const` VALUES (3, 2, '配送点管理员', 2);
INSERT INTO `const` VALUES (4, 3, '快件', 0);
INSERT INTO `const` VALUES (5, 3, '大件', 2);
INSERT INTO `const` VALUES (6, 3, '慢件', 1);
INSERT INTO `const` VALUES (7, 4, '挂车', 1);
INSERT INTO `const` VALUES (8, 4, '货车', 2);
INSERT INTO `const` VALUES (9, 5, '空闲', 0);
INSERT INTO `const` VALUES (10, 5, '在途中', 1);
INSERT INTO `const` VALUES (11, 6, '已签收', 0);
INSERT INTO `const` VALUES (12, 6, '等待揽件', 1);
INSERT INTO `const` VALUES (13, 6, '已发货', 2);
INSERT INTO `const` VALUES (14, 6, '运输中', 3);
INSERT INTO `const` VALUES (15, 6, '派送中', 4);
INSERT INTO `const` VALUES (16, 7, '未发车', 0);
INSERT INTO `const` VALUES (17, 7, '已发车', 1);
INSERT INTO `const` VALUES (18, 7, '已完成', 2);
INSERT INTO `const` VALUES (19, 8, 'kg', 1);
INSERT INTO `const` VALUES (20, 9, 'm³', 1);
INSERT INTO `const` VALUES (21, 10, 't', 1);
INSERT INTO `const` VALUES (22, 11, 'm³', 1);
INSERT INTO `const` VALUES (23, 12, '台', 1);
INSERT INTO `const` VALUES (24, 12, '件', 2);
INSERT INTO `const` VALUES (25, 12, '套', 3);
INSERT INTO `const` VALUES (26, 12, '个', 4);
INSERT INTO `const` VALUES (27, 13, ' 快件离开', 1);
INSERT INTO `const` VALUES (28, 14, '快件已经到达', 1);
INSERT INTO `const` VALUES (29, 15, '已发往', 1);
INSERT INTO `const` VALUES (30, 16, '已收件', 1);
INSERT INTO `const` VALUES (31, 17, '的业务员', 1);
INSERT INTO `const` VALUES (32, 18, '正在派件', 1);
INSERT INTO `const` VALUES (33, 2, '普通用户', 3);



--配送点数据
INSERT INTO `shippoint` VALUES (5, '长沙', '张三', '15648758596', '1214662761@qq.com', '湖南省长沙市雨花区万芙南路恒生·碧水龙庭南150米', '17374727157', '0731-15648758596', NULL, '长沙物流中心', '1', NULL, NULL, NULL);
INSERT INTO `shippoint` VALUES (6, '衡阳', '李四', '18374758656', '1632807039@qq.com', '湖南省衡阳市白沙物流园', '15641255623', '0734-18374758656', NULL, '衡阳物流中心', '1', NULL, NULL, NULL);
INSERT INTO `shippoint` VALUES (7, '郴州', '王五', '18674757124', '1026809406@qq.com', '湖南省郴州市北湖区郴州大道北湖工业园西(通达物流南)', '17584562145', '0735-18674757124', NULL, '郴州物流中心', '1', NULL, NULL, NULL);
INSERT INTO `shippoint` VALUES (8, '益阳', '赵毅', '15674717548', '1632807039@qq.com', '湖南省益阳市赫山区大丰巷', '18675962345', '0737-15674717548', NULL, '益阳物流中心', '1', NULL, NULL, NULL);
INSERT INTO `shippoint` VALUES (9, '湘潭', '武义', '17674125874', '12145784521@qq.com', '湖南省湘潭市岳塘区107国道附近', '18395267351', '0731-17674125874', NULL, '湘潭物流中心', '1', NULL, NULL, NULL);
INSERT INTO `shippoint` VALUES (10, '株洲', '王丽丝', '17145122258', '125455102@qq.com', '湖南省株洲市航空路139', '15547331258', '0731-17145122258', NULL, '株洲物流中心', '1', NULL, NULL, NULL);
INSERT INTO `shippoint` VALUES (11, '常德', '白乐i', '17574714151', '1214662761@qq.com', '湖南省常德市鼎城区桃花源路与永富路交叉口西南100米', '15623145263', '0736-17574714152', NULL, '常德物流中心', '1', NULL, NULL, NULL);

--用户
INSERT INTO `users` VALUES (4, '1', 'A42B31823D4322A9', '1', '1', '1', '1', '1', 1, '1', NULL, NULL, NULL);
INSERT INTO `users` VALUES (15, '2', '27B3CD282D6ED9D1', '2', '2', '2', '2', '2', 1, '3', NULL, NULL, NULL);
INSERT INTO `users` VALUES (16, '3', '1A2AA85A5C5DB001', '3', '3', '3', '3', '3', 1, '3', NULL, NULL, NULL);


--路线
INSERT INTO `route` VALUES (16, '长郴', '长沙-株洲-衡阳-郴州', '1', NULL, NULL, NULL);
INSERT INTO `route` VALUES (17, '长沙-衡阳', '长沙-株洲-衡阳', '1', NULL, NULL, NULL);
INSERT INTO `route` VALUES (18, '长沙-益阳', '长沙-益阳', '1', NULL, NULL, NULL);
INSERT INTO `route` VALUES (19, '长沙-株洲-益阳', '长沙-株洲-益阳', '1', NULL, NULL, NULL);
INSERT INTO `route` VALUES (20, '长-株-益', '长沙-株洲-益阳', '1', NULL, NULL, NULL);
INSERT INTO `route` VALUES (29, '长-湘-益', '长沙-湘潭-益阳', '1', NULL, NULL, NULL);
INSERT INTO `route` VALUES (30, '常-益-长', '常德-益阳-长沙', '1', NULL, NULL, NULL);
INSERT INTO `route` VALUES (31, '长-株-益', '长沙-株洲-益阳', '1', NULL, NULL, NULL);
INSERT INTO `route` VALUES (32, '常德-郴州', '常德-益阳-长沙-衡阳-郴州', '1', NULL, NULL, NULL);
INSERT INTO `route` VALUES (33, '益阳-长沙', '益阳-长沙', '1', NULL, NULL, NULL);

--代理点
INSERT INTO `proxy` VALUES (3, '衡阳蒸湘区蒸湘中学营业点', '08:00至20:00', 12.00, '衡阳蒸湘区蒸湘中学营业点', 6, '1', '湖南省衡阳市蒸湘区长丰大道与船山大道交汇处长湖安置小区9栋10号（蒸湘中学斜对面）', NULL);
INSERT INTO `proxy` VALUES (4, '衡阳耒阳市城北中路营业点', '08:00至20:00', 12.00, '衡阳耒阳市城北中路营业点', 6, '1', '湖南省衡阳市耒阳市城北中路金盆家居院子里面大樟树下', NULL);
INSERT INTO `proxy` VALUES (5, '衡阳常宁市田申宾馆营业点', '08:00至20:00', 12.00, '衡阳常宁市田申宾馆营业点', 6, '1', '湖南省衡阳市常宁市莲花新区西二环田申宾馆斜对面路口进来30米', NULL);
INSERT INTO `proxy` VALUES (6, '常德武陵区湖南文理学院营业点', '08:00至21:00', 15.00, '常德武陵区湖南文理学院营业点', 11, '1', '湖南省湖南省常德市武陵区洞庭大道3150号', NULL);
INSERT INTO `proxy` VALUES (7, '长沙芙蓉区湖南农业大学营业点', '08:00至20:00', 15.00, '长沙芙蓉区湖南农业大学营业点', 5, '1', '湖南省长沙市芙蓉区农大路1号', NULL);

--价格
INSERT INTO `price` VALUES (2, '长沙', '衡阳', 10.00, 15.00, 10.00, 12.00, '3', '0', NULL, NULL, NULL);
INSERT INTO `price` VALUES (6, '常德', '长沙', 10.00, 12.00, 12.00, 20.00, '2', '0', NULL, NULL, NULL);
INSERT INTO `price` VALUES (7, '常德', '衡阳', 12.00, 15.00, 12.00, 15.00, '3', '0', NULL, NULL, NULL);


--订单
INSERT INTO `orders` VALUES (7, '赵武', '17674737157', '湖南省长沙市雨花区万芙南路恒生·碧水龙庭南', '李贺', '18374737142', '湖南省郴州市北湖区郴州大道北湖工业园西(通达物流南)', '413200', NULL, '2018-3-1 19:00:00', 20.00, 50.00, 0, 3, '2018-3-1 15:00:00', '2018-3-3 00:00:00', NULL, '1', 4, 5, '6', '16', NULL, NULL);
INSERT INTO `orders` VALUES (11, '胡里', '17574731245', '湖南省长沙市雷锋大道1501号', '余力', '18374714125', '湖南省衡阳市珠晖区衡花路18号', '421002', NULL, '2018-3-10 19:15:07', 20.00, 20.00, 0, 1, '2018-3-10 20:30:00', '2018-3-12 09:30:30', NULL, '请尽快派送', 4, 5, '10', '17', NULL, NULL);
INSERT INTO `orders` VALUES (12, 'gini', '1801245689', '湖南省长沙市岳麓区麓山南路932号', '李九', '15274102351', '湖南省益阳市赫山区迎宾东路518号', '413099', NULL, '2018-3-10 20:15:07', 15.00, 50.00, 0, 1, '2018-3-10 20:30:00', '2018-3-12 09:30:30', NULL, '麻烦尽快派送', 4, 5, '11', '18', NULL, NULL);
INSERT INTO `orders` VALUES (18, '瓶子i', '1801245689', '湖南省长沙市岳麓区麓山南路', '李九', '15625874156', '湖南省益阳市赫山区迎宾东路518号', '413099', NULL, '2018-3-11 11:58:38', 15.00, 20.00, 0, 1, '2018-3-11 16:54:19', '2018-3-13 16:54:15', NULL, '请尽快派送', 15, 5, '61', '0', NULL, NULL);
INSERT INTO `orders` VALUES (19, '李九i', '15625874156', '湖南省长沙市岳麓区麓山南路', '瓶子', '1801245689', '湖南省益阳市赫山区迎宾东路518号', '413099', NULL, '2018-3-11 06:04:48', 10.00, 15.00, 0, 0, '2018-3-11 11:32:57', '2018-3-13 11:33:06', NULL, '数码配件', 15, 5, '62', '31', NULL, NULL);
INSERT INTO `orders` VALUES (20, 'gini', '15625874157', '湖南省益阳市赫山区迎宾东路', '李九i', '15625874157', '湖南省长沙市岳麓区麓山南路158号', '413097', NULL, '2018-3-11 06:07:03', 10.00, 20.00, 0, 1, '2018-3-11 10:39:50', '2018-3-12 10:39:53', NULL, '饰品i', 15, 8, '63', '33', NULL, NULL);
INSERT INTO `orders` VALUES (21, '胡华', '17674759563', '湖南省常德市鼎城区桃花源路与永富路交叉口西南100米', '李斯', '17674758214', '湖南省长沙市雨花区万芙南路恒生·碧水龙庭南150米', '495212', NULL, '2018-3-7 19:15:19', 15.00, 50.00, 0, 4, '2018-3-7 23:15:35', '2018-3-9 14:15:42', NULL, '请尽快配送', 4, 5, '64', '30', NULL, NULL);
INSERT INTO `orders` VALUES (22, '白乐', '17674737157', '湖南省常德市鼎城区桃花源路与永富路交叉口西南', '英凯', '15612854552', '湖南省郴州市北湖区郴州大道北湖工业园西(通达物流南)', '491252', NULL, '2018-3-13 11:46:38', 10.00, 15.00, 0, 3, '2018-3-13 11:48:22', '2018-3-15 11:48:24', NULL, '日用品', 15, 5, '65', '32', NULL, NULL);


--订单详情
INSERT INTO `orderinfo` VALUES (4, 7, 6, 16, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `orderinfo` VALUES (16, 11, 10, 17, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `orderinfo` VALUES (17, 12, 11, 18, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `orderinfo` VALUES (18, 13, 18, NULL, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `orderinfo` VALUES (19, 14, 18, NULL, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `orderinfo` VALUES (20, 15, 18, NULL, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `orderinfo` VALUES (21, 16, 18, NULL, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `orderinfo` VALUES (22, 17, 60, NULL, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `orderinfo` VALUES (23, 18, 61, 0, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `orderinfo` VALUES (24, 19, 62, 31, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `orderinfo` VALUES (25, 20, 63, 33, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `orderinfo` VALUES (26, 21, 64, 30, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `orderinfo` VALUES (27, 22, 65, 32, 1, NULL, NULL, NULL, NULL, NULL);

--交接单
INSERT INTO `handover` VALUES (1, '长沙', '衡阳', '2018-1-6 00:00:00', '2018-1-6 00:00:00', 1, 1, 2, 4, 12, ' \n					', NULL, NULL, NULL, NULL);
INSERT INTO `handover` VALUES (2, '衡阳', '郴州', '2018-1-6 00:00:00', '2018-1-6 00:00:00', 1, 1, 2, 4, 12, ' \n					1', NULL, NULL, NULL, NULL);
INSERT INTO `handover` VALUES (9, '长沙', '株洲', '2018-3-1 21:41:58', '2018-3-2 02:48:00', 2, 1, 2, 7, 16, ' \n				已发车	', NULL, NULL, NULL, NULL);
INSERT INTO `handover` VALUES (10, '株洲', '衡阳', '2018-3-2 09:41:58', '2018-3-2 15:48:00', 2, 1, 2, 7, 16, ' \n					', NULL, NULL, NULL, NULL);
INSERT INTO `handover` VALUES (11, '衡阳', '郴州', '2018-3-7 00:00:00', '2018-3-7 00:00:00', 2, 1, 2, 7, 16, ' \n					', NULL, NULL, NULL, NULL);
INSERT INTO `handover` VALUES (15, '常德', '益阳', '2018-3-12 00:00:00', '2018-3-12 00:00:00', 2, 1, 3, 21, 30, ' \n					', NULL, NULL, NULL, NULL);
INSERT INTO `handover` VALUES (16, '益阳', '长沙', '2018-3-12 00:00:00', '2018-3-12 00:00:00', 2, 1, 3, 21, 30, ' \n					', NULL, NULL, NULL, NULL);
INSERT INTO `handover` VALUES (17, '长沙', '株洲', '2018-3-13 00:00:00', '2018-3-13 00:00:00', 2, 1, 4, 19, 31, ' 1\n					', NULL, NULL, NULL, NULL);
INSERT INTO `handover` VALUES (18, '株洲', '益阳', '2018-3-13 00:00:00', '2018-3-13 00:00:00', 2, 1, 3, 19, 31, ' \n					', NULL, NULL, NULL, NULL);
INSERT INTO `handover` VALUES (19, '常德', '益阳', '2018-3-13 00:00:00', '2018-3-13 00:00:00', 2, 1, 4, 22, 32, ' \n					', NULL, NULL, NULL, NULL);


--车辆
INSERT INTO `car` VALUES (1, '235641', '货车', '2018-1-6', '124563', 3.00, 2.00, 0, 0, 5, '1', '1', NULL, NULL, NULL);
INSERT INTO `car` VALUES (3, '5214635', '货车', '2018-1-2', '123456789', 20.00, 20.00, 0, 0, 5, '', '1', NULL, NULL, NULL);
INSERT INTO `car` VALUES (4, '52417852', '挂车', '2016-1-6', '123457896', 25.00, 20.00, 0, 1, 6, '', '1', NULL, NULL, NULL);
INSERT INTO `car` VALUES (5, '12032588', '货车', '2016-3-23', '14528574', 24.00, 22.00, 0, 1, 7, '', '1', NULL, NULL, NULL);
INSERT INTO `car` VALUES (6, '52122356', '挂车', '2016-11-30', '123456', 20.00, 22.00, 0, 0, 8, '', '1', NULL, NULL, NULL);
INSERT INTO `car` VALUES (8, '111', '挂车', '2018-3-12', '1', 11.00, 111.00, 0, 0, 6, '', '0', NULL, NULL, NULL);

--司机
INSERT INTO `driver` VALUES (3, '李想', '1502054', '17674717458', '430981199802191426', 2, 0, 5, NULL, NULL, NULL, NULL);
INSERT INTO `driver` VALUES (4, '李武', '16020514', '15641859656', '522423198712031426', 10, 0, 11, NULL, NULL, NULL, NULL);
INSERT INTO `driver` VALUES (5, '王丽i', '1702145', '17674320124', '522433199202151426', 3, 0, 8, NULL, NULL, NULL, NULL);
INSERT INTO `driver` VALUES (6, '沼柳i', '150203236', '18345012212', '52242319632514', 8, 0, 10, NULL, NULL, NULL, NULL);
INSERT INTO `driver` VALUES (7, '1', '1', '1', '1', 1, 3, 5, NULL, NULL, NULL, NULL);
INSERT INTO `driver` VALUES (8, '1', '11111', '1', '1', 1, 3, 5, NULL, NULL, NULL, NULL);


--商品
INSERT INTO `goods` VALUES (1, '1', 1, '1', 1.00, 1.00, 1.00, '日用品', '1', '0', NULL, NULL, NULL);
INSERT INTO `goods` VALUES (2, '2', 2, '2', 2.00, 2.00, 2.00, '2', '2', '2', NULL, NULL, NULL);
INSERT INTO `goods` VALUES (3, '手机', 1, '台', 2000.00, 0.80, 2.00, '数码产品', '1', '2', NULL, NULL, NULL);
INSERT INTO `goods` VALUES (4, '鼠标', 1, '个', 100.00, 0.50, 1.50, '数码产品', '', '2', NULL, NULL, NULL);
INSERT INTO `goods` VALUES (5, '2', 2, '个', 2.00, 1.00, 1.00, '1', '1', '2', NULL, NULL, NULL);
INSERT INTO `goods` VALUES (6, '饼干', 2, '件', 50.00, 0.30, 5.00, '食品', '易碎物品', '2', NULL, NULL, NULL);
INSERT INTO `goods` VALUES (7, '手机', 1, '台', 2000.00, 0.50, 1.00, '数码产品', '', '2', NULL, NULL, NULL);
INSERT INTO `goods` VALUES (8, '手机', 1, '台', 2000.00, 0.50, 1.00, '数码产品', '1', '2', NULL, NULL, NULL);
INSERT INTO `goods` VALUES (9, '888', 8, '台', 888.00, 5.00, 2.00, '8', '8', '2', NULL, NULL, NULL);
INSERT INTO `goods` VALUES (10, '耳机', 1, '件', 20.00, 0.20, 0.20, '数码配件', '', '2', NULL, NULL, NULL);
INSERT INTO `goods` VALUES (11, '网线', 2, '件', 20.00, 0.50, 0.50, '网络配件', '', '2', NULL, NULL, NULL);
INSERT INTO `goods` VALUES (61, '1', 1, '件', 12.00, 1.00, 1.00, '日用品', '1', '1', NULL, NULL, NULL);
INSERT INTO `goods` VALUES (62, '耳机', 2, '件', 50.00, 0.50, 0.50, '数码配件', '', '1', NULL, NULL, NULL);
INSERT INTO `goods` VALUES (63, '1', 1, '台', 1.00, 1.00, 1.00, '饰品i', '1', '1', NULL, NULL, NULL);
INSERT INTO `goods` VALUES (64, '眼镜盒', 1, '件', 20.00, 0.20, 0.30, '日用品', '', '2', NULL, NULL, NULL);
INSERT INTO `goods` VALUES (65, '毛巾', 2, '件', 30.00, 0.80, 1.00, '日用品', '1', '1', NULL, NULL, NULL);


