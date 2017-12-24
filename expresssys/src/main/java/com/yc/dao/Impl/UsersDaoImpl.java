package com.yc.dao.Impl;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.yc.bean.Users;
import com.yc.dao.UsersDao;

@Repository
public class UsersDaoImpl implements UsersDao {

	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public Users login(Users admin) {
		return this.sqlSession.selectOne("com.yc.beans.users.adminLogin",admin);
	}

}
