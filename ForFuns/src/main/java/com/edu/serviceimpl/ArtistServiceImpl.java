package com.edu.serviceimpl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.edu.base.BaseServiceImpl;
import com.edu.dao.IArtistDao;
import com.edu.model.Artist;
import com.edu.model.Customer;
import com.edu.model.ExamineArtist;
import com.edu.service.IArtistService;
import com.edu.table.CustomerTable;

@Lazy(true)
@Transactional
@Service("artistService")
public class ArtistServiceImpl extends BaseServiceImpl<Artist> implements IArtistService
{
	@Resource
	private IArtistDao artistDao;

	@Override
	public boolean isExist(Customer customer)
	{
		return artistDao.isExist(customer);
	}

	@Override
	public void save(Customer customer)
	{
		artistDao.addEntity(customer);
	}

	@SuppressWarnings({ "rawtypes" })
	@Override
	public List<Artist> GetPageBeanFilter(Class clz, int page, int pageSize,
			String selectname, String value) 
	{
		return artistDao.getPageBeanFilter(clz, page, pageSize, selectname, value);
	}
	
	@SuppressWarnings("rawtypes")
	@Override
	public int GetPageBeanFilterTotal(Class clz, int page, int pageSize,
			String selectname, String value) 
	{
		return artistDao.getPageBeanFilterTotal(clz, selectname, value).size();
	}
	
	@SuppressWarnings("rawtypes")
	public List<Artist> GetAllBean(Class clz)
	{
		return artistDao.getAllEntity(clz);
	}

	@Override
	public int countEa() {
		return artistDao.countEa();
	}


	public int AddBean(ExamineArtist examineartist) {
		artistDao.addEntity(examineartist);
		return 1;
	}
	
	@Override
	public Artist getArtistByUserId(String userid) throws Exception {
		return artistDao.GetBeanByCondition(Artist.class, CustomerTable.USERID, userid, null);
	}
}