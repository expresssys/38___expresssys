
package com.yc.Test;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yc.bean.Car;
import com.yc.bean.Goods;
import com.yc.bean.Logininfo;
import com.yc.bean.Users;
import com.yc.biz.CarBiz;
import com.yc.biz.GoodsBiz;
import com.yc.biz.LoginInfoBiz;
import com.yc.biz.UsersBiz;

@RunWith(SpringJUnit4ClassRunner.class) 
@ContextConfiguration("classpath:applicationContext.xml") // 告诉容器, spring配置文件位置
public class Test1 {
	@Resource(name="dataSource")
	private DriverManagerDataSource dataSource;
	@Resource(name="sqlSessionFactory")
	private SqlSessionFactory sqlSessionFactory;
	@Resource(name="sqlSession")
	private SqlSessionTemplate sqlSession;

	@Resource(name="usersBizImpl")
	private UsersBiz ub;

	@Resource(name="goodsBizImpl")
	private GoodsBiz gb;
	
	@Resource(name="carBizImpl")
	private CarBiz cb;

	@Resource(name="logininfoBizImpl")
	private LoginInfoBiz lb;
	
	//查询
	@Test
	public void test1(){
		Map map = new HashMap();

		map.put("start", 0);
		map.put("pagesize", 5);

		Users users = new Users();
		users.setUname("1");
		map.put("users", users);

		System.out.println(ub.findBy(map));

	}

	//add
	@Test
	public void test2(){
		Users users = new Users();
		users.setUname("a");
		users.setUpwd("a");
		users.setUstatus(1);
		users.setRes1("1");
		ub.addUsers(users);
		System.out.println(ub.adminlogin(users));
	}

	//update
	@Test
	public void test3(){
		Users users = new Users();
//		users.setUname("1");
//		users.setUpwd("1");
		users.setUsid(3);
		users.setUstatus(1);
		System.out.println(ub.updateUsers(users));
	}

	@Test
	public void test4(){
		Goods goods = new Goods();
		goods.setGname("123");
		goods.setGtype("日用品");

		System.out.println(gb.addGoods(goods));
	}

	@Test
	public void test5(){
		Goods goods = new Goods();
		goods.setGid(1);
		goods.setGname("1");
		System.out.println(gb.updateGoods(goods));

	}

	@Test
	public void test6(){
		Goods goods = new Goods();
		goods.setGid(2);
		Map map = new HashMap();

		map.put("start", 0);
		map.put("pagesize", 5);
		
		map.put("goods", goods);
		
		System.out.println(gb.findBy(map));
	}
	
	@Test
	public void test7(){
		Car car = new Car();
		car.setCnumber("55");
		
		try {
			System.out.println(cb.findCarByInfo(car));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testlogininfo(){
		Logininfo l = new Logininfo();
		l.setLname("yc");
		
		
		
		
		System.out.println(lb.findLoginInfo(l, 0, 5));
	}
}
