package com.yc.controller;

import java.io.BufferedOutputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yc.Util.ExportExcel;
import com.yc.bean.Excel;
import com.yc.bean.Handover;
import com.yc.biz.HandoverBiz;

@Controller
@Scope(value="prototype")
@RequestMapping(value="Admin/")
public class HandoverController {
	@Resource(name="handoverBizImpl")
	private HandoverBiz handoverBiz;

	//查询线路
	@RequestMapping(value="selectddByid.action")
	@ResponseBody
	public Map<String,Object> selectddByid(Integer osid,String nowd,HttpServletRequest request){
		Map<String,Object> map=new HashMap<String,Object>();
		Handover handover=new Handover();
		List<Handover> list=handoverBiz.selectddByid(osid);
		List<Handover> list2=handoverBiz.selectxianluByid(list.get(0).getRid());
		String xl=list2.get(0).getRes4();
		String[] str=xl.split("-");
		if(xl.contains(nowd)){
			for(int i=0;i<str.length;i++){
				if(str[i].equals(nowd)){
					if(i==str.length-1){
						map.put("code", 0);
						return map;
					}else{
						handover.setNextd(str[i+1]);
					}
				}
			} 
		}else{
			map.put("code", 2);
			return map;
		}

		List<Handover> list3=new ArrayList<Handover>();
		list3.add(handover);
		map.put("code", 1);
		map.put("obj", list3);
		return map;
	}

	//查询所有配送点
	@RequestMapping(value="selectpoints.action")
	@ResponseBody
	public List<Handover> selectpoint(HttpServletRequest request){
		List<Handover> list=handoverBiz.selectpoint();
		return list;
	}

	//查询空闲的司机
	@RequestMapping(value="selectDriver.action")
	@ResponseBody
	public List<Handover> selectDriver(HttpServletRequest request){
		List<Handover> list=handoverBiz.selectDriver();
		return list;
	}

	//添加交接单
	@RequestMapping(value="insertHandover.action")
	@ResponseBody
	public Map<String,Object> insertHandover(Integer osid,String htoSpname,String hfromSpname,String hstartTime,String hendTime,Integer hstatus,
			Integer cid,Integer did,String hremark){
		Handover handover=new Handover();
		handover.setOsid(osid);
		handover.setHtoSpname(htoSpname);
		handover.setHfromSpname(hfromSpname);
		handover.setHstartTime(hstartTime);
		handover.setHendTime(hendTime);
		handover.setHstatus(hstatus);
		handover.setCid(cid);
		handover.setDid(did);
		handover.setHremark(hremark);
		Map<String,Object> map=new HashMap<String,Object>();
		List<Handover> list=handoverBiz.selectCopy(handover);
		if(list.size()>0 && list!=null){
			map.put("code", 0);	//有重复的交接单
		}else{
			List<Handover> list1=handoverBiz.selectddByid(handover.getOsid());
			handover.setRid(list1.get(0).getRid());
			int result=handoverBiz.insertHandover(handover);
			if(result>0){
				map.put("code", 1);
			}else{
				map.put("code", 2);
			}
		}
		return map;
	}

	//查询车辆的类型
	@RequestMapping(value="selectcartype.action")
	@ResponseBody
	public List<Handover> selectcartype(HttpServletRequest request){
		List<Handover> list=handoverBiz.selectcartype();
		return list;
	}

	//查询车辆
	@RequestMapping(value="selectcar.action")
	@ResponseBody
	public List<Handover> selectcar(String ctype,HttpServletRequest request){
		Handover handover=new Handover();
		handover.setCtype(ctype);
		List<Handover> list=handoverBiz.selectcar(handover);
		return list;
	}

	//根据收寄地查询
	@RequestMapping(value="selectfromaddr.action")
	@ResponseBody
	public Map<String,Object> selectfromaddr(String hfromSpname,Integer osid,HttpServletRequest request){
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("hfromSpname", hfromSpname);
		map.put("osid", osid);
		List<Handover> list=handoverBiz.selectfromaddr(map);
		map=new HashMap<String,Object>();
		if(list.size()>0 && list!=null){
			map.put("code", 1);
			map.put("obj", list);
		}else{
			map.put("code", 0);
		}
		return map;
	}
	
	//根据地查询
	@RequestMapping(value="selecttoaddr.action")
	@ResponseBody
	public Map<String,Object> selecttoaddr(String htoSpname,Integer osid,HttpServletRequest request){
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("htoSpname", htoSpname);
		map.put("osid", osid);
		List<Handover> list=handoverBiz.selecttoaddr(map);
		map=new HashMap<String,Object>();
		if(list.size()>0 && list!=null){
			map.put("code", 1);
			map.put("obj", list);
		}else{
			map.put("code", 0);
		}
		return map;
	}
	
	//导出excel表格
	@RequestMapping(value = "/exportHandover.action", method = RequestMethod.GET, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public void selectAllstudent(Integer osid,String hfromSpname,String htoSpname,
			String orecName,String hstartTime,String hendTime,String cnumber,String dname,
			HttpServletResponse response) throws UnsupportedEncodingException {
		List<Excel> list=new ArrayList<>();
		String filename= new String(("订单号:"+osid+",收寄地:"+hfromSpname+",交接地:"+htoSpname+".xls").getBytes(),"iso-8859-1");	//中文文件名必须使用此句话
		response.setContentType("application/octet-stream");
        response.setContentType("application/OCTET-STREAM;charset=UTF-8");
        response.setHeader("Content-Disposition", "attachment;filename="+filename );
        String[] headers = { "订单编号","收件人", "收寄地", "交接地", "运输时间","到达时间", "车牌号","司机" };  //表格的标题栏
        Excel excel=new Excel(osid,hfromSpname,htoSpname,orecName,hstartTime,hendTime,cnumber,dname);
        list.add(excel);
        try {
        	ExportExcel<Excel> ex=new ExportExcel<Excel>();
        	System.out.println("1111");
			OutputStream  out = new BufferedOutputStream(response.getOutputStream());
			ex.exportExcel("交接单",headers, list, out);
			System.out.println("2222");
			out.flush();
			out.close();
		} catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
	}
	
}
