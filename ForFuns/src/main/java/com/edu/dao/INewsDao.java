package com.edu.dao;

import java.util.List;
import java.util.Map;

import com.edu.model.News;
import com.edu.base.IBaseDao;

public interface INewsDao extends IBaseDao<News>{

	/**
	 * 获取热点新闻
	 * @return
	 */
	public List<News> GetHotNews();
	
	/**
	 * 获取在线新闻
	 * @return
	 */
	public List<News> GetOnlineNews();
	
}
