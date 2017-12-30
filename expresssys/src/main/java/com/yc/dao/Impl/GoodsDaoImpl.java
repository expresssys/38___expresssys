package com.yc.dao.Impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.yc.bean.Goods;
import com.yc.dao.GoodsDao;

@Repository
public class GoodsDaoImpl implements GoodsDao {

	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public int addGoods(Goods goods) {
		return this.sqlSession.insert("com.yc.bean.good.insertSelective", goods);
	}

	@Override
	public int updateGoods(Goods goods) {
		return this.sqlSession.update("com.yc.bean.good.updateByPrimaryKeySelective", goods);
	}

	@Override
	public List<Goods> findBy(Map map) {
		return this.sqlSession.selectList("com.yc.bean.good.findBy", map);
	}

	@Override
	public int total(Goods goods) {
		return this.sqlSession.selectOne("com.yc.bean.good.selectTotal", goods);
		
	}
	
	

}
