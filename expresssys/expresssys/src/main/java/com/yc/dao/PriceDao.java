package com.yc.dao;

import java.util.List;
import java.util.Map;

import com.yc.bean.Price;

public interface PriceDao {
	//查询全部并条件查询
	public List<Price> selectPrice(Map<String,Object> map);
	
	//查询总条数
	public List<Price> selectcount(Map<String,Object> map);
	
	//查询配送点
	public List<Price> selectaddr();
	
	//添加价格
	public int addprice(Price price);
	
	//修改价格
	public int updateprice(Price price);
	
	//删除价格
	public int deleteprice(Integer pid);
}
