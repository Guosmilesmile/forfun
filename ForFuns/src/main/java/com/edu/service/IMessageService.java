package com.edu.service;

import java.util.List;

import com.edu.base.IBaseService;
import com.edu.model.Message;

public interface IMessageService extends IBaseService<Message>{
	/**
	 * 获取特定id未读信息
	 * @param sendid
	 * @param fromid
	 * @return
	 */
	public List<Message> getUnReadMessage(Integer sendid,Integer fromid);
	
	/**
	 * 获取当前用户未读信息
	 * @param id
	 * @param isread
	 * @return
	 */
	public List<Message> getUserMessage(Integer id,Integer isread);
	
}
