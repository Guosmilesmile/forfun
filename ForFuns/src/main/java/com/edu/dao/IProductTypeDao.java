package com.edu.dao;

import com.edu.base.IBaseDao;
import com.edu.model.ProductType;
import com.edu.model.User;

public interface IProductTypeDao extends IBaseDao<ProductType>
{
	/**
	 * 判断商品是否已存在
	 * @param productType
	 * @return
	 */
	public boolean isExist(ProductType productType);
}
