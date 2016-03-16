package com.edu.stragegy;

import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import com.edu.base.IBaseDao;
import com.edu.dao.IProductDao;
import com.edu.dao.IProductMoneyDao;
import com.edu.model.Customer;
import com.edu.model.Product;

/**
 * 出售策略接口
 * @author Gy
 *
 */
@Transactional
public interface ISellStrategy {
	public String SellProduct(Product productBean,Customer customerBean,Double money,Map<String, Object> params) throws Exception;
	//public void Init(IProductDao productDao,IProductMoneyDao productMoneyDao);
}
