package com.yc.biz;

import java.util.List;
import java.util.Map;

import com.yc.bean.Users;


public interface UsersBiz {
	//管理员的登录

	public Users adminlogin(Users users);

	
	//信息更新
	public int update(Users users);
	
	
	//条件查询  分页
	public List<Users> findBy(Map map);	

}
