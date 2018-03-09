package com.yc.biz;

import java.util.List;
import java.util.Map;

import com.yc.bean.Const;

public interface ConstBiz {
	//添加Const
	public int  addConst(Const c) throws Exception ;

	//更新Const
	public int updateConst(Const c)throws Exception  ;

	//删除Const
	public int delConst(Const c) throws Exception ;

	//通过条件查询Const
	public List<Const> findConstByInfo(Const c) throws Exception ;

}
