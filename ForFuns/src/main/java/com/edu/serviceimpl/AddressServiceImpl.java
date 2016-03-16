package com.edu.serviceimpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.base.BaseServiceImpl;
import com.edu.base.TreeBean;
import com.edu.base.TreeChildItemBean;
import com.edu.dao.IAddressDao;
import com.edu.dao.ICustomerDao;
import com.edu.model.Address;
import com.edu.model.CustomerAddress;
import com.edu.model.Customer;
import com.edu.model.Role;
import com.edu.model.User;
import com.edu.service.IAddressService;
import com.edu.service.ICustomerService;

@Service("addressService")
public class AddressServiceImpl extends BaseServiceImpl<Address> implements IAddressService
{
	@Autowired
	private IAddressDao addressDao;
	@Autowired
	private ICustomerService customerService;
	@Autowired
	private ICustomerDao customerDao;
	@Override
	public Map<String, Object> GetAddressTree(int page, int pageSize) {
		List<Customer> list = customerService.GetPageBean(Customer.class, page, pageSize);
		List<TreeBean> temp = new ArrayList<TreeBean>();
		int total = 0;
		for(int i=0;i<list.size();i++){
			Customer customerBean = list.get(i);
			Set<CustomerAddress> set =customerBean.getCustomerAddressBeans();
			if (set.size()!=0) {
				total++;
				TreeBean treeBean = new TreeBean();
				treeBean.setId(customerBean.getId()+"");
				treeBean.setName(customerBean.getUserid());
				for(CustomerAddress  customerAddressBean : set){
					treeBean.getChildren().add(new TreeChildItemBean(customerBean.getId()+"_"+customerAddressBean.getAddressBean().getId(),
							customerAddressBean.getAddressBean().getAddress()));
				}
				temp.add(treeBean);
			}
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rows", temp);
		map.put("total", total);
		return map;
	}
	@Override
	public List<Address> GetAddressByCusetomerUserId(String CusetomerUserId) {
		return null;
	}
}
