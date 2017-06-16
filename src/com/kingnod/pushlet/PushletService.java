package com.kingnod.pushlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import nl.justobjects.pushlet.core.Dispatcher;
import nl.justobjects.pushlet.core.Event;
import nl.justobjects.pushlet.core.EventPullSource;
import nl.justobjects.pushlet.core.Session;
import nl.justobjects.pushlet.core.SessionManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.SpringBeanAutowiringSupport;

import com.google.gson.Gson;
import com.kingnod.entity.Chat;
import com.kingnod.service.ChatService;
import com.kingnod.util.Users;

@Component
public class PushletService extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 3907887039765946099L;

	/*@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		Session[] sessions = SessionManager.getInstance().getSessions();
		System.out.println("--手动触发---sessions："+sessions.length);
		for(int i=0;i<sessions.length;i++){
			System.out.println("*******手动触发*********第："+(i+1)+"****"+sessions[i].getId());
			String message = "";
			try {
				message = (new PushletService()).findNotReadChat("N",Long.parseLong(sessions[i].getId()));
				Event event = Event.createDataEvent("allTOall");
		        event.setField("mes",message);
		        event.setField("time", Calendar.getInstance().getTime().getTime());
		        Dispatcher.getInstance().multicast(event);
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		// TODO Auto-generated method stub
		//super.doGet(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//super.doPost(req, resp);
	}*/
	
	//@Autowired
	//private TaskDao taskDao;
	@Autowired
	private ChatService chatService;
	{
		WebApplicationContext	applicationContext = ContextLoaderListener.getCurrentWebApplicationContext();
		//手动注入dao或者Service
		//taskDao =(TaskDao)applicationContext.getBean("taskDao");
		chatService =(ChatService)applicationContext.getBean("chatService");
		//chatService.sys();
	}
	
	/*public  String findAllTask() throws UnsupportedEncodingException{
		List<Task> rs = new ArrayList<Task>();
		List<Task> list= taskDao.findAll();
		if(list!=null && !list.isEmpty()){
			for(Task task :list){
				task.setUser(null);
				rs.add(task);
			}
		}
		Gson gson = new Gson();
		String message = gson.toJson(rs);
		return URLEncoder.encode(message, "UTF-8");
	}*/
	
	/**
	 * 使用Pushlet实现消息推送
	 */
	public static class  Pushlet extends EventPullSource{

		@Override
		protected long getSleepTime() {
			return 1000*100;
		}
		
		@Override
		protected Event pullEvent() {
			String message = "";
			/*try {
				message = (new PushletService()).findNotReadChat("N",1L);
				//message = (new PushletService()).findNotReadChat();
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}*/
			Session[] sessions = SessionManager.getInstance().getSessions();
			System.out.println("-----sessions："+sessions.length);
			for(int i=0;i<sessions.length;i++){
				//System.out.println("****************第："+(i+1)+"****"+sessions[i].getId());
			}
			Event event = Event.createDataEvent("allTOall");
            event.setField("mes",message);
            event.setField("time", Calendar.getInstance().getTime().getTime());
            return event;
		}
	}
	
	@Override
    public void init(ServletConfig config) throws ServletException{
        SpringBeanAutowiringSupport.processInjectionBasedOnServletContext(this,config.getServletContext());
    }
}
