package com.kingnod.task;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.quartz.QuartzJobBean;

public class QuartzExtendsTest extends QuartzJobBean{
	private Logger logger = LoggerFactory.getLogger(QuartzExtendsTest.class);
	@Autowired
	private TaskService taskService;
	@Override
	protected void executeInternal(JobExecutionContext arg0)
			throws JobExecutionException {
		double a = Math.random()*10000;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		for(long i=0;i<1L;i++){
			//System.out.println(a+"----"+i);
		}
		//logger.info(sdf.format(new Date())+"----开始日志记录------继承QuartzJobBean");
		//taskService.getJob(jobName, jobGroup)
	}

}
