package com.yc.springaop1;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yc.bean.Driver;
import com.yc.bean.Shippoint;
import com.yc.biz.DriverBiz;
import com.yc.biz.ShippointBiz;




//junit启动时，就会自动地: ApplicationContext ac=new
//ClassPathXmlApplicationContext("classpath:beans.xml");
//创建容器自动经了.
@RunWith(SpringJUnit4ClassRunner.class) // 值: SpringJUnit4ClassRunner 表示使用spring
										// junit测试 -> 区别：自动地完成 ioc,di
										// JUnit 表示使用原生的 junit测试
@ContextConfiguration({"classpath:applicationContext.xml"}) // 告诉容器, spring配置文件位置
public class AppTest {
	@Resource(name="dataSource")
	private DriverManagerDataSource dataSource;
	@Resource(name="sqlSessionFactory")
	private SqlSessionFactory sqlSessionFactory;
	@Resource(name="sqlSession")
	private SqlSessionTemplate sqlSession;
	@Resource(name="shippointBizImpl")
	private ShippointBiz cb;
	
	@Resource(name="driverBizImpl")
	private DriverBiz driverBiz;
	@Test
	public void testshippoint() throws Exception {
		Shippoint s=new Shippoint();
		s.setSpid(7);
		
		System.out.println(this.cb.findAll(0, 5));
		System.out.println(this.cb.findById(s, 0, 5));
	}
	
	@Test
	public void testdriver() throws Exception {
		Driver s=new Driver();
		s.setDid(1);
		
		System.out.println(this.driverBiz.findAll(0, 5));
		System.out.println(this.driverBiz.findById(s, 0, 5));
	}
	
}