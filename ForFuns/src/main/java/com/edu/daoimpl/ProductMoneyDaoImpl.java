package com.edu.daoimpl;


import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.edu.model.ProductMoney;
import com.edu.base.BaseDaoImpl;
import com.edu.dao.IProductMoneyDao;

@Repository("productMoneyDao")
public class ProductMoneyDaoImpl extends BaseDaoImpl<ProductMoney> implements IProductMoneyDao{

	
	@Override
	public Integer GetMaxMoneyid(Integer productid) {
		String hql = "select id from ProductMoney pp where pp.productBean.id=? and pp.money in (select max(pm.money) from ProductMoney pm where pm.productBean.id=?)" ;
		Query createQuery = getSession().createQuery(hql);
		createQuery.setInteger(0, productid);
		createQuery.setInteger(1, productid);
		Object uniqueResult = createQuery.uniqueResult();
		return Integer.parseInt(uniqueResult.toString());
	}

}
