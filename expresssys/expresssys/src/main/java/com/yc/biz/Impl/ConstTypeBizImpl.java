package com.yc.biz.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yc.bean.ConstType;
import com.yc.biz.ConstTypeBiz;
import com.yc.dao.ConstTypeDao;

@Service
@Transactional
public class ConstTypeBizImpl implements ConstTypeBiz{

	private ConstTypeDao constTypeDao;
	
	@Resource(name="constTypeDaoImpl")
	public void setConstTypeDao(ConstTypeDao constTypeDao) {
		this.constTypeDao = constTypeDao;
	}
	
	
	@Override
	public int addConstType(ConstType constType) throws Exception {
		return this.constTypeDao.addConstType(constType);
	}

	@Override
	public int updateConstType(ConstType constType) throws Exception {
		return this.constTypeDao.updateConstType(constType);
	}

	@Override
	public int delConstType(ConstType constType) throws Exception {
		if(constType.getCtid()==null){
			return 0;
		}
		constType.setCtstatus(0);
		return this.constTypeDao.updateConstType(constType);
	}

	@Override
	public List<ConstType> findConstTypeByInfo(ConstType constType) throws Exception {
		List<ConstType> constTypes = this.constTypeDao.findBy(constType);
		return constTypes;
	}

}
