package com.yc.biz.Impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yc.bean.Handover;
import com.yc.biz.HandoverBiz;
import com.yc.dao.HandoverDao;

@Service
@Transactional
public class HandoverBizImpl implements HandoverBiz {
	@Resource(name="handoverDaoImpl")
	private HandoverDao handoverDao;

	public void setHandoverDao(HandoverDao handoverDao) {
		this.handoverDao = handoverDao;
	}
	
	//根据订单详情中的订单id查询线路id
	@Override
	public List<Handover> selectddByid(Integer osid) {
		return this.handoverDao.selectddByid(osid);
	}
	
	//根据线路id查询具体线路
	@Override
	public List<Handover> selectxianluByid(Integer rid) {
		return this.handoverDao.selectxianluByid(rid);
	}
	
	//查询所有配送点
	@Override
	public List<Handover> selectpoint() {
		return this.handoverDao.selectpoint();
	}
	
	//查询所有司机
	@Override
	public List<Handover> selectDriver() {
		return this.handoverDao.selectDriver();
	}
	
	//添加交接单
	@Override
	public int insertHandover(Handover handover) {
		return this.handoverDao.insertHandover(handover);
	}
	
	//查询是否有重复的订单
	@Override
	public List<Handover> selectCopy(Handover handover) {
		return this.handoverDao.selectCopy(handover);
	}
	
	//查询车辆的类型
	@Override
	public List<Handover> selectcartype() {
		return this.handoverDao.selectcartype();
	}
	
	//查询车辆
	@Override
	public List<Handover> selectcar(Handover handover) {
		return this.handoverDao.selectcar(handover);
	}
	
	//根据收寄地查询
	@Override
	public List<Handover> selectfromaddr(Map<String,Object> map) {
		return this.handoverDao.selectfromaddr(map);
	}
	
	//根据收寄地查询
	@Override
	public List<Handover> selecttoaddr(Map<String,Object> map) {
		return this.handoverDao.selecttoaddr(map);
	}

	@Override
	public List<Handover> findBy(Handover handover) {
		return this.handoverDao.findBy(handover);
	}

	@Override
	public int update(Handover handover) {
		return this.handoverDao.update(handover);
	}
	
}
