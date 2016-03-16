package com.edu.dao;

import com.edu.base.IBaseDao;
import com.edu.model.ProductMoney;

public interface IProductMoneyDao extends IBaseDao<ProductMoney>{
	/**
	 * 获取最高价位
	 * @param productid
	 * @return
	 */
	public Integer GetMaxMoneyid(Integer productid);
}
