package com.kingnod.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kingnod.service.aop.TestService;
import com.kingnod.util.Users;

@RequestMapping("/api/v1/test")
@RestController
public class TestRestController {
	@Autowired
	private TestService testService;
	@RequestMapping("test/aop/exception") 
	public String testAop(){
		 
		 return testService.testAop(Users.userId(), Users.shiroUser().loginName);
	 }
}
