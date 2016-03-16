package com.edu.dao;


import java.util.List;

import com.edu.base.IBaseDao;
import com.edu.model.Advert;
import com.edu.model.News;

public interface IAdvertDao extends IBaseDao<Advert>
{
	/**
	 * 获取第1行广告
	 * @return
	 */
	public List<Advert> GetFirstAdvert();
	
	/**
	 * 获取第2行广告
	 * @return
	 */
	public List<Advert> GetSecondAdvert();
	
	/**
	 * 获取第3行广告
	 * @return
	 */
	public List<Advert> GetThirdAdvert();
}
