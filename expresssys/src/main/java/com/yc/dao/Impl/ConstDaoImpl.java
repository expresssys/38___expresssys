package com.yc.dao.Impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.yc.bean.Const;
import com.yc.dao.ConstDao;

@Repository
public class ConstDaoImpl implements ConstDao{

	@Resource(name="sqlSession")
	private SqlSessionTemplate sqlSession;
		
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public int addConst(Const c) {
		return this.sqlSession.insert("com.yc.bean.Const.insertSelective", c);
	}

	@Override
	public int updateConst(Const c) {
		return this.sqlSession.update("com.yc.bean.Const.updateByPrimaryKeySelective",c);
	}

	@Override
	public List<Const> findBy(Const c) {
		return sqlSession.selectList("com.yc.bean.Const.findBy",c);
	}

	@Override
	public int total(Const c) {
		return sqlSession.selectOne("com.yc.bean.Const.selectTotal",c);
	}
	
}
