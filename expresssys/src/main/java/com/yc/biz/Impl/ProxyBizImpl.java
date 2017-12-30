package com.yc.biz.Impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yc.bean.Proxy;
import com.yc.biz.ProxyBiz;
import com.yc.dao.ProxyDao;

@Service
@Transactional
public class ProxyBizImpl implements ProxyBiz {
	@Resource(name="proxyDaoImpl")
	private ProxyDao proxyDao;

	public void setProxyDao(ProxyDao proxyDao) {
		this.proxyDao = proxyDao;
	}
	
	//查找代理点
	@Override
	public List<Proxy> findAllProxy(Map<String,Object> map) {
		return this.proxyDao.findAllProxy(map);
	}
	
	//代理点增加
	@Override
	public int proxyadd(Proxy proxy) {
		return this.proxyDao.proxyadd(proxy);
	}

	//代理点修改
	@Override
	public int proxyupdate(Proxy proxy) {
		return this.proxyDao.proxyupdate(proxy);
	}
	
	//删除代理点
	@Override
	public int deleteByPrimaryKey(Integer prid) {
		return this.proxyDao.deleteByPrimaryKey(prid);
	}
	
	//查询总条数
	@Override
	public List<Proxy> proxycount(Map<String,Object> map) {
		return this.proxyDao.proxycount(map);
	}
	
	//查询所有配送点
	@Override
	public List<Proxy> selectpoint() {
		return this.proxyDao.selectpoint();
	}


}
