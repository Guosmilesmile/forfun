package com.edu.service;

import java.util.List;

import com.edu.model.ExamineArtist;
import com.edu.model.News;
import com.edu.base.IBaseService;

public interface IExamineArtistService extends IBaseService<ExamineArtist>{

	/**
	 * 获取艺术家申请表分页
	 * @param clz
	 * @param page
	 * @param pageSize
	 * @param selectname
	 * @param value
	 * @return
	 */
	List<ExamineArtist> GetPageBeanFilterWhereSugNotEqualOne(Class clz, int page, int pageSize,
			String selectname, String value);
	
}
