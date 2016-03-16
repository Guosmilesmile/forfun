package com.edu.daoimpl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.edu.model.ExamineArtist;
import com.edu.model.News;
import com.edu.table.NewsTable;
import com.edu.base.BaseDaoImpl;
import com.edu.dao.IExamineArtistDao;
import com.edu.dao.INewsDao;

@Repository("examineartistDao")
public class ExamineArtistDaoImpl extends BaseDaoImpl<ExamineArtist> implements IExamineArtistDao{

	@Override
	public List<ExamineArtist> getPageBeanFilterrWhereSugNotEqualOne(Class clz, int page, int pageSize,
			String selectname, String value) {
		// TODO Auto-generated method stub
		String hql ="";
		List<ExamineArtist> list = null;
		try {
			hql = "from "+clz.newInstance().getClass().getName()+" where "+selectname+" like '%"+value+"%' and suggestion = 0";
			System.out.println(hql);
			Query query = getSession().createQuery(hql);
			query.setFirstResult((page-1)*pageSize); 
			query.setMaxResults(pageSize); 
			list = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}


}
