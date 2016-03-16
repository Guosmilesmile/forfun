package com.edu.service;

import com.edu.base.IBaseService;
import com.edu.model.ProductMoney;

public interface IProductMoneyService extends IBaseService<ProductMoney>{
	
	/**
	 * 获取拍卖商品的最高价
	 * @param productid
	 * @return
	 */
	public ProductMoney getMaxMoney(Integer productid);
}
