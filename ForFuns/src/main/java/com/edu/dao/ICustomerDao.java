package com.edu.dao;

import java.util.List;

import com.edu.base.IBaseDao;
import com.edu.model.Customer;

public interface ICustomerDao extends IBaseDao<Customer>
{
	/**
	 * 判断用户账号密码是否与数据库相符
	 * @param customer
	 * @return
	 */
	public boolean isExist(Customer customer);
	/**
	 * 判断数据库中是否有相同id的数据
	 * @param customer
	 * @return
	 */
	public boolean exist(Customer customer);
	/**
	 * 计算用户数量
	 * @return
	 */
	public int countCustomer();
	/**
	 * 根据id获取userid
	 * @param userid
	 * @return
	 */
	public String getIdbyUserid(String userid);
}
