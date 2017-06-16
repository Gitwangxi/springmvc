package com.kingnod.service;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import nl.justobjects.pushlet.core.Dispatcher;
import nl.justobjects.pushlet.core.Event;
import nl.justobjects.pushlet.core.Session;
import nl.justobjects.pushlet.core.SessionManager;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;
import com.kingnod.dao.ChatDao;
import com.kingnod.entity.Chat;
import com.kingnod.pushlet.PushletService;
import com.kingnod.shiro.ShiroDbRealm.ShiroUser;
import com.kingnod.util.Users;

@Service("chatService")
@Transactional(readOnly=true)
public class ChatService {
	
	@Autowired
	private ChatDao chatDao;
	
	/**
	 * 保存聊天
	 * @param chat
	 * @return
	 */
	@Transactional(readOnly=false)
	public Chat saveChat(Chat chat){
		chat.setSendId(Users.userId());
		chat.setSendName(Users.shiroUser().getName());
		chat.setReadFlag("N");
		chat.setSendDate(new Date());
		return chatDao.save(chat);
	}
	
	/**
	 * 修改聊天状态
	 * @param chat
	 * @return
	 */
	@Transactional(readOnly=false)
	public Chat updateChat(Chat chat){
		chat.setReadFlag("Y");
		return chatDao.save(chat);
	}
	/**
	 * 获取所有未读信息
	 * @return
	 */
	public List<Chat> findNotReadChat(String readFlag,Long sendId){
		return chatDao.findNotReadChat(readFlag,sendId);
	}
	/**
	 * 查询当前用户发送，并未读取的消息
	 * @param readFlag
	 * @param sendId
	 * @return
	 */
	List<Chat> findCurrendSendAndNotRead(String readFlag,Long sendId){
		return chatDao.findCurrendSendAndNotRead(readFlag, sendId);
	}
	/**
	 * 将未读数据设置为已读
	 * @param list
	 */
	@Transactional(readOnly=false,rollbackFor=Exception.class)
	public void setReadFlag(List<Chat> list){
		for(Chat chat : list){
			chat.setReadFlag("Y");
			chatDao.save(chat);
		}
	}
	
	public void sys(){
		ShiroUser shiroUser= (ShiroUser)SecurityUtils.getSubject().getPrincipal();
		System.out.println("-----"+shiroUser);
	}
	
	
	/**
	 * 获取所有未读的信息（具体信息的过滤在页面上实现）,消息发送人不包含sendId
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public  String findNotReadChatListStr(String readFlag,Long sendId) throws UnsupportedEncodingException{
		final List<Chat> list= this.findNotReadChat(readFlag,sendId);
		Gson gson = new Gson();
		String message = gson.toJson(list);
		for(Chat chat:list){
			chat.setReadFlag("Y");
			chatDao.save(chat);
		}
		return URLEncoder.encode(message, "UTF-8");
	}
	
	/**
	 * 获取当前用户发送的未被读的消息
	 * @param readFlag
	 * @param sendId
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@Transactional(readOnly=false)
	public String findCurrendSendAndNotReadListStr(String readFlag,Long sendId) throws UnsupportedEncodingException{
		final List<Chat> list= this.findCurrendSendAndNotRead(readFlag,sendId);
		Gson gson = new Gson();
		String message = gson.toJson(list);
		for(Chat chat:list){
			chat.setReadFlag("Y");
			chatDao.save(chat);
		}
		return URLEncoder.encode(message, "UTF-8");
	}
	
	/**
	 * 把当前人发送的消息推送给指定的事件者（不包含自己）
	 */
	@Transactional(readOnly=false)
	public void pushMessage(){
		Session[] sessions = SessionManager.getInstance().getSessions();
		System.out.println("--手动触发---sessions："+sessions.length);
		String message = "";
		try {
			message = this.findCurrendSendAndNotReadListStr("N",Users.userId());
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		for(int i=0;i<sessions.length;i++){
			System.out.println("*******手动触发*********第："+(i+1)+"****"+sessions[i].getId());
			if(!sessions[i].getId().equals(Users.userId()+"")){//不给自己发送消息
				Event event = Event.createDataEvent("allTOall");
		        event.setField("mes",message);
		        event.setField("time", Calendar.getInstance().getTime().getTime());
		        Dispatcher.getInstance().unicast(event,sessions[i].getId());
			}
		}
	} 
}
