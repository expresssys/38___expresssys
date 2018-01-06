package com.yc.dao.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.yc.bean.Car;
import com.yc.bean.Shippoint;
import com.yc.dao.CarDao;

@Repository
public class CarDaoImpl implements CarDao {
	
	@Resource(name="sqlSession")
	private SqlSessionTemplate sqlSession;
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	
	//添加car
	@Override
	public void addCar(Car car) throws Exception {
		this.sqlSession.insert("com.yc.bean.Car.insert", car);
	}

	
	
	//更新car
	@Override
	public void updateCar(Car car) throws Exception {
		this.sqlSession.update("com.yc.bean.Car.updateByPrimaryKeySelective",car);

	}

	
	//查询所有car
	@Override
	public List<Car> findAllCar(Car car) throws Exception {
		return sqlSession.selectList("com.yc.bean.Car.selectByParam",car);
	}

	
	//删除car
	@Override
	public void delCar(Car car) throws Exception {
		this.sqlSession.delete("com.yc.bean.Car.deleteByPrimaryKey",car);

	}


	@Override
	public Car findShipPoint(Car car) throws Exception {
		return  sqlSession.selectOne("com.yc.bean.Car.selectBySpid",car);
	}


	@Override
	public List<Car> findCarByInfo(Car car) {
		return  sqlSession.selectList("com.yc.bean.Car.selectByParam",car);
	}


	@Override
	public int total(Car car) {
		return sqlSession.selectOne("com.yc.bean.Car.selectTotal",car);
		
	}

}
