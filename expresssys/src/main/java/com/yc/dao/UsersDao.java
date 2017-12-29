package com.yc.dao;


import java.util.List;
import java.util.Map;

import com.yc.bean.Users;

public interface UsersDao {
	
	//管理员的登录
	
	public Users login(Users user);
	
	//管理员信息修改
	public int update(Users user);
	
	//管理查询  分页
	public List<Users> findBy(Map map);

	//查询总数
	public int total(Users users);
	
	//添加
	public int add(Users users);
}
