package com.yc.biz.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yc.bean.Const;
import com.yc.biz.ConstBiz;
import com.yc.dao.ConstDao;

@Service
@Transactional
public class ConstBizImpl implements ConstBiz{

	private ConstDao constDao;
	
	@Resource(name="constDaoImpl")
	public void setConstTypeDao(ConstDao constDao) {
		this.constDao = constDao;
	}

	@Override
	public int addConst(Const c) throws Exception {
		if(c.getCtid() == null){
			return 0;
		}
		return this.constDao.addConst(c);
	}

	@Override
	public int updateConst(Const c) throws Exception {
		return this.constDao.updateConst(c);
	}

	@Override
	public int delConst(Const c) throws Exception {
		if(c.getCid()==null){
			return 0;
		}
		c.setCstatus(0);
		return this.constDao.updateConst(c);
	}

	@Override
	public List<Const> findConstByInfo(Const c) throws Exception {
		List<Const> consts = this.constDao.findBy(c);
		return consts;
	}
	
}
