package com.yc.dao.Impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.yc.bean.Driver;
import com.yc.bean.Logininfo;
import com.yc.dao.LoginInfoDao;

@Repository
public class LogininfoDaoImpl implements LoginInfoDao {

	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public List<Logininfo>  findLoginInfo(Logininfo logininfo, Integer start, Integer pagesize) {
		Map<String,Object> m=new HashMap<String,Object>();
		m.put("start", start);
		m.put("pagesize", pagesize);
		m.put("Logininfo", logininfo);
		return this.sqlSession.selectList("com.yc.bean.Logininfo.selectById",m);
	}

	@Override
	public int addLoginInfo(Logininfo logininfo) {
		return this.sqlSession.insert("com.yc.bean.Logininfo.insert",logininfo);
	}

	@Override
	public int updateLoginInfo(Logininfo logininfo) {
		return this.sqlSession.insert("com.yc.bean.Logininfo.update",logininfo);
	}

	@Override
	public int deleteLoginInfo(Logininfo logininfo) {
		return this.sqlSession.insert("com.yc.bean.Logininfo.delete",logininfo);
	}
	
	@Override
	public int total(Logininfo s) {
		return this.sqlSession.selectOne("com.yc.bean.Logininfo.selectTotal",s);
	}

}
