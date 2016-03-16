package com.edu.service;

import java.util.List;
import java.util.Map;

import com.edu.base.IBaseService;
import com.edu.model.FunctionBean;
import com.edu.model.UserRoleBean;


public interface IUserRoleService extends IBaseService<UserRoleBean>{
	/**
	 * 判断是否存在
	 * @param userid
	 * @param roleid
	 * @return
	 */
	public int IsExitUserRole(int userid,int roleid);
	
	/**
	 * 添加
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
	public List<FunctionBean> GetUserFunctions(int userid);
}
