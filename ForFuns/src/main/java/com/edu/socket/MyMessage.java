package com.edu.socket;

/**
 * 我的消息
 * @author Administrator
 *
 */
public class MyMessage {
	private String sendid;
	private String receiverid;
	private String content;
	private String flag;
	public MyMessage() {
		super();
	}
	public MyMessage(String sendid, String receiverid, String content,
			String flag) {
		super();
		this.sendid = sendid;
		this.receiverid = receiverid;
		this.content = content;
		this.flag = flag;
	}
	public String getSendid() {
		return sendid;
	}
	public void setSendid(String sendid) {
		this.sendid = sendid;
	}
	public String getReceiverid() {
		return receiverid;
	}
	public void setReceiverid(String receiverid) {
		this.receiverid = receiverid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	
}
