package com.edu.daoimpl;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.edu.model.News;
import com.edu.table.NewsTable;
import com.edu.base.BaseDaoImpl;
import com.edu.dao.INewsDao;

@Repository("newsDao")
public class NewsDaoImpl extends BaseDaoImpl<News> implements INewsDao{

	@Override
	public List<News> GetHotNews() {
		//String hql ="from NewsBean where "+NewsTable.ISHOT+" = 1 and "+NewsTable.ISONLINE+" = 1 and "+NewsTable.SITUATION+"=1  order by money desc";
		//return getSession().createQuery(hql).list();
		Query query = getSession().getNamedQuery("NewsqueryGetHotNews");
		//query.setString("ishot", "ishot");
		//query.setString("isonline", "isonline");
		//query.setString("situation", "situation");
		return query.list();
	}

	@Override
	public List<News> GetOnlineNews() {
//		String hql ="from NewsBean where "+NewsTable.ISONLINE+" = 1";
//		return getSession().createQuery(hql).list();
		Query query = getSession().getNamedQuery("NewsqueryGetOnlineNews");
//		query.setString("isonline", NewsTable.ISONLINE);
		return query.list();
	}

	

}
