package com.edu.daoimpl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Repository;

import com.edu.model.Advert;
import com.edu.table.AdvertTable;
import com.edu.table.NewsTable;
import com.edu.base.BaseDaoImpl;
import com.edu.dao.IAdvertDao;

@Lazy(true)
@Repository("advertDao")
public class AdvertDaoImpl extends BaseDaoImpl<Advert> implements IAdvertDao
{
	
	@Override
	public List<Advert> GetFirstAdvert()
	{
//		String hql ="from AdvertBean where " +AdvertTable.ISONLINE+" = 1 and "+AdvertTable.POSITION+"=1  order by money desc";
//		Query query = getSession().createQuery(hql);
		Query query = getSession().getNamedQuery("AdvertqueryGetFirstAdvert");
//		query.setString("isonline", AdvertTable.ISONLINE);
//		query.setString("position", AdvertTable.POSITION);
		query.setFirstResult(0); 
		query.setMaxResults(3); 
		return query.list();
	}
	
	@Override
	public List<Advert> GetSecondAdvert()
	{
//		String hql ="from AdvertBean where " +AdvertTable.ISONLINE+" = 1 and "+AdvertTable.POSITION+"=2  order by money desc";
//		Query query = getSession().createQuery(hql);
		Query query = getSession().getNamedQuery("AdvertqueryGetSecondAdvert");
//		query.setString("isonline", AdvertTable.ISONLINE);
//		query.setString("position", AdvertTable.POSITION);
		query.setFirstResult(0); 
		query.setMaxResults(3); 
		return query.list();
	}
	
	@Override
	public List<Advert> GetThirdAdvert()
	{
//		String hql ="from AdvertBean where " +AdvertTable.ISONLINE+" = 1 and "+AdvertTable.POSITION+"=3  order by money desc";
//		Query query = getSession().createQuery(hql);
		Query query = getSession().getNamedQuery("AdvertqueryGetThirdAdvert");
//		query.setString("isonline", AdvertTable.ISONLINE);
//		query.setString("position", AdvertTable.POSITION);
		query.setFirstResult(0); 
		query.setMaxResults(3); 
		return query.list();
	}
}
