package com.edu.socket;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.edu.model.Message;

/**
 * 消息显示层
 * @author Administrator
 *
 */
public class MessageVO {
	private Integer id;
	private String content;
	private Date time;
	private Integer sendid;
	private Integer toid;
	private String sendname;
	private String toname;
	private String sendavator;
	private String toavator;
	private Integer fromid;
	
	public MessageVO(Message messageBean) {
		this.id = messageBean.getId();
		this.content = messageBean.getMessage();
		this.time = messageBean.getCurrent();
		this.sendid = messageBean.getFromCustomerBean().getId();
		this.toid = messageBean.getToCustomerBean().getId();
		this.sendname = messageBean.getFromCustomerBean().getUsername();
		this.toname = messageBean.getToCustomerBean().getUsername();
		this.toavator = messageBean.getToCustomerBean().getAvator();
		this.sendavator= messageBean.getFromCustomerBean().getAvator();
		this.fromid = messageBean.getFromCustomerBean().getId();
	}
	public MessageVO() {
		super();
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	
	public Integer getSendid() {
		return sendid;
	}
	public void setSendid(Integer sendid) {
		this.sendid = sendid;
	}
	public Integer getToid() {
		return toid;
	}
	public void setToid(Integer toid) {
		this.toid = toid;
	}
	public String getSendname() {
		return sendname;
	}
	public void setSendname(String sendname) {
		this.sendname = sendname;
	}
	public String getToname() {
		return toname;
	}
	public void setToname(String toname) {
		this.toname = toname;
	}
	public String getSendavator() {
		return sendavator;
	}
	public void setSendavator(String sendavator) {
		this.sendavator = sendavator;
	}
	public String getToavator() {
		return toavator;
	}
	public void setToavator(String toavator) {
		this.toavator = toavator;
	}
	
	public Integer getFromid() {
		return fromid;
	}
	public void setFromid(Integer fromid) {
		this.fromid = fromid;
	}
	public MessageVO(Integer id, String content, Date time, Integer sendid,
			Integer toid, String sendname, String toname, String sendavator,
			String toavator, Integer fromid) {
		super();
		this.id = id;
		this.content = content;
		this.time = time;
		this.sendid = sendid;
		this.toid = toid;
		this.sendname = sendname;
		this.toname = toname;
		this.sendavator = sendavator;
		this.toavator = toavator;
		this.fromid = fromid;
	}
	public static List<MessageVO> ChangeToListMessageVO(List<Message> temp){
		List<MessageVO> list =new ArrayList<MessageVO>();
		if(null== temp || temp.size()==0)
			return list;
		for(Message messageBean : temp){
			list.add(new MessageVO(messageBean));
		}
		return list;
	}
	
	
}
