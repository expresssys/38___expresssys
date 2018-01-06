package com.yc.controller;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yc.bean.Car;
import com.yc.bean.JsonModel;
import com.yc.biz.CarBiz;
import com.yc.dao.CarDao;

@Controller
@Scope(value="prototype")
@RequestMapping(value="Admin/car/")
public class CarController implements Serializable {

	private static final long serialVersionUID = 4655156440508905990L;
	@Resource(name="carBizImpl")
	private CarBiz carBiz;
	
	public void setCarBiz(CarBiz carBiz) {
		this.carBiz = carBiz;
	}
	
	@Resource(name="carDaoImpl")
	private CarDao carDao;
	
	
	
	public void setCarDao(CarDao carDao) {
		this.carDao = carDao;
	}


	@RequestMapping(value="addcar.action",method=RequestMethod.POST)
	public @ResponseBody JsonModel addCar(Car car,HttpServletRequest request,String sbuydays){
		System.out.println("添加car操作");
		String cbuyday=request.getParameter("cbuydays");
		car.setRes1("0");     //默认为0   删除改为1
		
		JsonModel jm=new JsonModel();
		try {
			SimpleDateFormat sfm=new SimpleDateFormat("yyyy-MM-dd");
			
			car.setCbuyday(sfm.parse(cbuyday));
			carBiz.addCar(car);
			jm.setCode(1);
			jm.setObj(car);
			
		} catch (Exception e) {
			jm.setMsg(e.getMessage());
			jm.setCode(0);     //失败
			e.printStackTrace();
		}
		

		return jm;
	}
	
	
	@RequestMapping(value="findAllCar.action")
	
	public @ResponseBody JsonModel findAllcar( Car car,HttpServletRequest request){
		//System.out.println("查询所有car操作");
		JsonModel jm=new JsonModel();
		try {
			int pagesize=Integer.valueOf(request.getParameter("rows"));
			int pages=Integer.valueOf(request.getParameter("page"));
			
			car.setPagesize(pagesize);
			int start=(pages-1)*pagesize;
			car.setStart(start);
			car.setRes1(null);
			List<Car> list=carBiz.findAllCar(car);
			
			/*SimpleDateFormat sfm=new SimpleDateFormat("yyyy-MM-dd");
			for(int i=0;i<list.size();i++){
				String cbuyday=String.valueOf(list.get(i).getCbuyday());
				System.out.println(cbuyday+"这是购买日期");
				SimpleDateFormat sdf1= new SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy", Locale.ENGLISH);

				SimpleDateFormat sdf2= new SimpleDateFormat("yyyy-MM-dd");
				list.get(i).setCbuyday(sdf2.parse(sdf2.format(sdf1.parse(cbuyday))));
				System.out.println("转换date"+sdf2.format(sdf1.parse(cbuyday))); 
				
			}*/
			
			
			
			
			int total=carDao.total(car);
			jm.setCode(1);
			jm.setRows(list);
            jm.setTotal(total);			
			
			
		} catch (Exception e) {
			jm.setCode(0);
			jm.setMsg(e.getMessage());
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(jm.getRows()+"这是jm");
		return jm;
	}
	
	
	
	
	@RequestMapping(value="findByInfo.action")
	public @ResponseBody JsonModel findByInfo(Car car,HttpServletRequest request){
		//System.out.println("条件查询");
		JsonModel jm=new JsonModel();
		
		try {
			int pagesize=Integer.valueOf(request.getParameter("rows"));
			int pages=Integer.valueOf(request.getParameter("page"));
			car.setPagesize(pagesize);
			int start=(pages-1)*pagesize;
			car.setStart(start);
			car.setRes1(null);
			System.out.println(car);
			List<Car> list=carBiz.findCarByInfo(car);
			jm.setRows(list);
			int total=carDao.total(car);
			jm.setCode(1);
			
            jm.setTotal(total);			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return jm;
		
	}
	
	
	@RequestMapping(value="delCar.action")
	public @ResponseBody JsonModel delCar(Car car){
		JsonModel jm=new JsonModel();
		try {
			carBiz.delCar(car);
			jm.setCode(1);
			
		} catch (Exception e) {
			jm.setMsg(e.getMessage());
			jm.setCode(0);
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return jm;
		
	}
	
	
	@RequestMapping(value="updateCar.action")
	public @ResponseBody JsonModel updateCar(Car car,HttpServletRequest request,String cbuydays){
		JsonModel jm=new JsonModel();
		String cbuyday=request.getParameter("cbuydays");
		System.out.println("修改操作");
		try {
    SimpleDateFormat sfm=new SimpleDateFormat("yyyy-MM-dd");
			
			car.setCbuyday(sfm.parse(cbuyday));
			carBiz.updateCar(car);
			jm.setCode(1);
			jm.setObj(car);
			
			
			
		} catch (Exception e) {
			jm.setCode(0);
			jm.setMsg(e.getMessage());
			
		}
		return jm;
	}
	
	
	
	
	

}
