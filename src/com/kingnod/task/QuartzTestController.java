package com.kingnod.task;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping(value="/test/quartz")
public class QuartzTestController {
	@Autowired
	private TaskService taskService;
	
	/**
	 * 获取任务列表
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/job/list")
	public Object queryJobList() throws Exception{
		return	taskService.jobList();
	}
	/**
	 * 获取正在执行的任务列表
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/running/job/list")
	public Object queryRunningJobList() throws Exception{
		return	taskService.jobRunningList();
	}
	/**
	 * 获取任务详情
	 * @param triggerName 触发器名称
	 * @param triggerGroup 触发器组名
	 * @return 查询不到返回空值
	 */
	@RequestMapping(value="/job/detail")
	public Object getJob(@RequestParam(value="triggerName",required=true)String triggerName,
			@RequestParam(value="triggerGroup",required=true)String triggerGroup){
		return	taskService.jobDetail(triggerName, triggerGroup);
	}
	/**
     * 暂停定时任务
     * @param jobName 任务名称
     * @param jobGroup 任务组名
     * @return true:暂停任务成功，false：暂停任务失败
     */
	@RequestMapping(value="stop/job")
	public Object stopJob(@RequestParam(value="jobName",required=true)String jobName,
			@RequestParam(value="jobGroup",required=true)String jobGroup) throws Exception{
		return	taskService.stopJob(jobName, jobGroup);
	}
	/**
     * 恢复定时任务
     * @param jobName 任务名称
     * @param jobGroup 任务组名
     * @return true:恢复任务成功，false：恢复任务失败
     */
	@RequestMapping(value="restart/job")
	public Object restartJob(@RequestParam(value="jobName",required=true)String jobName,
			@RequestParam(value="jobGroup",required=true)String jobGroup) throws Exception{
		return	taskService.reStartJob(jobName, jobGroup);
	}
	/**
     * 删除定时任务
     * 删除任务后，所对应的trigger也将被删除
     * @param jobName 任务名称
     * @param jobGroup 任务组名
     * @return true:删除任务成功，false：删除任务失败
     */
	@RequestMapping(value="detele/job")
	public Object deleteJob(@RequestParam(value="jobName",required=true)String jobName,
			@RequestParam(value="jobGroup",required=true)String jobGroup) throws Exception{
		return	taskService.deleteJob(jobName, jobGroup);
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
	@RequestMapping(value="running/job")
	public Object runningJob(@RequestParam(value="jobName",required=true)String jobName,
			@RequestParam(value="jobGroup",required=true)String jobGroup) throws Exception{
		return	taskService.runningJob(jobName, jobGroup);
	}
	/**
     * 更新任务执行时间表达式
     * 更新之后，任务将立即按新的时间表达式执行
     * @param triggerName 触发器名称
	 * @param triggerGroup 触发器组名
     * @return true:修改任务执行时间表达式成功，false：修改任务执行时间表达式失败
     */
	@RequestMapping(value="update/job/cornExpress")
	public Object updateJobCronExpress(@RequestParam(value="triggerName",required=true)String triggerName,
			@RequestParam(value="triggerGroup",required=true)String triggerGroup,
			@RequestParam(value="corn",required=true)String cornExpress) throws Exception{
		return	taskService.updateJobCronExpress(triggerName, triggerGroup, cornExpress);
	}
	
	/**
	 * 添加定时任务
	 * @param job
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="add/job",method=RequestMethod.POST)
	public boolean addJob(
			@RequestParam(value="jobStatus",required=true)String jobStatus,
			@RequestParam(value="isConcurrent",required=true)String isConcurrent,
			@RequestParam(value="cronExpression",required=true)String cronExpression,
			@RequestParam(value="description",required=true)String description,
			@RequestParam(value="jobClass",required=true)String jobClass
			) throws Exception{
		QuartzJobBean job = new QuartzJobBean(jobStatus, 
				isConcurrent, cronExpression, description, jobClass);
		return	taskService.addJob(job);
	}
}
