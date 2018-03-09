package com.yc.dao;

import java.util.List;
import java.util.Map;

import com.yc.bean.ConstType;


public interface ConstTypeDao {
	
	public int addConstType(ConstType constType);
	
	public int updateConstType(ConstType constType);
	
	public List<ConstType> findBy(ConstType constType);
	
	public int total(ConstType constType);
	
}
