package com.yc.biz.Impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yc.bean.Logininfo;
import com.yc.biz.LoginInfoBiz;
import com.yc.dao.LoginInfoDao;

@Service
@Transactional
public class LogininfoBizImpl implements LoginInfoBiz {
	private LoginInfoDao logininfoDao;
	
	@Resource(name="logininfoDaoImpl")
	public void setLogininfoDao(LoginInfoDao logininfoDao) {
		this.logininfoDao = logininfoDao;
	}

	@Override
	public Map<String, Object> findLoginInfo(Logininfo logininfo, Integer start, Integer pagesize) {
		Map<String, Object> result=new  HashMap<String, Object>();
		List<Logininfo> rows=this.logininfoDao.findLoginInfo(logininfo, start, pagesize);
		int total=this.logininfoDao.total(logininfo);
		result.put("rows", rows);
		result.put("total", total);
		return result;
	}

	@Override
	public int addLoginInfo(Logininfo logininfo) {
		return this.logininfoDao.addLoginInfo(logininfo);
	}

	@Override
	public int updateLoginInfo(Logininfo logininfo) {
		return this.logininfoDao.updateLoginInfo(logininfo);
	}

	@Override
	public int deleteLoginInfo(Logininfo logininfo) {
		return this.logininfoDao.deleteLoginInfo(logininfo);
	}

}
