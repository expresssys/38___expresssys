package com.yc.biz.Impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yc.bean.Goods;
import com.yc.biz.GoodsBiz;
import com.yc.dao.GoodsDao;

@Service
@Transactional
public class GoodsBizImpl implements GoodsBiz {
	private GoodsDao goodsDao;

	@Resource(name="goodsDaoImpl")
	public void setAdminDao(GoodsDao goodsDao) {
		this.goodsDao = goodsDao;
	}

	@Override
	public int addGoods(Goods goods) {
		
		
		int status = this.goodsDao.addGoods(goods);
		return status;
	}

	
	@Override
	public Map<String, Object> findBy(Map map) {
		Map<String, Object> result=new  HashMap<String, Object>();
		List<Goods> rows = this.goodsDao.findBy(map);
		
		int total = this.goodsDao.total((Goods)map.get("goods"));
		result.put("rows", rows);
		result.put("total", total);
		return result;
	}

	@Override
	public int updateGoods(Goods goods) {
		if(goods.getGid()==null || "".equals(goods.getGid()) ){
			return 0;
		}
		return this.goodsDao.updateGoods(goods);
	}


	

	

}
