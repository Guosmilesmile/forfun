package com.edu.daoimpl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.edu.base.BaseDaoImpl;
import com.edu.dao.IAddressDao;
import com.edu.model.Address;

@Repository("addressDao")
public class AddressDaoImpl extends BaseDaoImpl<Address> implements IAddressDao{

}
