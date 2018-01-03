package test;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yc.bean.Route;
import com.yc.biz.RouteBiz;



//以后由spring来管理所有的bean
@RunWith(SpringJUnit4ClassRunner.class)  
@ContextConfiguration("classpath*:applicationContext.xml")   // classpath表示从类的根路径读,不配则从当前TestDao2所在的包读
public class TestDao2  {
	
	
	@Autowired
    ApplicationContext ac;
	@Resource(name="routeBizImpl")
	private RouteBiz rb;

	@Test
	public void testOpRecord2() {
		Route r=new Route();
		r.setRid(1);
		r.setRname("路线2");
		r.setRes2("hhh");
		//rb.add(r);
		System.out.println(rb.findById(r, 0, 5));
		//rb.update(r);
	}
	
	

}
