package com.yc.web.Listener;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.yc.bean.Const;
import com.yc.bean.ConstType;
import com.yc.biz.ConstBiz;
import com.yc.biz.ConstTypeBiz;

public class InitListener implements ServletContextListener{

	public InitListener() {

	}

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		ServletContext application = sce.getServletContext();

		// 得到Spring容器的实例
		ApplicationContext ac = WebApplicationContextUtils.getRequiredWebApplicationContext(application);
		
		ConstTypeBiz ctb  = (ConstTypeBiz) ac.getBean("constTypeBizImpl");
		ConstBiz cb  = (ConstBiz) ac.getBean("constBizImpl");
		try {
			
			Map<String,List<Const>> allConst = new HashMap<String,List<Const>>();
			List<ConstType> cts = ctb.findConstTypeByInfo(null);
			
			ConstType ct = null;
			Const c = new Const();
			for(int i=0;i<cts.size();i++){
				ct = cts.get(i);
				c.setCtid(ct.getCtid());
				List<Const> consts = cb.findConstByInfo(c);
				allConst.put(ct.getCtname(), consts);
			}
			
			application.setAttribute("ALLCONST", allConst);
			System.out.println(allConst);
			
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		

		try {
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		
	}



}
