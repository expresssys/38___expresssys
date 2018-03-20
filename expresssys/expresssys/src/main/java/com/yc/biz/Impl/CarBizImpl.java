package com.yc.biz.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yc.bean.Car;
import com.yc.biz.CarBiz;
import com.yc.dao.CarDao;

@Service
@Transactional
public class CarBizImpl implements CarBiz {
	@Resource(name="carDaoImpl")
	private CarDao carDao;
	

	public void setCarDao(CarDao carDao) {
		this.carDao = carDao;
	}

	@Override
	public void addCar(Car car) throws Exception {
		this.carDao.addCar(car);

	}

	@Override
	public void updateCar(Car car) throws Exception  {
		this.carDao.updateCar(car);

	}

	@Override
	public List<Car> findAllCar( Car car) throws Exception {
	return carDao.findAllCar(car);
	}

	@Override
	public void delCar(Car car) throws Exception {
		this.carDao.delCar(car);

	}

	@Override
	public Car findShipPoint(Car car) throws Exception {
		return carDao.findShipPoint(car);
	}

	@Override
	public List<Car> findCarByInfo(Car car) throws Exception {
		return carDao.findCarByInfo(car);
	}

}
