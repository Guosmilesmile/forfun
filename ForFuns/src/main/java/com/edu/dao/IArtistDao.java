package com.edu.dao;

import java.util.List;

import com.edu.base.IBaseDao;
import com.edu.model.Artist;
import com.edu.model.Customer;
import com.edu.model.ExamineArtist;
import com.edu.model.Product;

public interface IArtistDao extends IBaseDao<Artist>
{
	/**
	 * 判断用户账号密码是否与数据库相符
	 * @param customer
	 * @return
	 */
	public boolean isExist(Customer customer);
	
	public List<Artist> getAllEntity(Class clz);
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Artist> getPageBeanFilter(Class clz,int page,int pageSize,String selectname,String value);
	
	public int countEa();

	/**
	 * 获取总数
	 * @param clz
	 * @param selectname
	 * @param value
	 * @return
	 */
	List<Artist> getPageBeanFilterTotal(Class clz, String selectname,String value);
	
}
