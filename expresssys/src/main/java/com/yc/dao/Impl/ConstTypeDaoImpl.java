package com.yc.dao.Impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.yc.bean.ConstType;
import com.yc.dao.ConstTypeDao;

@Repository
public class ConstTypeDaoImpl implements ConstTypeDao{

	@Resource(name="sqlSession")
	private SqlSessionTemplate sqlSession;
		
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public int addConstType(ConstType constType) {
		return this.sqlSession.insert("com.yc.bean.ConstType.insertSelective", constType);
	}

	@Override
	public int updateConstType(ConstType constType) {
		return this.sqlSession.update("com.yc.bean.ConstType.updateByPrimaryKeySelective",constType);
	}

	@Override
	public List<ConstType> findBy(ConstType constType) {
		return sqlSession.selectList("com.yc.bean.ConstType.findBy",constType);
	}

	@Override
	public int total(ConstType constType) {
		return sqlSession.selectOne("com.yc.bean.ConstType.selectTotal",constType);
	}
	
}
