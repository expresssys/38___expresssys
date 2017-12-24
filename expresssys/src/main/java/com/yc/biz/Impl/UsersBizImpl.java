package com.yc.biz.Impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yc.bean.Users;
import com.yc.biz.UsersBiz;
import com.yc.dao.UsersDao;

@Service
@Transactional
public class UsersBizImpl implements UsersBiz {
	private UsersDao adminDao;
	
	@Resource(name="usersDaoImpl")
	public void setAdminDao(UsersDao adminDao) {
		this.adminDao = adminDao;
	}


	@Override
	public Users adminlogin(Users admin) {
		
		return this.adminDao.login(admin);
	}

}
