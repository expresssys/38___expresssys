package com.yc.biz;

import java.util.List;
import java.util.Map;

import com.yc.bean.Handover;
import com.yc.bean.Proxy;

public interface HandoverBiz {
	//根据订单详情中的订单id查询线路id
	public List<Handover> selectddByid(Integer osid);

	//根据线路id查询具体线路
	public List<Handover> selectxianluByid(Integer rid);

	//查询所有配送点
	public List<Handover> selectpoint();

	//查询所有司机
	public List<Handover> selectDriver();

	//添加交接单
	public int insertHandover(Handover handover);

	//查询是否有重复的订单
	public List<Handover> selectCopy(Handover handover);

	//查询车辆的类型
	public List<Handover> selectcartype();

	//查询车辆
	public List<Handover> selectcar(Handover handover);

	//根据收寄地查询
	public List<Handover> selectfromaddr(Map<String,Object> map);

	//根据收寄地查询
	public List<Handover> selecttoaddr(Map<String,Object> map);
	
	//条件查询
	public List<Handover> findBy(Handover handover);
	
	//修改
	public int update(Handover handover);
}
