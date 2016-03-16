package com.edu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.edu.model.SellMethod;
import com.edu.service.ISellMethodService;



@Controller
@RequestMapping("/sellmethod.do")
public class SellMethodController {
	
	@Autowired
	private ISellMethodService sellMethodService;
	
	/**
	 * 获取所有销售方式
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="method=GetAllSellMethod")
	public List<SellMethod> JsonGetAllSellMethod(){
		return sellMethodService.GetAllBean(SellMethod.class);
	}
}
