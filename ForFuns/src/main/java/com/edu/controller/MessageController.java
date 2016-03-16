package com.edu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.edu.dao.ICustomerDao;
import com.edu.model.Customer;
import com.edu.model.Message;
import com.edu.service.ICustomerService;
import com.edu.service.IMessageService;
import com.edu.socket.MessageVO;

@Controller
@RequestMapping("/message.do")
public class MessageController {

	@Autowired
	private IMessageService messageService;
	@Autowired
	private ICustomerService customerService;

	/**
	 * 根据userid获取用户未读信息
	 * @param customerUserid
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="method=getUndReadMessage")
	public Map<String, Object> JsonGetUnRead(@RequestParam(name="customerUserid")String customerUserid){
		Map<String, Object> map = new HashMap<String, Object>();
		Customer customerBean = null;
		try {
			customerBean = customerService.getCustomerByUserId(customerUserid+"");
			List<Message> unread = messageService.getUserMessage(customerBean.getId(),0);
			List<Message> read = messageService.getUserMessage(customerBean.getId(),1);
			map.put("unread", MessageVO.ChangeToListMessageVO(unread));
			map.put("read", MessageVO.ChangeToListMessageVO(read));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	/**
	 * 进入个人消息页面
	 * @param useridtoken
	 * @return
	 */
	@RequestMapping(params="method=entermymessage")
	public String CheckLoginEnterMyMessage(@CookieValue(value = "useridtoken", required = false,defaultValue="") String useridtoken){
		return "font/MessageList.jsp?";
	}
}
