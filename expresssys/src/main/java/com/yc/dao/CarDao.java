package com.yc.dao;

import java.util.List;

import com.yc.bean.Car;
import com.yc.bean.Shippoint;

public interface CarDao {
	
	
	
	
	//添加car
	public void  addCar(Car car) throws Exception;
	
	//更新car
	public void updateCar(Car car) throws Exception;
	
	//查找所有car
	public List<Car> findAllCar(Car car) throws Exception;
	
	
	//删除car
	public void delCar(Car car) throws Exception;
	
	
	//通过spid查出shipPoint
	public Car findShipPoint(Car car) throws Exception;
	
	
	//通过条件查询car
	public List<Car> findCarByInfo(Car car)  throws Exception;
	
	//查询结果条数
	public int total(Car car);

}
