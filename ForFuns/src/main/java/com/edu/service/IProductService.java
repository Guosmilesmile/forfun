package com.edu.service;

import java.util.List;

import com.edu.base.IBaseService;
import com.edu.model.Customer;
import com.edu.model.Product;
import com.edu.proxy.ProductProxy;

public interface IProductService extends IBaseService<Product>{
	
	/**
	 * 获取上线商品
	 * @param page
	 * @param pageSize
	 * @param typeid
	 * @param methodid
	 * @return
	 */
	public List<Product> getOnlineProduct(int page,int pageSize,int typeid,int methodid);
	
	/**
	 * 获取上线商品数量
	 * @param typeid
	 * @param methodid
	 * @return
	 */
	public int getOnlineProductTotal(int typeid,int methodid);
	
	/**
	 * 获取对应艺术家的商品
	 * @param page
	 * @param pageSize
	 * @param artist
	 * @return
	 */
	public List<Product> getArtistProduct(int page,int pageSize,int artist);
	
	/**
	 * 获取对应艺术家商品的数量
	 * @param artist
	 * @return
	 */
	public int getArtistProductTotal(int artist);
	
}
