package com.edu.viewentity;

import java.util.ArrayList;
import java.util.List;

import com.edu.model.Advert;

/**
 * 广告显示层
 * @author kh
 *
 */
public class AdvertVO
{
	private Integer id;
	private String title;
	private String imgurl;
	private String summary;
	private Integer isonline;
	private String author;
	private Integer situation;
	private String suggestion;
	private Integer position;
	public Integer getId()
	{
		return id;
	}



	public void setId(Integer id)
	{
		this.id = id;
	}



	public String getTitle()
	{
		return title;
	}



	public void setTitle(String title)
	{
		this.title = title;
	}



	public String getImgurl()
	{
		return imgurl;
	}



	public void setImgurl(String imgurl)
	{
		this.imgurl = imgurl;
	}



	public String getSummary()
	{
		return summary;
	}



	public void setSummary(String summary)
	{
		this.summary = summary;
	}



	public Integer getIsonline()
	{
		return isonline;
	}



	public void setIsonline(Integer isonline)
	{
		this.isonline = isonline;
	}

	public AdvertVO(Integer id, String title, String imgurl, String summary,
			Integer isonline)
	{
		super();
		this.id = id;
		this.title = title;
		this.imgurl = imgurl;
		this.summary = summary;
		this.isonline = isonline;
	}

	public AdvertVO(Advert advertBean)
	{
		super();
		this.id = advertBean.getId();
		this.title = advertBean.getTitle();
		this.imgurl = advertBean.getImgurl();
		this.summary = advertBean.getSummary();
		this.isonline = advertBean.getIsonline();
		this.author = advertBean.getAuthor();
		this.situation = advertBean.getSituation();
		this.suggestion = advertBean.getSuggestion();
		this.position = advertBean.getPosition();
	}

	/**
	 * 将advertbean转换成advertbeanvo
	 * @param list
	 * @return
	 */
	public static List<AdvertVO> changeToAdvertVOs(List<Advert> list)
	{
		List<AdvertVO> results = new ArrayList<AdvertVO>();
		for(Advert advertBean:list){
			results.add(new AdvertVO(advertBean));
		}
		return results;
	}



	public String getAuthor() {
		return author;
	}



	public void setAuthor(String author) {
		this.author = author;
	}



	public Integer getSituation() {
		return situation;
	}



	public void setSituation(Integer situation) {
		this.situation = situation;
	}



	public String getSuggestion() {
		return suggestion;
	}



	public void setSuggestion(String suggestion) {
		this.suggestion = suggestion;
	}



	public Integer getPosition() {
		return position;
	}



	public void setPosition(Integer position) {
		this.position = position;
	}
}
