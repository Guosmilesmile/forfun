package com.edu.base;

import java.util.List;
import java.util.Map;

public interface IBaseService<T>{
	
	/**
	 * 获取所有的实体
	 * @param clz
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List<T> 	GetAllBean(Class clz);
	/**
	 * 获取分页
	 * @param clz
	 * @param page
	 * @param pageSize
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List<T> GetPageBean(Class clz,int page,int pageSize);
	
	/**
	 * 过滤获取分页
	 * @param clz
	 * @param page
	 * @param pageSize
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List<T> GetPageBeanFilter(Class clz,int page,int pageSize,String selectname,String value);
	
	/**
	 * 获取数量
	 * @param clz
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public int GetPageBeanTotal(Class clz);
	
	/**
	 * 获取数量
	 * @param clz
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public int GetPageBeanFilterTotal(Class clz, int page, int pageSize,
			String selectname, String value);
	
	
	/**
	 * 批量删除
	 * @param clz
	 * @param ids
	 * @throws Exception 
	 */
	@SuppressWarnings("rawtypes")
	public int DeleteBatch(Class clz,int[] ids) throws Exception;
	
	
	/**
	 * 根据id删除实体
	 * @param clz
	 * @param id
	 * @return
	 * @throws Exception 
	 */
	public int DeleteByid(Class clz,int id) throws Exception;
	/**
	 * 添加实体
	 * @param object
	 * @return
	 */
	public int AddBean(Object object); 
	
	/**
	 * 更新实体
	 * @param object
	 * @return
	 */
	public int UpdataBean(Object object);
	
	/**
	 * 根据条件删除实体类
	 * @param clz
	 * @param require
	 * @return
	 */
	public int DeleteBean(Class clz,String tablename,Map<String, String > require);
	
	/**
	 * 通过id获取实体
	 * 
	 */
	public T GetEntityById(Class clz,Integer id);
	
	/**
	 * 通过前置条件获取实体分页过滤
	 * @param clz
	 * @param page
	 * @param pageSize
	 * @param selectname
	 * @param value
	 * @param Morename
	 * @param Morevalue
	 * @return
	 */
	public List<T> GetPageBeanFilterMore(Class clz, int page, int pageSize,
			String selectname, String value, String Morename, String Morevalue);
	/**
	 * 通过前置条件获取实体分页过滤的总数
	 * @param clz
	 * @param page
	 * @param pageSize
	 * @param selectname
	 * @param value
	 * @param Morename
	 * @param Morevalue
	 * @return
	 */
	public int GetPageBeanFilterMoreTotal(Class clz, int page, int pageSize,
			String selectname, String value, String Morename, String Morevalue);
	
	/**
	 * 通过条件获取实体类
	 * @param clz
	 * @param conditionName
	 * @param conditionValue
	 * @return
	 */
	public T GetBeanByCondition(Class clz,String conditionName,String conditionValue,Map<String, String> param);
	
	/**
	 * 进行同步
	 * @param object
	 * @return
	 */
	public Object MergeObject(Object object);
		
}
