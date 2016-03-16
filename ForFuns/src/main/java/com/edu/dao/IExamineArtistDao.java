package com.edu.dao;

import java.util.List;

import com.edu.model.ExamineArtist;
import com.edu.model.News;
import com.edu.base.IBaseDao;

public interface IExamineArtistDao extends IBaseDao<ExamineArtist>{

	/**
	 * 后台获取待审核艺术家分页
	 * @param clz
	 * @param page
	 * @param pageSize
	 * @param selectname
	 * @param value
	 * @return
	 */
	List<ExamineArtist> getPageBeanFilterrWhereSugNotEqualOne(Class clz, int page, int pageSize, String selectname,
			String value);

	
}
