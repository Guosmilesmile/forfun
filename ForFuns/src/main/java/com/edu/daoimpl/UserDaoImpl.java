/**
 * 
 */
package com.edu.daoimpl;



import java.util.List;

import org.hibernate.Query;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Repository;

import com.edu.base.BaseDaoImpl;
import com.edu.dao.IUserDao;
import com.edu.model.User;

@Lazy(true)
@Repository("userDao")
public class UserDaoImpl extends BaseDaoImpl<User> implements IUserDao {


	@Override
	public boolean isExist(User user) {
//		 String hql = "from UserBean where username=? and password=?";
//		 Query query = getSession().createQuery(hql);
		 Query query = getSession().getNamedQuery("UserqueryByName");
		 query.setString("username", user.getUsername());
		 query.setString("password", user.getPassword());
		 if(query.list().size()>=1){
			 return true;
		 }else{
			 return false;
		 }
	}

	@Override
	public void TestNamedQuery() {
		 Query queryNamed = getSession().getNamedQuery("UserqueryByName");
		 List<User> list = queryNamed.list();
		 System.out.println(list.size());
	}
	
	


}
