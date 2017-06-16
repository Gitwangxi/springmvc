package com.kingnod.task;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class QuartzTest{
	private Logger logger = LoggerFactory.getLogger(QuartzTest.class);
	public void printLog(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		System.out.println(sdf.format(new Date())+"----开始日志记录------方法映射");
		logger.info(sdf.format(new Date())+"----开始日志记录------方法映射");
	}

}
