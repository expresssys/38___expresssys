package com.yc.dao.Impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.yc.bean.Handover;
import com.yc.dao.HandoverDao;

@Repository
public class HandoverDaoImpl implements HandoverDao {

	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//根据订单详情中的订单id查询线路id
	@Override
	public List<Handover> selectddByid(Integer osid) {
		return this.sqlSession.selectList("com.yc.bean.Handover.selectddByid",osid);
	}
	
	//根据线路id查询具体线路
	@Override
	public List<Handover> selectxianluByid(Integer rid) {
		return this.sqlSession.selectList("com.yc.bean.Handover.selectxianluByid",rid);
	}

	@Override
	public List<Handover> selectpoint() {
		return this.sqlSession.selectList("com.yc.bean.Handover.selectpoint");
	}

	@Override
	public List<Handover> selectDriver() {
		return this.sqlSession.selectList("com.yc.bean.Handover.selectDriver");
	}

	@Override
	public int insertHandover(Handover handover) {
		return this.sqlSession.insert("com.yc.bean.Handover.insertHandover",handover);
	}

	@Override
	public List<Handover> selectCopy(Handover handover) {
		return this.sqlSession.selectList("com.yc.bean.Handover.selectCopy",handover);
	}

	@Override
	public List<Handover> selectcartype() {
		return this.sqlSession.selectList("com.yc.bean.Handover.selectcartype");
	}

	@Override
	public List<Handover> selectcar(Handover handover) {
		return this.sqlSession.selectList("com.yc.bean.Handover.selectcar",handover);
	}

	@Override
	public List<Handover> selectfromaddr(Map<String,Object> map) {
		return this.sqlSession.selectList("com.yc.bean.Handover.selectfromaddr",map);
	}

	@Override
	public List<Handover> selecttoaddr(Map<String,Object> map) {
		return this.sqlSession.selectList("com.yc.bean.Handover.selecttoaddr",map);
	}

	

}
