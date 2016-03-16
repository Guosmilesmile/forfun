package com.edu.daoimpl;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.edu.dao.IProductDao;
import com.edu.model.Product;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring-hibernate.xml","classpath:spring.xml","classpath:spring-mvc.xml"}) 
public class ProductDaoImplTest {

	@Autowired
	private IProductDao productDao;
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void test() {
		Product productBean = (Product) productDao.getEntitybyId(Product.class, 1);
		System.out.println(productBean.getProductTypeBean().getName());
		System.out.println(productBean.getProductSellBean().getSellMethodBean().getName());
	}

}
