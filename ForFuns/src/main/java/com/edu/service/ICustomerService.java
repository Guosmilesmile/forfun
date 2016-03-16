/**
 * 
 */
package com.edu.service;

import java.util.Map;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.edu.base.IBaseService;
import com.edu.model.Customer;
import com.edu.model.User;
import com.edu.table.CustomerTable;

public interface ICustomerService extends IBaseService<Customer>
{
	/**
	 * 判断用户是否存在
	 * @param customer
	 * @return
	 */
	public boolean isExist(Customer customer);
	
	/**
	 * 从id拿用户信息
	 * @param customer
	 * @return
	 */
	public Customer getCustomerInfo(int id);
	
	/**
	 * 判断用户是否存在,仅用于注册时的重复判断
	 * @param customer
	 * @return
	 */
	public boolean exist(Customer customer);
	
	/**
	 * 判断数据库中用户数量
	 * @param customer
	 * @return
	 */
	public int countCustomer();
	
	/**
	 * 根据userid获得记录的id
	 * @param customer
	 * @return
	 */
	public String getCustomerIdByUserid(String  userid);
	
	/**
	 * 保存实体
	 * @param customer
	 */
	public void save(Customer customer);
	
/*	*//**
	 * 获取树状
	 * @param page
	 * @param pageSize
	 * @return
	 *//*
	public Map<String , Object> GetCustomerTree(int page,int pageSize);*/
	/**
	 * 通过userid获取用户
	 * @param userid
	 * @return
	 * @throws Exception 
	 */
	public Customer getCustomerByUserId(String userid) throws Exception;
}