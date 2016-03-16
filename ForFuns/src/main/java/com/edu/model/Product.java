package com.edu.model;

import java.beans.Transient;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;


/**
 * 商品表
 * @author Gy
 *
 */
@Table(name="p_product")
@Entity
public class Product {
	private Integer id;
	private String name;
	private String imgurl;
	private Double money;
	private Date timestart;
	private Date timeout;
	private String content;
	private String imgone;//图片1地址
	private String imgtwo;//图片2地址
	private String imgthree;//图片3地址
	private Integer situation;//状态  0：未上架   1：上架中  2：已下架  3：已出售
	private Artist artistBean;
	private ProductType productTypeBean;
	private ProductSell productSellBean;
	@Transient
	@OneToOne( cascade = CascadeType.ALL, mappedBy = "productBean")
	public ProductSell getProductSellBean() {
		return productSellBean;
	}
	public void setProductSellBean(ProductSell productSellBean) {
		this.productSellBean = productSellBean;
	}
	public Product(Integer id, String name, String imgurl, Double money,
			Date timestart, Date timeout, String content, String imgone,
			String imgtwo, String imgthree, Integer situation,
			Artist artistBean, ProductType productTypeBean,
			ProductSell productSellBean) {
		super();
		this.id = id;
		this.name = name;
		this.imgurl = imgurl;
		this.money = money;
		this.timestart = timestart;
		this.timeout = timeout;
		this.content = content;
		this.imgone = imgone;
		this.imgtwo = imgtwo;
		this.imgthree = imgthree;
		this.situation = situation;
		this.artistBean = artistBean;
		this.productTypeBean = productTypeBean;
		this.productSellBean = productSellBean;
	}
	public Product() {
		super();
	}
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	@Column(name = "name")
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Column(name = "imgurl")
	public String getImgurl() {
		return imgurl;
	}
	public void setImgurl(String imgurl) {
		this.imgurl = imgurl;
	}
	@Column(name = "money")
	public Double getMoney() {
		return money;
	}
	public void setMoney(Double money) {
		this.money = money;
	}
	@Column(name = "timestart")
	public Date getTimestart() {
		return timestart;
	}
	public void setTimestart(Date timestart) {
		this.timestart = timestart;
	}
	@Column(name = "timeout")
	public Date getTimeout() {
		return timeout;
	}
	public void setTimeout(Date timeout) {
		this.timeout = timeout;
	}
	@Column(name = "content")
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Column(name = "imgone")
	public String getImgone() {
		return imgone;
	}
	public void setImgone(String imgone) {
		this.imgone = imgone;
	}
	@Column(name = "imgtwo")
	public String getImgtwo() {
		return imgtwo;
	}
	public void setImgtwo(String imgtwo) {
		this.imgtwo = imgtwo;
	}
	@Column(name = "imgthree")
	public String getImgthree() {
		return imgthree;
	}
	public void setImgthree(String imgthree) {
		this.imgthree = imgthree;
	}
	@Column(name = "situation")
	public Integer getSituation() {
		return situation;
	}
	public void setSituation(Integer situation) {
		this.situation = situation;
	}
	@ManyToOne(cascade=CascadeType.ALL,fetch=FetchType.EAGER)
	@JoinColumn(name="artistid")
	public Artist getArtistBean() {
		return artistBean;
	}
	public void setArtistBean(Artist artistBean) {
		this.artistBean = artistBean;
	}
	@ManyToOne(cascade=CascadeType.ALL,fetch=FetchType.EAGER)
	@JoinColumn(name="typeid")
	public ProductType getProductTypeBean() {
		return productTypeBean;
	}
	public void setProductTypeBean(ProductType productTypeBean) {
		this.productTypeBean = productTypeBean;
	}
	
}
