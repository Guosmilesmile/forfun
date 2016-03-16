package com.edu.model;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.TreeSet;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.hibernate.annotations.DynamicInsert;
import org.springframework.stereotype.Repository;

import com.mysql.jdbc.Field;


/**
 * 资讯列表
 * @author Administrator
 *
 */
@Entity
@Table(name="n_news")
@DynamicInsert
@JsonIgnoreProperties(value={"userBean"})
@Repository
public class News implements Comparable{
	private Integer id;
	private String title;
	private String summary;
	private String author;
	private String imgurl;
	private String content;
	private Integer money;
	private Integer ishot;
	private Date timestart;
	private Date timeout;
	private Integer situation = 0;
	private String suggestion ="";
	private Integer isonline = 0;
	private User userBean;
	
	public News() {
		super();
	}
	
	
	@ManyToOne(cascade=CascadeType.ALL,fetch=FetchType.EAGER)
	@JoinColumn(name="userid")
	public User getUserBean() {
		return userBean;
	}

	public void setUserBean(User userBean) {
		this.userBean = userBean;
	}



	public News(Integer id, String title, String summary, String author,
			String imgurl, String content, Integer money, Integer ishot,
			Date timestart, Date timeout, Integer situation,
			String suggestion, Integer isonline) {
		super();
		this.id = id;
		this.title = title;
		this.summary = summary;
		this.author = author;
		this.imgurl = imgurl;
		this.content = content;
		this.money = money;
		this.ishot = ishot;
		this.timestart = timestart;
		this.timeout = timeout;
		this.situation = situation;
		this.suggestion = suggestion;
		this.isonline = isonline;
	}



	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	@Column(name="title")
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	@Column(name="summary")
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}


	@Column(name="author")
	public String getAuthor() {
		return author;
	}



	public void setAuthor(String author) {
		this.author = author;
	}


	@Column(name="imgurl")
	public String getImgurl() {
		return imgurl;
	}



	public void setImgurl(String imgurl) {
		this.imgurl = imgurl;
	}


	@Column(name="content")
	public String getContent() {
		return content;
	}



	public void setContent(String content) {
		this.content = content;
	}


	@Column(name="money")
	public Integer getMoney() {
		return money;
	}



	public void setMoney(Integer money) {
		this.money = money;
	}


	@Column(name="ishot")
	public Integer getIshot() {
		return ishot;
	}



	public void setIshot(Integer ishot) {
		this.ishot = ishot;
	}


	@Column(name="timestart")
	public Date getTimestart() {
		return timestart;
	}



	public void setTimestart(Date timestart) {
		this.timestart = timestart;
	}


	@Column(name="timeout")
	public Date getTimeout() {
		return timeout;
	}



	public void setTimeout(Date timeout) {
		this.timeout = timeout;
	}


	@Column(name="situation")
	public Integer getSituation() {
		return situation;
	}



	public void setSituation(Integer situation) {
		this.situation = situation;
	}


	@Column(name="suggestion")
	public String getSuggestion() {
		return suggestion;
	}



	public void setSuggestion(String suggestion) {
		this.suggestion = suggestion;
	}


	@Column(name="isonline")
	public Integer getIsonline() {
		return isonline;
	}



	public void setIsonline(Integer isonline) {
		this.isonline = isonline;
	}


	public News(String title, String summary, String author, String imgurl,
			String content, Integer money, Integer ishot, Date timestart,
			Date timeout,User userBean) {
		super();
		this.title = title;
		this.summary = summary;
		this.author = author;
		this.imgurl = imgurl;
		this.content = content;
		this.money = money;
		this.ishot = ishot;
		this.timestart = timestart;
		this.timeout = timeout;
		this.userBean = userBean;
	}
	
	public News(String title, String summary, String author, String imgurl,
			String content, Integer money, Integer ishot, Date timestart,
			Date timeout, String suggestion, User userBean) {
		super();
		this.title = title;
		this.summary = summary;
		this.author = author;
		this.imgurl = imgurl;
		this.content = content;
		this.money = money;
		this.ishot = ishot;
		this.timestart = timestart;
		this.timeout = timeout;
		this.suggestion = suggestion;
		this.userBean = userBean;
	}


	/**
	 * 获取分页信息 
	 * @param page
	 * @param pagesize
	 * @return
	 */
	@Transient
	public Map<String , Object> GetNewsPage(Set<News> newsSet,int page,int pagesize,Map<String, String> param){
		//通过treeset由无序转为有序  
		Iterator<News> tempIterator = newsSet.iterator();
		Set<News> tempSet = new TreeSet<News>();
		while(tempIterator.hasNext()){
			tempSet.add(tempIterator.next());
		}
		Map<String, Object> map = new HashMap<String, Object>();
		if(null==param){
			Integer total = tempSet.size();
			int start = (page-1)*pagesize;
			int end = page*pagesize;
			if(end>total)
				end =total ;
			List<News> list = new ArrayList<News>();
			Iterator<News> iterator = tempSet.iterator();
			int count = 0;
			while(iterator.hasNext()){
				if(count>=start&&count<end)
					list.add(iterator.next());
				else{
					iterator.next();
				}
				count++;
			}
			map.put("total",total);
			map.put("rows",list);
			return map;
		}else{
			List<News> list = new ArrayList<News>();
			Iterator<News> iterator = tempSet.iterator();
			int count = 0;
			Set<String> keySet = param.keySet();
			String selectname = keySet.iterator().next();
			String condition = param.get(selectname);
			Class clz = News.class;
			Method method  = null;
			try {
			  method = clz.getMethod("get"+selectname.substring(0,1).toUpperCase()+selectname.substring(1,selectname.length()));
			} catch (NoSuchMethodException | SecurityException e) {
				e.printStackTrace();
			}
			while(iterator.hasNext()){
				News next = iterator.next();
				try {
					Object invoke = method.invoke(next);
					if(invoke.toString().contains(condition)){
						count++;
						list.add(next);
					}
				} catch (Exception e){
					e.printStackTrace();
				}
			}
			//分页
			int start = (page-1)*pagesize;
			int end = page*pagesize;
			if(list.size()<end)
				end = list.size();
			List<News> newslist = new ArrayList<News>();
			for(int i=start;i<end;i++){
				newslist.add(list.get(i));
			}
			
			map.put("total",count);
			map.put("rows",newslist);
			return map;
		}
	}

	/**
	 * 排序接口
	 */
	@Transient
	@Override
	public int compareTo(Object o) {
		News newsBean = (News) o;
		return this.id-newsBean.getId();
	}
}
