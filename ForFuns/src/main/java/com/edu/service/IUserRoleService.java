package com.edu.service;

import java.util.List;
import java.util.Map;

import com.edu.base.IBaseService;
import com.edu.model.Function;
import com.edu.model.UserRole;


public interface IUserRoleService extends IBaseService<UserRole>{
	/**
	 * 判断角色权限是否存在
	 * @param userid
	 * @param roleid
	 * @return
	 */
	public int IsExitUserRole(int userid,int roleid);
	
	/**
	 * 添加用户权限
	 * @param userid
	 * @param roleid
	 * @return
	 */
	public int AddUserRole(int userid,int roleid);
	
	/**
	 * 根据用户id获取权限
	 * @param userid
	 * @return
	 */
	public List<Function> GetUserFunctions(int userid);
}
