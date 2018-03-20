package com.yc.dao.Impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.yc.bean.From;
import com.yc.dao.FromDao;

@Repository
public class FromDaoImpl implements FromDao{
	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//查询省公司所有的报表
	@Override
	public List<From> findAllFrom(Map<String, Object> map) {
		return this.sqlSession.selectList("com.yc.bean.From.findAllFrom",map);
	}

	//查询数据的总条数
	@Override
	public List<From> findAllFromCount(Map<String, Object> map) {
		return this.sqlSession.selectList("com.yc.bean.From.findAllFromCount",map);
	}
	
	//查询订单的所有年份
	@Override
	public List<From> findFromYear() {
		return this.sqlSession.selectList("com.yc.bean.From.findFromYear");
	}
	
	//查询第一季度数据
	@Override
	public List<From> findFromJidu1(Map<String, Object> map) {
		return this.sqlSession.selectList("com.yc.bean.From.findFromJidu1",map);
	}
	
	//查询第二季度数据
	@Override
	public List<From> findFromJidu2(Map<String, Object> map) {
		return this.sqlSession.selectList("com.yc.bean.From.findFromJidu2",map);
	}
	
	//查询第三季度数据
	@Override
	public List<From> findFromJidu3(Map<String, Object> map) {
		return this.sqlSession.selectList("com.yc.bean.From.findFromJidu3",map);
	}
	
	//查询第四季度数据
	@Override
	public List<From> findFromJidu4(Map<String, Object> map) {
		return this.sqlSession.selectList("com.yc.bean.From.findFromJidu4",map);
	}
	
	//查询谋年某月的数据
	@Override
	public List<From> findFromMonth(Map<String, Object> map) {
		return this.sqlSession.selectList("com.yc.bean.From.findFromMonth",map);
	}
	
	//查询报表数据
	@Override
	public List<From> findFrombaobiao(Map<String, Object> map) {
		return this.sqlSession.selectList("com.yc.bean.From.findFrombaobiao",map);
	}
}
