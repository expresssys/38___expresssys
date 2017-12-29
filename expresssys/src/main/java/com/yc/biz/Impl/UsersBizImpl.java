package com.yc.biz.Impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yc.Util.MD5Encryption;
import com.yc.bean.Shippoint;
import com.yc.bean.Users;
import com.yc.biz.UsersBiz;
import com.yc.dao.UsersDao;

@Service
@Transactional
public class UsersBizImpl implements UsersBiz {
	private UsersDao usersDao;

	@Resource(name="usersDaoImpl")
	public void setAdminDao(UsersDao adminDao) {
		this.usersDao = adminDao;
	}


	@Override
	public Users adminlogin(Users users) {
		
		if(users!=null){
			users.setUpwd(MD5Encryption.createPassword(users.getUpwd()));
			return this.usersDao.login(users);
		}
		return null;
	}

	@Override
	public int updateUsers(Users users) {
		
		if(users.getUsid()==null || "".equals(users.getUsid())){
			return 0;
		}
		//密码修改
		if(users.getUpwd()!=null && !"".equals(users.getUpwd())){
			users.setUpwd(MD5Encryption.createPassword(users.getUpwd()));
		}
		return this.usersDao.update(users);
	}


	//条件查询
	@Override
	public Map<String,Object> findBy(Map map) {
		Map<String, Object> result=new  HashMap<String, Object>();
		List<Users> rows= this.usersDao.findBy(map);
		//查询条件下的总条数
		int total=this.usersDao.total((Users) map.get("users"));
		result.put("rows", rows);
		result.put("total", total);
		return result;
	}
	
	//添加
	public int addUsers(Users users){
		//对密码加密
		users.setUpwd(MD5Encryption.createPassword(users.getUpwd()));
		int status = this.usersDao.add(users);
		return status;
	}

}
