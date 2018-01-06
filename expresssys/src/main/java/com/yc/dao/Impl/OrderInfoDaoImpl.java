package com.yc.dao.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.yc.bean.Orderinfo;
import com.yc.bean.Orders;
import com.yc.dao.OrderInfoDao;
@Repository
public class OrderInfoDaoImpl implements OrderInfoDao {
	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	@Override
	public void addOrderInfo(Orderinfo ordersinfo) throws Exception {
          this.sqlSession.insert("com.yc.bean.Orderinfo.insert",ordersinfo);
	}

	@Override
	public void updateOrderInfo(Orderinfo orderinfo) throws Exception {
        this.sqlSession.update("com.yc.bean.Orderinfo.updateByPrimaryKeySelective",orderinfo);

	}

	@Override
	public void delOrderInfo(Orderinfo orderinfo) throws Exception {
		this.sqlSession.update("com.yc.bean.Orderinfo.deleteByPrimaryKey",orderinfo);

	}

	@Override
	public List<Orderinfo> findorderInfo(Orders orders) throws Exception {
		
		return this.sqlSession.selectList("com.yc.bean.Orderinfo.selectByPrimaryKey",orders);
	}

	@Override
	public int total(Orders orders) throws Exception {
		
		return this.sqlSession.selectOne("com.yc.bean.Orderinfo.selectTotal",orders);
	}
	@Override
	public Orderinfo findOrderOsid(Orderinfo orderinfo) {
		return this.sqlSession.selectOne("com.yc.bean.Orderinfo.selectByosid",orderinfo);
	}

}
