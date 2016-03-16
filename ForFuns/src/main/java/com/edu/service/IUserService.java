/**
 * 
 */
package com.edu.service;

import java.util.Map;

import com.edu.base.IBaseService;
import com.edu.model.User;

public interface IUserService extends IBaseService<User>{
	/**
	 * 判断用户是否存在
	 * @param user
	 * @return
	 */
	public boolean isExist(User user);
	
	/**
	 * 保存实体
	 * @param user
	 */
	public void save(User user);
	
	/**
	 * 获取树状
	 * @param page
	 * @param pageSize
	 * @return
	 */
	public Map<String , Object> GetUserTree(int page,int pageSize);
	
}
