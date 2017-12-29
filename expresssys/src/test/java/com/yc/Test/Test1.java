
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

import com.yc.Util.MD5Encryption;
import com.yc.bean.Users;
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
		users.setUname("1");
		users.setUpwd(MD5Encryption.createPassword("1"));
		System.out.println(ub.addUsers(users));
	}
	
	//update
	@Test
	public void test3(){
		Users users = new Users();
		users.setUname("1");
		users.setUpwd("1");
		users.setUsid(4);
		System.out.println(ub.updateUsers(users));
	}
	
}
