package com.kingnod.task;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.quartz.CronScheduleBuilder;
import org.quartz.CronTrigger;
import org.quartz.Job;
import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.JobExecutionContext;
import org.quartz.JobKey;
import org.quartz.ScheduleBuilder;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.quartz.TriggerKey;
import org.quartz.impl.matchers.GroupMatcher;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.quartz.SchedulerFactoryBean;
import org.springframework.stereotype.Service;



@Service(value="quattzTaskService")
public class TaskService {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());      
    
    @Autowired       
    private SchedulerFactoryBean schedulerFactoryBean;        
   
    /**     
     * 添加任务     
     *      
     * @param scheduleJob     
     * @throws SchedulerException     
     */      
    public boolean addJob(QuartzJobBean job) throws SchedulerException {
    	String str = job.getJobClass().replaceAll("\\.","_");
    	String jobName = str+QuartzJobBean.JOB_NAME_POSTFIX;
    	String jobGroup = str+QuartzJobBean.JOB_GROUP_POSTFIX;
    	String triggerName = str+QuartzJobBean.TRIGGER_NAME_POSTFIX;
    	String triggerGroup = str+QuartzJobBean.TRIGGER_GROUP_POSTFIX;
    	job.setJobName(jobName);
    	job.setJobGroup(jobGroup);
        if (job == null || !QuartzJobBean.STATUS_NOT_RUNNING.equals(job.getJobStatus())) {      
            return false;      
        }      
        if(!TaskUtils.isValidExpression(job.getCronExpression())){      
            logger.error("时间表达式错误（"+jobName+","+jobGroup+"）,"+job.getCronExpression());      
            return false;      
        }else{      
            Scheduler scheduler = schedulerFactoryBean.getScheduler();   
            // 任务名称和任务组设置规则：            
            TriggerKey triggerKey = TriggerKey.triggerKey(triggerName, triggerGroup);      
            Trigger trigger = scheduler.getTrigger(triggerKey);          
            // 不存在，创建一个         
            if (null == trigger) {      
            	Class<? extends Job> clazz = null;
                try {
                	clazz =	(Class<? extends Job>) Class.forName(job.getJobClass());
				} catch (ClassNotFoundException e) {
					
				}
                JobDetail jobDetail = JobBuilder.newJob(clazz).withIdentity(job.getJobName(),job.getJobGroup()).withDescription(job.getDescription()).build();
                jobDetail.getJobDataMap().put("scheduleJob", job);       
                // 表达式调度构建器           
                CronScheduleBuilder scheduleBuilder = CronScheduleBuilder.cronSchedule(job.getCronExpression());      
                // 按新的表达式构建一个新的trigger      
                TriggerBuilder triggerBuilder =  TriggerBuilder.newTrigger();
                trigger = triggerBuilder.withIdentity(triggerKey).withSchedule(scheduleBuilder).build();  
                scheduler.scheduleJob(jobDetail, trigger);         
            } else {     // trigger已存在，则更新相应的定时设置           
        		CronTrigger newTrigger = (CronTrigger) scheduler.getTrigger(triggerKey);
        		//表达式调度构建器
        		CronScheduleBuilder scheduleBuilder = CronScheduleBuilder.cronSchedule(job.getCronExpression());
        		//按新的cronExpression表达式重新构建trigger
        		newTrigger = newTrigger.getTriggerBuilder().withIdentity(triggerKey).withSchedule(scheduleBuilder).build();
        		//按新的trigger重新设置job执行
        		scheduler.rescheduleJob(triggerKey, newTrigger);
            } 
        }
        return true;      
    }
        
    /**
     * 计划中的任务列表
     * 指那些已经添加到quartz调度器的任务，因为quartz并没有直接提供这样的查询接口，
     * 所以我们需要结合JobKey和Trigger来实现
     * @return
     * @throws Exception
     */
    public List<QuartzJobBean> jobList() throws Exception{
    	Scheduler scheduler = schedulerFactoryBean.getScheduler();
    	GroupMatcher<JobKey> matcher = GroupMatcher.anyJobGroup();
    	Set<JobKey> jobKeys = scheduler.getJobKeys(matcher);
    	List<QuartzJobBean> jobList = new ArrayList<QuartzJobBean>();
    	for (JobKey jobKey : jobKeys) {
    		JobDetail jobDetail = scheduler.getJobDetail(jobKey);
    	    List<? extends Trigger> triggers = scheduler.getTriggersOfJob(jobKey);
    	    for (Trigger trigger : triggers) {
    	    	QuartzJobBean job = new QuartzJobBean();
    	        job.setJobName(jobKey.getName());
    	        job.setJobGroup(jobKey.getGroup());
    	        job.setDescription(jobDetail.getDescription());//任务描述
    	        job.setNextTime(trigger.getNextFireTime()); //下次触发时间      
                job.setPreviousTime(trigger.getPreviousFireTime());//上次触发时间  
                job.setStartTime(trigger.getStartTime());//开始执行时间
                job.setJobClass((jobDetail.getJobClass()).getName());//执行任务的类
    	        Trigger.TriggerState triggerState = scheduler.getTriggerState(trigger.getKey());
    	        job.setJobStatus(triggerState.name());
    	        if (trigger instanceof CronTrigger) {
    	            CronTrigger cronTrigger = (CronTrigger) trigger;
    	            String cronExpression = cronTrigger.getCronExpression();//任务表达式
    	            job.setCronExpression(cronExpression);
    	        }
    	        jobList.add(job);
    	    }
    	}
    	return jobList;
    }
    /**
     * 运行中的任务
     * @return
     * @throws Exception
     */
    public List<QuartzJobBean> jobRunningList() throws Exception{
    	Scheduler scheduler = schedulerFactoryBean.getScheduler();
    	List<JobExecutionContext> executingJobs = scheduler.getCurrentlyExecutingJobs();
    	List<QuartzJobBean> jobList = new ArrayList<QuartzJobBean>(executingJobs.size());
    	for (JobExecutionContext executingJob : executingJobs) {
    		QuartzJobBean job = new QuartzJobBean();
    	    JobDetail jobDetail = executingJob.getJobDetail();
    	    JobKey jobKey = jobDetail.getKey();
    	    Trigger trigger = executingJob.getTrigger();
    	    job.setJobName(jobKey.getName());
    	    job.setJobGroup(jobKey.getGroup());
    	    job.setDescription(jobDetail.getDescription());//任务描述
    	    job.setNextTime(trigger.getNextFireTime()); //下次触发时间      
            job.setPreviousTime(trigger.getPreviousFireTime());//上次触发时间  
            job.setStartTime(trigger.getStartTime());//开始执行时间
            job.setJobClass((jobDetail.getJobClass()).getName());//执行任务的类
    	    Trigger.TriggerState triggerState = scheduler.getTriggerState(trigger.getKey());
    	    job.setJobStatus(triggerState.name());
    	    if (trigger instanceof CronTrigger) {
    	        CronTrigger cronTrigger = (CronTrigger) trigger;
    	        String cronExpression = cronTrigger.getCronExpression();
    	        job.setCronExpression(cronExpression);
    	    }
    	    jobList.add(job);
    	}
    	return jobList;
    }
    /**
     * 获取任务详情
     * @param triggerName 触发器名称
	 * @param triggerGroup 触发器组名
     */
    public QuartzJobBean jobDetail(String triggerName,String triggerGroup){
    	QuartzJobBean job = null;
    	try {
    		Scheduler scheduler = schedulerFactoryBean.getScheduler();
        	TriggerKey triggerKey = TriggerKey.triggerKey(triggerName,triggerGroup);
    	    Trigger trigger = scheduler.getTrigger(triggerKey);
    	    JobKey jobKey = trigger.getJobKey();
        	JobDetail jobDetail = scheduler.getJobDetail(jobKey);
    	    job = new QuartzJobBean();
    	    job.setJobName(jobKey.getName());
    	    job.setJobGroup(jobKey.getGroup());
    	    job.setDescription(jobDetail.getDescription());
    	    job.setNextTime(trigger.getNextFireTime()); //下次触发时间      
            job.setPreviousTime(trigger.getPreviousFireTime());//上次触发时间  
            job.setStartTime(trigger.getStartTime());//开始执行时间
            job.setJobClass((jobDetail.getJobClass()).getName());//执行任务的类
    	    Trigger.TriggerState triggerState = scheduler.getTriggerState(trigger.getKey());
    	    job.setJobStatus(triggerState.name());
    	    if (trigger instanceof CronTrigger) {
    	        CronTrigger cronTrigger = (CronTrigger) trigger;
    	        String cronExpression = cronTrigger.getCronExpression();
    	        job.setCronExpression(cronExpression);
    	    }
		} catch (Exception e) {
			logger.info("获取任务详情未获取到数据!");
		}
    	return job;
    }
    
    /**
     * 暂停定时任务
     * @param jobName 任务名称
     * @param jobGroup 任务组名
     * @return true:暂停任务成功，false：暂停任务失败
     */
    public boolean stopJob(String jobName,String jobGroup){
    	boolean b = true;
    	try {
    		Scheduler scheduler = schedulerFactoryBean.getScheduler();
        	JobKey jobKey = JobKey.jobKey(jobName,jobGroup);
        	scheduler.pauseJob(jobKey);
		} catch (Exception e) {
			b= false;
			logger.error("暂停定时任务失败!");
		}
    	return b;
    	
    }
    /**
     * 恢复定时任务
     * @param jobName 任务名称
     * @param jobGroup 任务组名
     * @return true:恢复任务成功，false：恢复任务失败
     */
    public boolean reStartJob(String jobName,String jobGroup){
    	boolean b = true;
    	try {
    		Scheduler scheduler = schedulerFactoryBean.getScheduler();
    		JobKey jobKey = JobKey.jobKey(jobName, jobGroup);
    		scheduler.resumeJob(jobKey);
		} catch (Exception e) {
			b= false;
			logger.error("恢复定时任务失败!");
		}
    	return b;
    }
    /**
     * 删除定时任务
     * 删除任务后，所对应的trigger也将被删除
     * @param jobName 任务名称
     * @param jobGroup 任务组名
     * @return true:删除任务成功，false：删除任务失败
     */
    public boolean deleteJob(String jobName,String jobGroup){
    	boolean b = true;
    	try {
    		Scheduler scheduler = schedulerFactoryBean.getScheduler();
    		JobKey jobKey = JobKey.jobKey(jobName, jobGroup);
    		scheduler.deleteJob(jobKey);
		} catch (Exception e) {
			b= false;
			logger.error("删除定时任务失败!");
		}
    	return b;
    }
    /**
     * 立刻运行定时器
     * 这里的立即运行，只会运行一次，方便测试时用。
     * quartz是通过临时生成一个trigger的方式来实现的，这个trigger将在本次任务运行完成之后自动删除。
     * trigger的key是随机生成的，例如：DEFAULT.MT_4k9fd10jcn9mg。
     * @param jobName 任务名称
     * @param jobGroup 任务组名
     * @return true:立即运行任务成功，false：立即运行任务失败
     */
    public boolean runningJob(String jobName,String jobGroup){
    	boolean b = true;
    	try {
    		Scheduler scheduler = schedulerFactoryBean.getScheduler();
        	JobKey jobKey = JobKey.jobKey(jobName, jobGroup);
        	scheduler.triggerJob(jobKey);
		} catch (Exception e) {
			b= false;
			logger.error("立刻执行任务失败!");
		}
    	return b;
    }
    /**
     * 更新任务执行时间表达式
     * 更新之后，任务将立即按新的时间表达式执行
     * @param triggerName 触发器名称
	 * @param triggerGroup 触发器组名
     * @return true:修改任务执行时间表达式成功，false：修改任务执行时间表达式失败
     */
    public boolean updateJobCronExpress(String triggerName,String triggerGroup,String cornExpress){
    	boolean b = true;
    	try {
    		Scheduler scheduler = schedulerFactoryBean.getScheduler();
    		TriggerKey triggerKey = TriggerKey.triggerKey(triggerName,triggerGroup);
    		//获取trigger，即在spring配置文件中定义的 bean id="myTrigger"
    		CronTrigger trigger = (CronTrigger) scheduler.getTrigger(triggerKey);
    		//表达式调度构建器
    		CronScheduleBuilder scheduleBuilder = CronScheduleBuilder.cronSchedule(cornExpress);
    		//按新的cronExpression表达式重新构建trigger
    		trigger = trigger.getTriggerBuilder().withIdentity(triggerKey)
    		    .withSchedule(scheduleBuilder).build();
    		//按新的trigger重新设置job执行
    		scheduler.rescheduleJob(triggerKey, trigger);
		} catch (Exception e) {
			b= false;
			logger.error("修改任务执行时间表达式失败!");
		}
    	return b;
    }
}
