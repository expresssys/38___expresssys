package com.yc.dao.Impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.yc.bean.Proxy;

import com.yc.dao.ProxyDao;

@Repository
public class ProxyDaoImpl implements ProxyDao {

	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//查询所有代理点
	@Override
	public List<Proxy> findAllProxy(Map<String,Object> map) {
		return this.sqlSession.selectList("com.yc.bean.Proxy.findAllProxy",map);
	}
	
	//增加代理点
	@Override
	public int proxyadd(Proxy proxy) {
		return this.sqlSession.insert("com.yc.bean.Proxy.proxyadd",proxy);
	}
	
	//修改代理点
	@Override
	public int proxyupdate(Proxy proxy) {
		return this.sqlSession.update("com.yc.bean.Proxy.proxyupdate",proxy);
	}
	
	//删除代理点
	@Override
	public int deleteByPrimaryKey(Integer prid) {
		return this.sqlSession.update("com.yc.bean.Proxy.deleteByPrimaryKey",prid);
	}
	
	//查询总条数
	@Override
	public List<Proxy> proxycount(Map<String,Object> map) {
		return this.sqlSession.selectList("com.yc.bean.Proxy.proxycount",map);
	}

	@Override
	public List<Proxy> selectpoint() {
		return this.sqlSession.selectList("com.yc.bean.Proxy.selectpoint");
	}
	

}
