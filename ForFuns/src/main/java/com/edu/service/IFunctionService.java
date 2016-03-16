package com.edu.service;

import java.util.List;

import com.edu.base.IBaseService;
import com.edu.model.Function;

public interface IFunctionService extends IBaseService<Function>{
	public List<Function> GetAllFunction();
	
	
	/**
	 * 获取所有的顶部菜单
	 * @return
	 */
	public List<Function> GetAllTopMenu();
	
	/**
	 * 获取所有的非顶部菜单
	 * @return
	 */
	public List<Function> GetAllSecondMenu();
}
