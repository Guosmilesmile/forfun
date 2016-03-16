package com.edu.dao;

import java.util.List;

import com.edu.base.IBaseDao;
import com.edu.model.Order;

public interface IOrderDao extends IBaseDao<Order>{
	/**
	 * 通过商品id和用户id查找订单
	 * @param productid
	 * @param customerid
	 * @return
	 */
	public Order getOrderByIds(Integer productid,Integer customerid);
	
	
	/**
	 * 通过userid获取用户订单
	 * @param customerUserid
	 * @return
	 */
	public List<Order> getCusertomerOrder(String customerUserid);
	
	/**
	 * 通过商品id获取订单
	 * @param productid
	 * @return
	 */
	public Order getOrderByProductid(Integer productid);
}
