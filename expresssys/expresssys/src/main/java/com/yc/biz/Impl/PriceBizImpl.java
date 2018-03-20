package com.yc.biz.Impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yc.bean.Price;
import com.yc.bean.Proxy;
import com.yc.biz.PriceBiz;
import com.yc.biz.ProxyBiz;
import com.yc.dao.PriceDao;
import com.yc.dao.ProxyDao;

@Service
@Transactional
public class PriceBizImpl implements PriceBiz {
	@Resource(name="priceDaoImpl")
	private PriceDao priceDao;

	public void setPriceDao(PriceDao priceDao) {
		this.priceDao = priceDao;
	}
	
	//查询数据
	@Override
	public List<Price> selectPrice(Map<String, Object> map) {
		return this.priceDao.selectPrice(map);
	}
	
	//查询总条数
	@Override
	public List<Price> selectcount(Map<String, Object> map) {
		return this.priceDao.selectcount(map);
	}
	
	//查询配送点
	@Override
	public List<Price> selectaddr() {
		return this.priceDao.selectaddr();
	}
	
	//添加价格
	@Override
	public int addprice(Price price) {
		return this.priceDao.addprice(price);
	}
	
	//修改价格
	@Override
	public int updateprice(Price price) {
		return this.priceDao.updateprice(price);
	}
	
	//删除价格
	@Override
	public int deleteprice(Integer pid) {
		return this.priceDao.deleteprice(pid);
	}



}
