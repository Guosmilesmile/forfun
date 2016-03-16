package com.edu.service;

import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.edu.base.BaseServiceImpl;
import com.edu.model.CustomerAddress;
@Lazy
@Transactional
@Service("customerAddressService")
public class CustomerAddressServiceImpl extends BaseServiceImpl<CustomerAddress> implements ICustomerAddressService{

	
}
