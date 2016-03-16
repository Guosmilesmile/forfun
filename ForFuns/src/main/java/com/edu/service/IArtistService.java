/**
 * 
 */
package com.edu.service;

import java.util.List;
import java.util.Map;

import com.edu.base.IBaseService;
import com.edu.model.Artist;
import com.edu.model.Customer;
import com.edu.model.ExamineArtist;

public interface IArtistService extends IBaseService<Artist>
{
	/**
	 * 判断用户是否存在
	 * @param customer
	 * @return
	 */
	public boolean isExist(Customer customer);
	
	
	
	/**
	 * 保存实体
	 * @param customer
	 */
	public void save(Customer customer);
	
	
	
	/**
	 * 计算数量
	 * @return
	 */
	public int countEa();
	
	/**
	 * 获取所有艺术家
	 */
	@SuppressWarnings("rawtypes")
	public List<Artist> GetAllBean(Class clz);
	
	/**
	 * 获取艺术家分页
	 */
	@SuppressWarnings("rawtypes")
	public List<Artist> GetPageBeanFilter(Class clz,int page,int pageSize,String selectname,String value);
	
	/**
	 * 获取艺术家分页总数
	 */
	@SuppressWarnings("rawtypes")
	public int GetPageBeanFilterTotal(Class clz, int page, int pageSize,
			String selectname, String value);


	/**
	 * 通过userid获取艺术家信息
	 * @param userid
	 * @return
	 * @throws Exception
	 */
	public Artist getArtistByUserId(String userid) throws Exception;
}