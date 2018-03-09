package com.yc.dao;

import java.util.List;
import java.util.Map;

import com.yc.bean.Const;


public interface ConstDao {
	
	public int addConst(Const c);
	
	public int updateConst(Const c);
	
	public List<Const> findBy(Const c);
	
	public int total(Const c);
	
}
