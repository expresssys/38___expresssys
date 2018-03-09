package com.yc.dao.Impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.yc.bean.Orders;
import com.yc.dao.OrdersDao;
@Repository
public class OrdersDaoImpl implements OrdersDao {
	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public List<Orders> findAll(Integer start, Integer pagesize) {
		Map<String,Object> m=new HashMap<String,Object>();
		m.put("start", start);
		m.put("pagesize", pagesize);
	
		return this.sqlSession.selectList("com.yc.bean.Orders.findAll",m);
	}

	//条件查询
	@Override
	public List<Orders> findById(Orders s,Integer start, Integer pagesize) {
		Map<String,Object> m=new HashMap<String,Object>();
		m.put("start", start);
		m.put("pagesize", pagesize);
		m.put("orders", s);
		return this.sqlSession.selectList("com.yc.bean.Orders.selectById",m);
	}

	@Override
	public int add(Orders s) {
		
		return this.sqlSession.insert("com.yc.bean.Orders.insert",s);
	}

	@Override
	public int update(Orders s) {
		return this.sqlSession.insert("com.yc.bean.Orders.update",s);
	}

	@Override
	public int delete(Orders s) {
		
		return this.sqlSession.delete("com.yc.bean.Orders.deleteByPrimaryKey",s);
	}

	@Override
	public int total(Orders s) {
		
		 return this.sqlSession.selectOne("com.yc.bean.Orders.selectTotal",s);
	}

	public int updateStatus(Orders s){
		return this.sqlSession.selectOne("com.yc.bean.Orders.updateStatus",s);
	}
}
