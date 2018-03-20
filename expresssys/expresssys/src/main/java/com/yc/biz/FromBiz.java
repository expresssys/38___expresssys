package com.yc.biz;

import java.util.List;
import java.util.Map;

import com.yc.bean.From;

public interface FromBiz {
	//查询省公司所有的报表 
	public List<From> findAllFrom(Map<String,Object> map);

	//查询数据的总条数
	public List<From> findAllFromCount(Map<String,Object> map);

	//查询订单的所有年份
	public List<From> findFromYear();

	//查询第一季度数据
	public List<From> findFromJidu1(Map<String,Object> map);

	//查询第二季度数据
	public List<From> findFromJidu2(Map<String,Object> map);

	//查询第三季度数据
	public List<From> findFromJidu3(Map<String,Object> map);

	//查询第四季度数据
	public List<From> findFromJidu4(Map<String,Object> map);
	
	//查询谋年某月的数据
	public List<From> findFromMonth(Map<String,Object> map);
	
	//查询报表数据
	public List<From> findFrombaobiao(Map<String,Object> map);

}
