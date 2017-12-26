package com.yc.dao.Impl;

import java.util.List;

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
	public List<Shippoint> findAll() {
		
		return this.sqlSession.selectList("com.yc.bean.shippoint.findAll");
	}

	@Override
	public Shippoint findById(Shippoint s) {
		return this.sqlSession.selectOne("com.yc.bean.shippoint.selectById",s);
	}

	@Override
	public int add(Shippoint s) {
		
		return this.sqlSession.insert("com.yc.bean.shippoint.insert",s);
	}

	@Override
	public int update(Shippoint s) {
		
		return 0;
	}

	@Override
	public int delete(Shippoint s) {
		
		return this.sqlSession.delete("com.yc.bean.shippoint.deleteByPrimaryKey",s);
	}

}
