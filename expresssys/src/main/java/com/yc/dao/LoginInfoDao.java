package com.yc.dao;

import java.util.List;

import com.yc.bean.Logininfo;

public interface LoginInfoDao {
	
	//查询登录日志   根据登录名查询
	public List<Logininfo> findLoginInfo(Logininfo logininfo,Integer start, Integer pagesize);
	
	//添加登录日志
	public int addLoginInfo(Logininfo logininfo);
	
	//修改
	public int updateLoginInfo(Logininfo logininfo);
	
	//删除
	public int deleteLoginInfo(Logininfo logininfo);
	
	//总数
			public int total(Logininfo s);


}
