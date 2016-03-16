package com.edu.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.edu.base.BaseServiceImpl;
import com.edu.dao.IProductMoneyDao;
import com.edu.daoimpl.ProductDaoImpl;
import com.edu.model.Product;
import com.edu.model.ProductMoney;
import com.edu.service.IProductMoneyService;
@Lazy
@Service("productMoneyService")
@Transactional
public class ProductMoneyServiceImpl extends BaseServiceImpl<ProductMoney> implements IProductMoneyService{

	@Autowired
	private IProductMoneyDao productMoneyDao;
	@Override
	public ProductMoney getMaxMoney(Integer productid) {
		Integer MaxMoneyid = productMoneyDao.GetMaxMoneyid(productid);
		ProductMoney productMoneyBean  = (ProductMoney) productMoneyDao.getEntitybyId(ProductMoney.class, MaxMoneyid);
		return productMoneyBean;
	}

}
