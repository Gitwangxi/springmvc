package com.kingnod.task;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 定时模块类型，记载定时任务信息
 * @author JCN
 *
 */
public class QuartzJobBean implements Serializable{
	public static final String STATUS_NOT_RUNNING = "0";
	public static final String CONCURRENT_IS = "1";
	public static final String CONCURRENT_NOT = "0";
	public static final String JOB_NAME_POSTFIX = "_job_name";//任务名称后缀
	public static final String JOB_GROUP_POSTFIX = "_job_group";//任务组后缀
	public static final String TRIGGER_NAME_POSTFIX = "_trigger_name";//触发器名称后缀
	public static final String TRIGGER_GROUP_POSTFIX = "_trigger_group";//触发器租后缀

	/** 任务id */
	private String jobId;

	/** 任务名称 */
	private String jobName;

	/** 任务分组，任务名称+组名称应该是唯一的 */
	private String jobGroup;

	/** 任务初始状态 0禁用 1启用 2删除 */
	private String jobStatus;

	/** 任务是否有状态（并发） */
	private String isConcurrent = "1";

	/** 任务运行时间表达式 */
	private String cronExpression;

	/** 任务描述 */
	private String description;

	/** 任务调用类在spring中注册的bean id，如果spingId不为空，则按springId查找 */
	private String springId;

	/** 任务调用类名，包名+类名，通过类反射调用 ，如果spingId为空，则按jobClass查找 */
	private String jobClass;

	/** 任务调用的方法名 */
	private String methodName;

	/** 启动时间 */
	private Date startTime;
	/** 前一次运行时间 */
	private Date previousTime;

	/** 下次运行时间 */
	private Date nextTime;

	public String getJobId() {
		return jobId;
	}

	public void setJobId(String jobId) {
		this.jobId = jobId;
	}

	public String getJobName() {
		return jobName;
	}

	public void setJobName(String jobName) {
		this.jobName = jobName;
	}

	public String getJobGroup() {
		return jobGroup;
	}

	public void setJobGroup(String jobGroup) {
		this.jobGroup = jobGroup;
	}

	public String getJobStatus() {
		return jobStatus;
	}

	public void setJobStatus(String jobStatus) {
		this.jobStatus = jobStatus;
	}

	public String getIsConcurrent() {
		return isConcurrent;
	}

	public void setIsConcurrent(String isConcurrent) {
		this.isConcurrent = isConcurrent;
	}

	public String getCronExpression() {
		return cronExpression;
	}

	public void setCronExpression(String cronExpression) {
		this.cronExpression = cronExpression;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getSpringId() {
		return springId;
	}

	public void setSpringId(String springId) {
		this.springId = springId;
	}

	public String getJobClass() {
		return jobClass;
	}

	public void setJobClass(String jobClass) {
		this.jobClass = jobClass;
	}

	public String getMethodName() {
		return methodName;
	}

	public void setMethodName(String methodName) {
		this.methodName = methodName;
	}
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+08:00")
	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+08:00")
	public Date getPreviousTime() {
		return previousTime;
	}

	public void setPreviousTime(Date previousTime) {
		this.previousTime = previousTime;
	}
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+08:00")
	public Date getNextTime() {
		return nextTime;
	}

	public void setNextTime(Date nextTime) {
		this.nextTime = nextTime;
	}

	public QuartzJobBean(){
		
	}
	public QuartzJobBean(String jobStatus,
			String isConcurrent, String cronExpression, String description,
			String jobClass) {
		super();
		this.jobStatus = jobStatus;
		this.isConcurrent = isConcurrent;
		this.cronExpression = cronExpression;
		this.description = description;
		this.jobClass = jobClass;
	}

	

}
