/**
 * 
 */
package com.edu.dao;

import com.edu.base.IBaseDao;
import com.edu.model.User;


public interface IUserDao extends IBaseDao<User>{
	
	/**
	 * 判断后台用户账号密码是否与数据库相符
	 * @param user
	 * @return
	 */
	public boolean isExist(User user);
	
	//测试用
	public void TestNamedQuery();
}
