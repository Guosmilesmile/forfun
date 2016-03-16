package com.edu.serviceimpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.edu.base.BaseServiceImpl;
import com.edu.base.TreeBean;
import com.edu.base.TreeChildItemBean;
import com.edu.dao.IArtistDao;
import com.edu.dao.ICustomerDao;
import com.edu.model.Artist;
import com.edu.model.Function;
import com.edu.model.Role;
import com.edu.model.Customer;
import com.edu.service.ICustomerService;
import com.edu.table.CustomerTable;


@Lazy(true)
@Transactional
@Service("customerService")
public class CustomerServiceImpl extends BaseServiceImpl<Customer> implements
		ICustomerService
{
	@Autowired
	private ICustomerDao customerDao;
	
	@Override
	public boolean isExist(Customer customer)
	{
		return customerDao.isExist(customer);
	}

	@Override
	public void save(Customer customer) 
	{
		customerDao.addEntity(customer);
	}

	@Override
	public int countCustomer() {
		return customerDao.countCustomer();
	}
	
	public boolean exist(Customer customer)
	{
		return customerDao.exist(customer);
	}
	
	

	@Override
	public Customer getCustomerInfo(int id) {
		// TODO Auto-generated method stub
		return  (Customer) customerDao.getEntitybyId(Customer.class,id);
	}

	@Override
	public String getCustomerIdByUserid(String  userid) {
		// TODO Auto-generated method stub
		return customerDao.getIdbyUserid(userid);
	}

	@Override
	public Customer getCustomerByUserId(String userid) throws Exception {
		return customerDao.GetBeanByCondition(Customer.class, CustomerTable.USERID, userid, null);
	}

	/*@Override
	public Map<String, Object> GetCustomerTree(int page, int pageSize)
	{
		List<CustomerBean> list = this.GetPageBean(CustomerBean.class, page, pageSize);
		List<TreeBean> temp = new ArrayList<TreeBean>();
		int total = 0;
		for(int i=0;i<list.size();i++){
			CustomerBean userBean = list.get(i);
			Set<RoleBean> set =userBean.getRoleBeans();
			if (set.size()!=0) 
			{
				total++;
				TreeBean treeBean = new TreeBean();
				treeBean.setId(userBean.getId()+"");
				treeBean.setName(userBean.getUsername());
				for(RoleBean  roleBean : set){
					treeBean.getChildren().add(new TreeChildItemBean(userBean.getId()+"_"+roleBean.getId(),
							roleBean.getRolename()));
				}
				temp.add(treeBean);
			}
		}
		//String treeString= FastJsonTool.createJsonString(temp);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rows", temp);
		map.put("total", total);
		return map;
	}*/
}
