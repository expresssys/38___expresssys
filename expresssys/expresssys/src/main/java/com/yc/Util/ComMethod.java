package com.yc.Util;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import com.yc.bean.Const;

public class ComMethod {
	
	public static Map<String,String> getConst(HttpServletRequest request,String type){
		Map<String,String> result = new HashMap<String,String>();
		
		
		ServletContext application = request.getSession().getServletContext();
		Map<String,List<Const>> allConsts = (Map<String,List<Const>>) application.getAttribute("ALLCONST");
		List<Const> consts = allConsts.get(type);
		
		if(consts !=null && consts.size() > 0){
			for(int i=0;i<consts.size();i++){
				result.put(consts.get(i).getCstatus().toString(), consts.get(i).getCname());
			}
		}
		
		return result;
	}
}
