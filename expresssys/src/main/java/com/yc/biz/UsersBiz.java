package com.yc.biz;

import java.util.List;
import java.util.Map;

import com.yc.bean.Users;


public interface UsersBiz {
	//管理员的登录

	public Users adminlogin(Users users);

	
	//信息更新
	public int updateUsers(Users users);
	
	
	//条件查询  分页
	public Map<String,Object> findBy(Map map);	

	//添加
	public int addUsers(Users users);
}
