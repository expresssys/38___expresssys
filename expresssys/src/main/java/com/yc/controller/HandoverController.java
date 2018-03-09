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

import com.yc.Util.ComMethod;
import com.yc.Util.ExportExcel;
import com.yc.bean.Excel;
import com.yc.bean.Handover;
import com.yc.bean.JsonModel;
import com.yc.bean.Orders;
import com.yc.biz.GoodsBiz;
import com.yc.biz.HandoverBiz;
import com.yc.biz.OrdersBiz;

@Controller
@Scope(value="prototype")
@RequestMapping(value="Admin/handover")
public class HandoverController {
	@Resource(name="handoverBizImpl")
	private HandoverBiz handoverBiz;
	
	@Resource(name="ordersBizImpl")
	private OrdersBiz ordersBiz;
	
	@Resource(name="goodsBizImpl")
	private GoodsBiz goodsBiz;

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
	public Map<String,Object> insertHandover(Handover handover){
		Map<String,Object> map=new HashMap<String,Object>();
		List<Handover> list=handoverBiz.selectCopy(handover);
		
		Handover h = new Handover();
		h.setOsid(handover.getOsid());
		
		//查找当前交接单关联的订单的已存在交接单
		List<Handover> handovers = this.handoverBiz.findBy(h);
		
		Orders orders = new Orders();
		orders.setOsid(handover.getOsid());
		
		if(list!=null && list.size()>0 ){
			map.put("code", 0);	//有重复的交接单
		}else{
			List<Handover> list1=handoverBiz.selectddByid(handover.getOsid());
			handover.setRid(list1.get(0).getRid());
			int result=handoverBiz.insertHandover(handover);
			if(result>0){
				//修改订单状态
				if(handovers!=null && handovers.size()>0){
					orders.setOstatus(3);
					ordersBiz.updateStatus(orders);
				}else{
					if(handover.getHstatus()!=0){
						orders.setOstatus(2);
						ordersBiz.updateStatus(orders);
					}else{
						orders.setOstatus(1);
						ordersBiz.updateStatus(orders);
					}
				}
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
			OutputStream  out = new BufferedOutputStream(response.getOutputStream());
			ex.exportExcel("交接单",headers, list, out);
			out.flush();
			out.close();
		} catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
	}
	
	@RequestMapping(value="findBy.action")
	public @ResponseBody JsonModel findBy(Handover h,Orders r,HttpServletRequest request){
		JsonModel jm = new JsonModel();
		Map<String,String> consts = ComMethod.getConst(request, "goodsStatus");
		r.setOsid(h.getOsid());
		
		List<Handover> handovers = this.handoverBiz.findBy(h);
		List<Orders> orders = (List<Orders>) this.ordersBiz.findById(r,0,1).get("rows");
		
		jm.setCode(orders.get(0).getOstatus());
		jm.setMsg(consts.get(orders.get(0).getOstatus().toString()));
		jm.setObj(handovers);
		
		return jm;
	}
	
	@RequestMapping(value="updateHandover.action")
	@ResponseBody
	public Map<String,Object> updateHandover(Handover handover){
		Map<String,Object> map=new HashMap<String,Object>();
		int result=handoverBiz.update(handover);
		if(result>0){
			map.put("code", 1);
		}else{
			map.put("code", 2);
		}
		return map;
	} 
	
}
