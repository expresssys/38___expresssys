package com.yc.biz;

import java.util.List;
import java.util.Map;

import com.yc.bean.ConstType;

public interface ConstTypeBiz {

	//添加ConstType
	public int  addConstType(ConstType constType) throws Exception ;
	
	//更新ConstType
	public int updateConstType(ConstType constType)throws Exception  ;
	
	//删除ConstType
	public int delConstType(ConstType constType) throws Exception ;
	
	//通过条件查询ConstType
	public List<ConstType> findConstTypeByInfo(ConstType constType) throws Exception ;

}
