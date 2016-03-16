package com.edu.service;

import com.edu.base.IBaseService;
import com.edu.model.ProductType;
import com.edu.model.User;

public interface IProductTypeService extends IBaseService<ProductType>
{
	/**
	 * 判断商品信息是否与数据库匹配
	 * @param productType
	 * @return
	 */
	public boolean isExist(ProductType productType);
	
	/**
	 * 保存实体
	 * @param productType
	 */
	public void save(ProductType productType);
}
