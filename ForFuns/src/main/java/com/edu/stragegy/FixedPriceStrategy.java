package com.edu.stragegy;

import java.util.Date;
import java.util.Map;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.edu.base.BaseServiceImpl;
import com.edu.base.IBaseService;
import com.edu.dao.IAddressDao;
import com.edu.dao.ICustomerDao;
import com.edu.dao.IOrderAddressDao;
import com.edu.dao.IOrderDao;
import com.edu.dao.IProductDao;
import com.edu.dao.IProductMoneyDao;
import com.edu.model.Address;
import com.edu.model.Customer;
import com.edu.model.OrderAddress;
import com.edu.model.Order;
import com.edu.model.Product;
import com.edu.table.OrderTable;

/**
 * 一口价策略
 * @author Gy
 *
 */
@Transactional
@Service("FixedPriceStrategy")
public class FixedPriceStrategy extends BaseServiceImpl<Product> implements ISellStrategy,IBaseService<Product>{
	@Autowired
	private IProductDao productDao ;
	@Autowired
	private IProductMoneyDao productMoneyDao;
	@Autowired
	private IOrderDao orderDao;
	@Autowired
	private IOrderAddressDao orderAddressDao;
	@Autowired
	private IAddressDao addressDao;
	@Autowired
	private ICustomerDao customerDao;
	@Override
	public String SellProduct(Product productBean,Customer customerBean,Double money,Map<String, Object>params) throws Exception {
		if(productBean.getMoney()>customerBean.getBalance()){
			return "redirect:/font/error.jsp?errorid=5";//余额不足
		}
		Order orderBean = orderDao.GetBeanByCondition(Order.class, OrderTable.PRODUCTID, productBean.getId()+"", null);
		if(null== orderBean){//不存在改商品的订单 
			orderBean = new Order();
			orderBean.setCustomerBean(customerBean);
			orderBean.setProductBean(productBean);
			orderBean.setCurrent(new Date());
			orderBean.setMoney(money);
			orderBean.setIspay(1);
			OrderAddress orderAddressBean = new OrderAddress();
			Address addressBean = (Address) addressDao.getEntitybyId(Address.class, Integer.parseInt(params.get("addressid").toString()));
			orderAddressBean.setOrderBean(orderBean);
			orderAddressBean.setAddressBean(addressBean);
			orderAddressDao.addEntity(orderAddressBean);
			customerBean.setBalance(customerBean.getBalance()-money);
			customerDao.updateEntity(customerBean);
			//orderDao.addEntity(orderBean);
			return "redirect:/font/success.jsp";//添加成功
		}else if(customerBean.getId() != orderBean.getCustomerBean().getId())
			return "redirect:/font/error.jsp?errorid=1";//不属于该用户的订单
		else if(customerBean.getId() == orderBean.getCustomerBean().getId()){
			return "redirect:/font/goodsdetail.jsp?productid="+productBean.getId();//属于该用户的订单
		}
		return "redirect:/font/error.jsp;";//添加失败
		//return 3;//添加成功
		//return 1;//不属于该用户的订单
		//return 2;//属于该用户的订单
		//return 0;//添加失败
	}
	
	/*@Override
	public void Init(IProductDao productDao,
			IProductMoneyDao productMoneyDao) {
		this.productDao = productDao;
		this.productMoneyDao = productMoneyDao;
	}
	*/
}
