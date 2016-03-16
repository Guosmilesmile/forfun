package com.edu.serviceimpl;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.base.BaseServiceImpl;
import com.edu.dao.INewsDao;
import com.edu.model.News;
import com.edu.service.INewsService;
import com.edu.table.NewsTable;
import com.edu.viewentity.NewsVO;

@Service("newsService")
public class NewsServiceImpl extends BaseServiceImpl<News> implements INewsService{

	@Autowired
	private INewsDao newsDao;
	
	@Override
	public List<News> GetHotNews() {
		List<News> list = null;
		list = (List<News>) newsDao.GetHotNews();
		return list;
	}

	@Override
	public List<News> GetOnlineNews() {
		return newsDao.GetOnlineNews();
	}

	@Override
	public Map<String, Object> GetNewsBeanPageByUserid(String userid,int page,int  pageSize,Map<String, String> param) {
		
		String selectname = "";
		String value = "";
		if(null!=param){
			Iterator<Map.Entry<String, String>> enIterators = param.entrySet().iterator();
			while(enIterators.hasNext()){
				Map.Entry<String, String> entry = enIterators.next(); 
				selectname= entry.getKey();
				value= entry.getValue();
			}
		}
		List<News> list = newsDao.getPageBeanFilterMore(News.class, page, pageSize, selectname, value, NewsTable.USERID, userid);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total",list.size());
		map.put("rows",NewsVO.changeToNewsVOs(list));
		return map;
	}

}
