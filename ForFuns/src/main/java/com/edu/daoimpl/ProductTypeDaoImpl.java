package com.edu.daoimpl;

import org.hibernate.Query;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Repository;

import com.edu.base.BaseDaoImpl;
import com.edu.dao.IProductTypeDao;
import com.edu.model.ProductType;
import com.edu.model.User;

@Lazy(true)
@Repository("productTypeDao")

public class ProductTypeDaoImpl extends BaseDaoImpl<ProductType> implements IProductTypeDao {
	@Override
	public boolean isExist(ProductType productType) {

		// String hql = "from ProductTypeBean where id=?";
		// Query query = getSession().createQuery(hql);
		// query.setLong(0, productType.getId());

		Query query = getSession().getNamedQuery("ProductTypequeryisExist");
		query.setInteger("id", productType.getId());

		if (query.list().size() >= 1) {
			return true;
		} else {
			return false;
		}
	}
}
