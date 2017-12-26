
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
	
	
	@Test
	public void test1(){
		Map map = new HashMap();
		
		map.put("page", 1);
		map.put("pagesize", 10);
		
		Users users = new Users();	
		
		System.out.println(ub.findBy(map));
		
		
	}
	
}
