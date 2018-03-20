package com.yc.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yc.bean.From;
import com.yc.bean.JsonData;
import com.yc.bean.TestlineData;
import com.yc.biz.FromBiz;

@Controller
@Scope(value="prototype")
@RequestMapping(value="Admin/")
public class FromController {
	@Resource(name="fromBizImpl")
	private FromBiz fromBiz;

	//查询省公司所有的报表 
	@RequestMapping(value="findAllFrom.action")
	@ResponseBody
	public Map<String,Object> findAllFrom(String fromtime,HttpServletRequest request){
		Calendar now = Calendar.getInstance();
		if(fromtime!=null && !"".equals(fromtime)){
			fromtime=fromtime;
		}else{
			fromtime=String.valueOf(now.get(Calendar.YEAR)-1);
		}
		Map<String,Object> map=new HashMap<String,Object>();
		Integer start=Integer.parseInt(request.getParameter("page"));
		Integer pagesize=Integer.parseInt(request.getParameter("rows"));
		map.put("fromtime", fromtime);
		map.put("start", start-1);
		map.put("pagesize", pagesize);
		List<From> list=fromBiz.findAllFrom(map);
		//查询总条数
		map=new HashMap<String,Object>();
		map.put("fromtime", fromtime);
		map=new HashMap<String,Object>();
		List<From> list1=fromBiz.findAllFromCount(map);
		map.put("total", list1.get(0).getCount());
		map.put("rows", list);
		return map;
	}

	//查询订单所有的年份
	@RequestMapping(value="findFromYear.action")
	@ResponseBody
	public List<From> findFromYear(HttpServletRequest request){
		List<From> list=fromBiz.findFromYear();
		return list;
	}

	//查询季度报表
	@RequestMapping(value="findFromJidu.action")
	@ResponseBody
	public List<From> findFromJidu(String fromtime,String jidu,HttpServletRequest request){
		Integer start=Integer.parseInt(request.getParameter("page"));
		Integer pagesize=Integer.parseInt(request.getParameter("rows"));
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("fromtime", fromtime);
		map.put("start", start);
		map.put("pagesize", pagesize);
		System.out.println(map);
		List<From> list=null;
		if("1".equals(jidu)){
			list=fromBiz.findFromJidu1(map);
		}else if("2".equals(jidu)){
			list=fromBiz.findFromJidu2(map);
		}else if("3".equals(jidu)){
			list=fromBiz.findFromJidu3(map);
		}else if("4".equals(jidu)){
			list=fromBiz.findFromJidu4(map);
		}
		return list;
	}
	
	//查询谋年某月的数据
	@RequestMapping(value="findFromMonth.action")
	@ResponseBody
	public List<From> findFromMonth(String fromtime,String month,HttpServletRequest request){
		Integer start=Integer.parseInt(request.getParameter("page"));
		Integer pagesize=Integer.parseInt(request.getParameter("rows"));
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("fromtime", fromtime);
		map.put("month", month);
		map.put("start", start);
		map.put("pagesize", pagesize);
		List<From> list=fromBiz.findFromMonth(map);
		return list;
	}
	
	@RequestMapping(value="findFrombaobiao.action")
	@ResponseBody
	public Object findFrombaobiao(String prname,String spname,HttpServletRequest request){
		String[] data1={"0", "0", "0", "0","0", "0", "0","0","0","0","0","0"};
		String[] data2={"0", "0", "0", "0","0", "0", "0","0","0","0","0","0"};
		String[] data3={"0", "0", "0", "0","0", "0", "0","0","0","0","0","0"};
		Calendar now = Calendar.getInstance();
		Map<String,Object> map=new HashMap<String,Object>();
		//当前年
		map.put("year", now.get(Calendar.YEAR));
		List<From> list=fromBiz.findFrombaobiao(map);
		if(list!=null && list.size()>0){
			for(int i=0;i<list.size();i++){
				data1[Integer.parseInt(list.get(i).getMonth())-1]=list.get(i).getCountprice();
			}
		}else{
			data1=data1;
		}
		JsonData jd1 = new JsonData();  
		jd1.setName(String.valueOf(now.get(Calendar.YEAR)));  
		jd1.setData(data1);
		
		//第二年
		map.put("year", now.get(Calendar.YEAR)-1);
		List<From> list1=fromBiz.findFrombaobiao(map);
		System.out.println(list1);
		if(list1!=null && list1.size()>0){
			for(int i=0;i<list1.size();i++){
				data2[Integer.parseInt(list1.get(i).getMonth())-1]=list1.get(i).getCountprice();
			}
		}else{
			data2=data2;
		}
		JsonData jd2 = new JsonData();  
		jd2.setName(String.valueOf(now.get(Calendar.YEAR)-1));  
		jd2.setData(data2);
		
		//第三年
		map.put("year", now.get(Calendar.YEAR)-2);
		List<From> list2=fromBiz.findFrombaobiao(map);
		if(list2!=null && list2.size()>0){
			for(int i=0;i<list2.size();i++){
				data3[Integer.parseInt(list2.get(i).getMonth())-1]=list2.get(i).getCountprice();
			}
		}else{
			data3=data3;
		}
		JsonData jd3 = new JsonData();  
		jd3.setName(String.valueOf(now.get(Calendar.YEAR)-2));  
		jd3.setData(data3);
		
		List<JsonData> data = new ArrayList<JsonData>();  
		data.add(jd1);  
		data.add(jd2);  
		data.add(jd3);  
		String[] xcontent = {"1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"};  

		TestlineData tld = new TestlineData();  
		tld.setXcontent(xcontent);  
		tld.setData(data);  
		return tld;
		
	}


	//查询省公司所有的报表 
	/*@RequestMapping(value="ceshi.action")
	@ResponseBody
	public Object ceshi(String prname,String spname,HttpServletRequest request){
		Integer[] data1 = {120, 132, 101, 134, 90, 500, 210,12,15,10,11,12};  
		Integer[] data2 = {20, 232, 11, 144, 90, 30, 90,12,15,10,11,12};  
		Integer[] data3 = {180, 12, 161, 84, 60, 230, 10,12,15,10,11,12};
		JsonData jd1 = new JsonData();  
		jd1.setName("测试数据1");  
		jd1.setData(data1);  

		JsonData jd2 = new JsonData();  
		jd2.setName("测试数据2");  
		jd2.setData(data2);  

		JsonData jd3 = new JsonData();  
		jd3.setName("测试数据3");  
		jd3.setData(data3);  

		List<JsonData> data = new ArrayList<JsonData>();  
		data.add(jd1);  
		data.add(jd2);  
		data.add(jd3);  
		String[] xcontent = {"1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"};  

		TestlineData tld = new TestlineData();  
		tld.setXcontent(xcontent);  
		tld.setData(data);  
		return tld;
	}*/
}
