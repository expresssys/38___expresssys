package com.yc.dao.Impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.yc.bean.Route;
import com.yc.dao.RouteDao;

@Repository
public class RouteDaoImpl implements RouteDao {
	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	

	@Override
	public List<Route> findAll(Integer start, Integer pagesize) {
		Map<String,Object> m=new HashMap<String,Object>();
		m.put("start", start);
		m.put("pagesize", pagesize);
	
		return this.sqlSession.selectList("com.yc.bean.Route.findAll",m);
	}

	@Override
	public List<Route> findById(Route s, Integer start, Integer pagesize) {
		Map<String,Object> m=new HashMap<String,Object>();
		m.put("start", start);
		m.put("pagesize", pagesize);
		m.put("Route", s);
		return this.sqlSession.selectList("com.yc.bean.Route.selectById",m);
	}

	@Override
	public int add(Route s) {
		return this.sqlSession.insert("com.yc.bean.Route.insert",s);
	}

	@Override
	public int update(Route s) {
		return this.sqlSession.insert("com.yc.bean.Route.update",s);
	}

	@Override
	public int delete(Route s) {
		return this.sqlSession.delete("com.yc.bean.Route.delete",s);
	}

	@Override
	public int total(Route s) {
		return this.sqlSession.selectOne("com.yc.bean.Route.selectTotal",s);
	}

}
