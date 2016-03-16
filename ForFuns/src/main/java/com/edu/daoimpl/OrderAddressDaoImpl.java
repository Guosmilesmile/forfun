package com.edu.daoimpl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.model.OrderAddress;
import com.edu.base.BaseDaoImpl;
import com.edu.dao.IOrderAddressDao;

@Repository("orderAddressDao")
public class OrderAddressDaoImpl extends BaseDaoImpl<OrderAddress> implements IOrderAddressDao{
	
	

}
