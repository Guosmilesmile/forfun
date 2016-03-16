package com.edu.daoimpl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.edu.dao.IOrderDao;
import com.edu.model.Order;
import com.edu.base.BaseDaoImpl;

@Repository("orderDao")
public class OrderDaoImpl extends BaseDaoImpl<Order> implements IOrderDao{

	@Override
	public Order getOrderByIds(Integer productid, Integer customerid) {
//		String hql = "from OrderBean where productid=? and customerid=? ";
//		Query query = getSession().createQuery(hql);
//		query.setInteger(0, productid);
//		query.setInteger(1, customerid);
		
		Query query = getSession().getNamedQuery("OrderquerygetOrderByIds");
		 query.setInteger("productid", productid);
		 query.setInteger("customerid", customerid);
		List<Order> list = query.list();
		if(list.size()==0)
			return null;
		return (Order) query.list().get(0);
	}

	@Override
	public List<Order> getCusertomerOrder(String customerUserid) {
//		String hql = "select order from OrderBean order where order.customerBean.userid = ?";
//		Query query = getSession().createQuery(hql);
//		query.setString(0, customerUserid);
		
		Query query = getSession().getNamedQuery("OrderquerygetCusertomerOrder");
		query.setString("customerid", customerUserid);
		List<Order> list =query.list();
		if(list.size()==0)
			return null;
		return list;
	}

	@Override
	public Order getOrderByProductid(Integer productid) {
		Query query =getSession().getNamedQuery("getOrderByProductid");
		query.setInteger("productid", productid);
		Order order = (Order) query.uniqueResult();
		return order;
	}

}
