package com.yc.dao.Impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.yc.bean.Shippoint;
import com.yc.dao.ShipPointDao;
@Repository
public class ShippointDaoImpl implements ShipPointDao {
	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public List<Shippoint> findAll(Integer start, Integer pagesize) {
		Map<String,Object> m=new HashMap<String,Object>();
		m.put("start", start);
		m.put("pagesize", pagesize);
	
		return this.sqlSession.selectList("com.yc.bean.Shippoint.findAll",m);
	}

	@Override
	public List<Shippoint> findById(Shippoint s,Integer start, Integer pagesize) {
		Map<String,Object> m=new HashMap<String,Object>();
		m.put("start", start);
		m.put("pagesize", pagesize);
		s.setSpaddress("%"+s.getSpaddress()+"%");
		m.put("shippoint", s);
		
		return this.sqlSession.selectList("com.yc.bean.Shippoint.selectById",m);
	}

	@Override
	public int add(Shippoint s) {
		
		return this.sqlSession.insert("com.yc.bean.Shippoint.insert",s);
	}

	@Override
	public int update(Shippoint s) {
		
		return this.sqlSession.insert("com.yc.bean.Shippoint.update",s);
	}

	@Override
	public int delete(Shippoint s) {
		
		return this.sqlSession.delete("com.yc.bean.Shippoint.deleteByPrimaryKey",s);
	}

	@Override
	public int total(Shippoint s) {
		 return this.sqlSession.selectOne("com.yc.bean.Shippoint.selectTotal",s);
	}

}
