package com.yc.dao;

import java.util.List;
import java.util.Map;

import com.yc.bean.Proxy;

public interface ProxyDao {
	//查询所有代理点
	public List<Proxy> findAllProxy(Map<String,Object> map);
	
	//增加代理点
	public int proxyadd(Proxy proxy);
	
	//修改代理点
	public int proxyupdate(Proxy proxy);
	
	//删除代理点
	public int deleteByPrimaryKey(Integer prid);
	
	//查找总条数
	public List<Proxy> proxycount(Map<String,Object> map);
	
	//查询所有配送点
	public List<Proxy> selectpoint();
}
