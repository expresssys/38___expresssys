package com.yc.dao.Impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.yc.bean.Driver;
import com.yc.dao.DriverDao;

@Repository
public class DriverDaoImpl implements DriverDao {
	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	

	@Override
	public List<Driver> findAll(Integer start, Integer pagesize) {
		Map<String,Object> m=new HashMap<String,Object>();
		m.put("start", start);
		m.put("pagesize", pagesize);
	
		return this.sqlSession.selectList("com.yc.bean.Driver.findAll",m);
	}

	@Override
	public List<Driver> findById(Driver s, Integer start, Integer pagesize) {
		Map<String,Object> m=new HashMap<String,Object>();
		m.put("start", start);
		m.put("pagesize", pagesize);
		m.put("Driver", s);
		return this.sqlSession.selectList("com.yc.bean.Driver.selectById",m);
	}

	@Override
	public int add(Driver s) {
		return this.sqlSession.insert("com.yc.bean.Driver.insert",s);
	}

	@Override
	public int update(Driver s) {
		return this.sqlSession.insert("com.yc.bean.Driver.update",s);
	}

	@Override
	public int delete(Driver s) {
		return this.sqlSession.delete("com.yc.bean.Driver.delete",s);
	}

	@Override
	public int total(Driver s) {
		return this.sqlSession.selectOne("com.yc.bean.Driver.selectTotal",s);
	}

}
