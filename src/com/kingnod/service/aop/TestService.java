package com.kingnod.service.aop;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(readOnly=true)
public class TestService {
	
	public String testAop(Long id,String loginName){
		return id+loginName;
	}
}
