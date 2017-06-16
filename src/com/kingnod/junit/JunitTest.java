package com.kingnod.junit;
import javax.annotation.Resource;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.web.context.WebApplicationContext;

import com.google.gson.Gson;
import com.kingnod.dao.ChatDao;

public class JunitTest  extends BaseJunitTest{
	
	@Autowired
	private ChatDao chatDao;
	
	
	
	 @Test  
     public void test0(){  
         System.out.println("第一个测试方法*******"+chatDao);  
         System.out.println("调用dao层--进行统计："+ (new Gson()).toJson(chatDao.findOne(1L)));
     }  
       
     @Test  
     public void test1(){  
         System.out.println("第二个测试方法*******");  
     }  
       
     @Test  
     public void test2(){  
         System.out.println("第三个测试方法*******");  
     }  
}
