package com.edu.base;

import java.util.List;
import java.util.Map;

import org.hibernate.Session;


public interface IBaseDao<T> {
	/**
	 * 获取session
	 * @return
	 */
	public Session getSession();
	/**
	 * 增加数据或者保存数据。如果存在主键就更新，如果不存在主键则插入
	 * @param object
	 */
	public void addEntity(Object object);

	
	/**
	 * 根据id获取数据
	 * @param clz 实体类的class
	 * @param id 
	 * @return
	 * @throws Exception 
	 */
	@SuppressWarnings("rawtypes")
	public Object getEntitybyId(Class clz, Integer id);
	
	
	/**
	 * 根据条件获取对应持久化对象
	 * @param clz
	 * @param require
	 * @return
	 * @throws Exception 
	 */
	@SuppressWarnings("rawtypes")
	public Object getObjectbyRequir(Class clz,Map<String, String>require) throws Exception;
	
	/**
	 * 根据条件获取对应对象id
	 * @param clz
	 * @param require
	 * @return
	 * @throws Exception 
	 */
	@SuppressWarnings("rawtypes")
	public Integer SqlgetObjectId(String tablename,Map<String, String>require) throws Exception;
	
	
	/**
	 * 根据类获取所有数据
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List<T> getAllEntity(Class clz);
	
	/**
	 * 分页
	 * @param claz
	 * @param pagesize
	 * @param page
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List<T> getPageEntity(Class clz,int page,int pageSize);
	
	
	
	/**
	 * 根据实体删除数据(根据的是实体类中的主键删除)
	 * @param object
	 */
	public void deleteEntity(Object object);

	
	/**
	 * 根据id删除数据
	 * @param clz 实体类的class
	 * @param id
	 * @throws Exception 
	 */
	@SuppressWarnings("rawtypes")
	public void deleteEntitybyId(Class clz, Integer id) throws Exception;
	
	
	/**
	 * 批量删除
	 * @param clz
	 * @param Ids
	 * @throws Exception 
	 */
	@SuppressWarnings("rawtypes")
	public void deleteBatch(Class clz,int[] Ids) throws Exception;
	/**
	 * 更新从getObjectbyRequir函数获取的实体。
	 * @param object
	 */
	public void updateEntity(Object object);

	
	
	/**
	 * 执行不带返回值的sql语句
	 * @param sql
	 */
	public void sqlWithNone(String sql);
	
	/**
	 * sql返回实体类
	 * @param sql
	 * @param clz
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List<T> sqlWithList(String sql,Class clz);
	
	
	/**
	 * 返回id或者单个属性
	 * @param sql
	 * @return
	 */
	public Object sqlWithObject(String sql);
	/**
	 * 获取数量
	 * @param clz
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public int GetPageBeanTotal(Class clz);
	
	
	/**
	 * 过滤分页
	 * @param claz
	 * @param pagesize
	 * @param page
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List<T> getPageBeanFilter(Class clz,int page,int pageSize,String selectname,String value);

	/**
	 * 过滤分页对应的总数
	 * @param claz
	 * @param pagesize
	 * @param page
	 * @return
	 */
	public int getPageBeanFilterTotal(Class clz, int page, int pageSize,
			String selectname, String value);

	/**
	 * 通过id或者其他前置条件获取分页过滤
	 * @param clz
	 * @param page
	 * @param pageSize
	 * @param selectname
	 * @param value
	 * @param Morename
	 * @param Morevalue
	 * @return
	 */
	public List<T> getPageBeanFilterMore(Class clz, int page, int pageSize,
			String selectname, String value, String Morename, String Morevalue);
	
	/**
	 * 通过条件获取实体类
	 * @param clz
	 * @param conditionName
	 * @param conditionValue
	 * @return
	 * @throws Exception 
	 */
	public T GetBeanByCondition(Class clz,String conditionName,String conditionValue,Map<String, String> param) throws Exception;
	
	/**
	 * 获取总数
	 * @param clz
	 * @param selectname
	 * @param value
	 * @param Morename
	 * @param Morevalue
	 * @return
	 */
	List<T> getPageBeanFilterMoreTotal(Class clz, String selectname,String value, String Morename, String Morevalue);


}
