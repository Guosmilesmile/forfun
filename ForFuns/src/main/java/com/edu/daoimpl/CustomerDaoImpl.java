/**
 * 
 */
package com.edu.daoimpl;

import org.hibernate.Query;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Repository;

import com.edu.base.BaseDaoImpl;
import com.edu.dao.ICustomerDao;
import com.edu.model.Customer;

@Lazy(true)
@Repository("customerDao")
public class CustomerDaoImpl extends BaseDaoImpl<Customer> implements ICustomerDao {

	@Override
	public boolean isExist(Customer user) {
		// String hql = "from CustomerBean where userid=? and password=?";
		// Query query = getSession().createQuery(hql);
		// query.setString(0, user.getUserid());
		// query.setString(1, user.getPassword());
		Query query = getSession().getNamedQuery("CustomerqueryisExist");
		query.setString("userid", user.getUserid());
		query.setString("password", user.getPassword());
		if (query.list().size() >= 1) {
			return true;
		} else {
			return false;
		}
	}

	public int countCustomer() {
		// TODO Auto-generated method stub
//		String hql = "select count(id) from CustomerBean as user";
//		Query query = getSession().createQuery(hql);
		Query query = getSession().getNamedQuery("CustomerquerycountCustomer");
		return ((Number) query.uniqueResult()).intValue();
	}

	@Override
	public boolean exist(Customer customer) {
//		String hql = "from CustomerBean where userid=?";
//		Query query = getSession().createQuery(hql);
//		query.setString(0, customer.getUserid());
		Query query = getSession().getNamedQuery("Customerqueryexist");
		query.setString("userid", customer.getUserid());
		if (query.list().size() >= 1) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public String getIdbyUserid(String userid) {
		// TODO Auto-generated method stub
//		String hql = "select id from CustomerBean where userid=?";
//		Query query = getSession().createQuery(hql);
//		query.setString(0, userid);
		Query query = getSession().getNamedQuery("CustomerquerygetIdbyUserid");
		query.setString("userid", userid);
		int i = ((Number) query.uniqueResult()).intValue();
		return Integer.toString(i);
	}

}
