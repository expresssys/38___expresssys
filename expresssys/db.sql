

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
res1  varchar(2000),  --用户身份  
 res2  varchar(2000),   
 res3  varchar(200),  
 res4  varchar(2000)  
)

select * from users;
update users set ustatus=0 where usid=4
delete from users where uname !="1";
update users set ustatus=1 where usId=1
insert into users(uname,upwd) values('yc','123');
insert into users(uname,upwd) values('y','123');

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
  res1 varchar(5000),   --备用字段
  res2 varchar(5000),
  res3  varchar(2000),    --备用字段   
  res4  varchar(2000)    --备用字段

)

alter table car
add constraint FK_shipPoint_car  
foreign key(spid) references shipPoint(spid);
      

select count(*) as res3 from proxy


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
select spname from shipPoint where res1=0
update shipPoint set res1=0 
select * from shipPoint where res1=0
update shipPoint set res1=1 where spid =4

select count(spid) from shippoint
select * from shipPoint
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
update proxy set res1=0
select * from proxy
alter table proxy
add constraint FK_shipPoint_proxy  
foreign key(spid) references shipPoint(spid);
  




--配送路线
create table route(
   rid int primary key auto_increment,  --线路id
   rname varchar(100),   --线路名称
   rvia  varchar(2000) ,   --配送线路顺序
   res1  varchar(2000),    --备用字段
   res2  varchar(2000),    --备用字段
   res3  varchar(2000),    --备用字段
   res4  varchar(2000)    --备用字段
)



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



alter table driver
add constraint FK_shipPoint_driver  
foreign key(spid) references shipPoint(spid);
  

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
                                                     --

     res1  varchar(5000),   --备用字段   货物状态
     res2    varchar(5000), --备用字段
     res3  varchar(2000),    --备用字段
     res4  varchar(2000)    --备用字段
)


select * from goods;
alter table goods
add constraint FK_order_goods  
foreign key(osid) references order(osid);
  



--货物交接表
create  table handover(
   hid int primary key auto_increment,    --id
   hfromSpname  varchar(50),  --初始配送点名称
   htoSpname varchar(50),    --到达配送点名称
   hstartTime Date,    --起始时间
   hendTime　Date ,  --到达时间
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


alter table handover
add constraint FK_car_handover  
foreign key(cid) references car(cid);
 


alter table handover
add constraint FK_driver_handover  
foreign key(did) references driver(did);
 


alter table handover
add constraint FK_order_handover  
foreign key(osid) references order(osid);
 


alter table handover
add constraint FK_route_handover  
foreign key(rid) references route(rid);
 

--订单表

create table orders(
     osid  int primary key auto_increment,   
     osendName varchar(20),   --寄件人姓名
     osendTel  varchar(20) , --寄件人电话
     osendAddress  varchar(50),  --寄件人地址
     orecName varchar(20),   --收件人姓名
     orecTel  varchar(20),   --收件人电话
      orecAddress varchar(50),   --收件人地址
      orecCode varchar(20)  ,--收件人邮编
      orecPhone  varchar(20),   --备用字段
      otime Date ,   --订单日期
      oprice   double(10,2),   --配送费
       oinsurePrice  double(10,2),    --保价金额
      otype  int ,  --订单类型(0快件, 1慢件,  2大宗)
      ostatus  int ,--订单状态(0未发件, 1已发件, 2已送达,3 已取消)
      ostartTime  Date,   --要求启程时间
      oendTime  Date,    --要求到达时间
      orecSpname   varchar(50),   --备用字段
      oremark  varchar(5000),  --备注

      usId  int,  --用户id                                            --
      spid  int ,-- 所属单位id                                          --
      res1 varchar(2000),    --备用字段
      res2 varchar(2000),    --备用字段
      res3 varchar(2000),     --备用字段
      res4  varchar(2000)   --备用字段


)
select * from orders;


alter table order
add constraint FK_users_order  
foreign key(usId) references users(usId);
  

alter table order
add constraint FK_shipPoint_order  
foreign key(spid) references shipPoint(spid);
 


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

select * from price
update price set res1=0
insert into price(pfrom,pto,pfirstwei,prestwei,pfirstvol,prestvol,pretime,res1) values('衡阳','常德',20,21,18,19)

select pid, pfrom, pto, pfirstwei, prestwei, pfirstvol, prestvol, pretime, res1 from price
      where res1=0
	  limit 0,20

--订单详细
create table orderInfo(
  orderId int primary key auto_increment,
  osid  int,           --
  gid  int ,               --
  res1 varchar(2000)

)
alter table order
add constraint FK_orderInfo_order  
foreign key(osid) references order(osid);


alter table order
add constraint FK_goods_order  
foreign key(gid) references goods(gid);
