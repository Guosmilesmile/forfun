package com.edu.daoimpl;

import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Repository;

import com.edu.base.BaseDaoImpl;
import com.edu.dao.IArtistDao;
import com.edu.model.Artist;
import com.edu.model.Customer;
import com.edu.model.ExamineArtist;
import com.edu.model.Product;
import com.edu.table.AdvertTable;

@Lazy(true)
@Repository("artistDao")
public class ArtistDaoImpl extends BaseDaoImpl<Artist> implements IArtistDao {
	@Override
	public boolean isExist(Customer customer) {
//		String hql = "from CustomerBean where username=? and password=? and isartist=1";
//		Query query = getSession().createQuery(hql);
//		query.setString(0, customer.getUsername());
//		query.setString(1, customer.getPassword());
		Query query = getSession().getNamedQuery("ArtistqueryisExist");
		query.setString("username", customer.getUsername());
		query.setString("password", customer.getPassword());
		if (query.list().size() >= 1) {
			return true;
		} else {
			return false;
		}
	}

	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public List<Artist> getAllEntity(Class clz) {
		//String hql = "";
		List<Artist> list = null;
		try {
//			hql = "from CustomerBean where isartist=1";
//			System.out.println(hql);
//			list = getSession().createQuery(hql).list();
			list = getSession().getNamedQuery("ArtistquerygetAllEntity").list();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public List<Artist> getPageBeanFilter(Class clz, int page, int pageSize, String selectname, String value) {
		String hql = "";
		List<Artist> list = null;
		try {
			hql = "from " + clz.newInstance().getClass().getName() + " where " + selectname + " like '%" + value
					+ "%' and isartist=1";
			System.out.println(hql);
			Query query = getSession().createQuery(hql);
			
			//Query query = getSession().getNamedQuery("ArtistquerygetPageBeanFilter");
			//query.setString("classname", clz.newInstance().getClass().getName());
			//query.setString("selectname", selectname);
			//query.setString("value", value);
			
			query.setFirstResult((page - 1) * pageSize);
			query.setMaxResults(pageSize);
			list = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public List<Artist> getPageBeanFilterTotal(Class clz, String selectname, String value) {
		String hql = "";
		List<Artist> list = null;
		try {
			hql = "from " + clz.newInstance().getClass().getName() + " where " + selectname + " like '%" + value
					+ "%' and isartist=1";
			System.out.println(hql);
			Query query = getSession().createQuery(hql);
			
			//Query query = getSession().getNamedQuery("ArtistquerygetPageBeanFilter");
			//query.setString("classname", clz.newInstance().getClass().getName());
			//query.setString("selectname", selectname);
			//query.setString("value", value);
			list = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public int countEa() {
		//String hql = "select count(id) from ExamineArtistBean";
		//Query query = getSession().createQuery(hql);
		Query query = getSession().getNamedQuery("ArtistquerycountEa");
		return ((Number) query.uniqueResult()).intValue();
	}


}
