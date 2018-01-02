package com.yc.dao.Impl;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.yc.bean.Price;
import com.yc.dao.PriceDao;

@Repository
public class PriceDaoImpl implements PriceDao {

	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<Price> selectPrice(Map<String, Object> map) {
		return this.sqlSession.selectList("com.yc.bean.Price.selectPrice",map);
	}

	@Override
	public List<Price> selectcount(Map<String, Object> map) {
		return this.sqlSession.selectList("com.yc.bean.Price.selectcount",map);
	}

	@Override
	public List<Price> selectaddr() {
		return this.sqlSession.selectList("com.yc.bean.Price.selectaddr");
	}

	@Override
	public int addprice(Price price) {
		return this.sqlSession.insert("com.yc.bean.Price.addprice",price);
	}

	@Override
	public int updateprice(Price price) {
		return this.sqlSession.update("com.yc.bean.Price.updateprice",price);
	}

	@Override
	public int deleteprice(Integer pid) {
		return this.sqlSession.update("com.yc.bean.Price.deleteprice",pid);
	}
	

}
