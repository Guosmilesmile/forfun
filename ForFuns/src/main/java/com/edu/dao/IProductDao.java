package com.edu.dao;

import java.util.List;

import com.edu.base.IBaseDao;
import com.edu.model.Product;

public interface IProductDao extends IBaseDao<Product>{
	/**
	 * 修改商品状态 
	 * @param situation
	 * @return
	 */
	public int ChangeSituation(Product productBean,Integer situation);
	
	/**
	 * 获取可上线商品
	 * @param page
	 * @param pageSize
	 * @return
	 */
	public List<Product> GetOnlineProduct(int page,int pageSize,int typeid,int methodid);
	
	/**
	 * 获取上线商品数量
	 * @param page
	 * @param pageSize
	 * @return
	 */
	public int getOnlineProductTotal(int typeid, int methodid);
	
	/**
	 * 获取对应艺术家的商品
	 * @param page
	 * @param pageSize
	 * @return
	 */
	public List<Product> GetArtistProduct(int page,int pageSize,int artistid);
	
	/**
	 * 获取对应艺术家商品的数量
	 * @param page
	 * @param pageSize
	 * @return
	 */
	public int getArtistProductTotal(int artistid);
}
