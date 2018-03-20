package com.yc.biz.Impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yc.bean.From;
import com.yc.biz.FromBiz;
import com.yc.dao.FromDao;

@Service
@Transactional
public class FromBizImpl implements FromBiz{
	@Resource(name="fromDaoImpl")
	private FromDao fromDao;
	
	public void setFromDao(FromDao fromDao) {
		this.fromDao = fromDao;
	}

	//查询省公司所有的报表 
	@Override
	public List<From> findAllFrom(Map<String, Object> map) {
		return this.fromDao.findAllFrom(map);
	}
	
	//查询数据的总条数
	@Override
	public List<From> findAllFromCount(Map<String, Object> map) {
		return this.fromDao.findAllFromCount(map);
	}
	
	//查询订单的所有年份
	@Override
	public List<From> findFromYear() {
		return this.fromDao.findFromYear();
	}
	
	//查询第一季度数据
	@Override
	public List<From> findFromJidu1(Map<String, Object> map) {
		return this.fromDao.findFromJidu1(map);
	}
	
	//查询第一季度数据
	@Override
	public List<From> findFromJidu2(Map<String, Object> map) {
		return this.fromDao.findFromJidu2(map);
	}
	
	//查询第一季度数据
	@Override
	public List<From> findFromJidu3(Map<String, Object> map) {
		return this.fromDao.findFromJidu3(map);
	}
	
	//查询第一季度数据
	@Override
	public List<From> findFromJidu4(Map<String, Object> map) {
		return this.fromDao.findFromJidu4(map);
	}
	
	//查询谋年某月的数据
	@Override
	public List<From> findFromMonth(Map<String, Object> map) {
		return this.fromDao.findFromMonth(map);
	}
	
	//查询报表数据
	@Override
	public List<From> findFrombaobiao(Map<String, Object> map) {
		return this.fromDao.findFrombaobiao(map);
	}

}
