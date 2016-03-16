package com.edu.daoimpl;

import java.util.List;

import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Repository;

import com.edu.base.BaseDaoImpl;
import com.edu.dao.IFunctionDao;
import com.edu.model.Function;
@Lazy(true)
@Repository("functionDao")
public class FunctionDaoImpl extends BaseDaoImpl<Function> implements IFunctionDao{

	@Override
	public List<Function> GetAllTopMenu() {
//		String hql ="from FunctionBean where istopmenu = 1";
//		return getSession().createQuery(hql).list();
		return getSession().getNamedQuery("FunctionqueryGetAllTopMenu").list();
	}

	@Override
	public List<Function> GetAllSecondMenu() {
//		String hql ="from FunctionBean where istopmenu = 0";
//		return getSession().createQuery(hql).list();
		return getSession().getNamedQuery("FunctionqueryGetAllSecondMenu").list();
	}

}
