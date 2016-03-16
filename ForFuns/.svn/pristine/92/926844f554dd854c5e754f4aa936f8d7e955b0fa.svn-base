/**
 * 
 */
package com.edu.service;

import java.util.Map;

import com.edu.base.IBaseService;
import com.edu.model.UserBean;

public interface IUserService extends IBaseService<UserBean>{
	/**
	 * 判断用户是否存在
	 * @param user
	 * @return
	 */
	public boolean isExist(UserBean user);
	
	/**
	 * 保存实体
	 * @param user
	 */
	public void save(UserBean user);
	
	/**
	 * 获取树状
	 * @param page
	 * @param pageSize
	 * @return
	 */
	public Map<String , Object> GetUserTree(int page,int pageSize);
}
