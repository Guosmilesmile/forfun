package com.edu.dao;

import java.util.List;

import com.edu.base.IBaseDao;
import com.edu.model.Function;

public interface IFunctionDao extends IBaseDao<Function>{
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
