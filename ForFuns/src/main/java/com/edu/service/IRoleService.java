package com.edu.service;

import java.util.List;
import java.util.Map;

import com.edu.base.IBaseService;
import com.edu.model.Role;

public interface IRoleService extends IBaseService<Role>{
	/**
	 * 得到树状结构
	 * @param page
	 * @param pageSize
	 * @return
	 */
	public Map<String, Object> GetPowerTree(int page,int pageSize);
	/**
	 * 得到所有的角色
	 * @return
	 */
	public List<Role> GetAllRole();
	
	
}
