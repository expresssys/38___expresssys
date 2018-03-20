package com.yc.dao.Impl;

import java.util.List;
import java.util.Map;

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
	public Users login(Users users) {
		return this.sqlSession.selectOne("com.yc.beans.Users.adminLogin",users);
	}

	@Override
	public int update(Users users) {
		return this.sqlSession.update("com.yc.beans.Users.updateByPrimaryKeySelective", users);
	}

	@Override
	public List<Users> findBy(Map map) {
		return this.sqlSession.selectList("com.yc.beans.Users.findBy", map);
	}

	@Override
	public int total(Users users) {
		return this.sqlSession.selectOne("com.yc.beans.Users.selectTotal", users);
	}

	@Override
	public int add(Users users) {
		return this.sqlSession.insert("com.yc.beans.Users.insertSelective", users);
	}

}
