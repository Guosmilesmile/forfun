package com.edu.viewentity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.edu.model.Product;

/**
 * 商品显示层
 * @author Gy
 *
 */
public class ProductVO {
	private Integer id;
	private String name;
	private String imgurl;//封面图片
	private Double initmoney;
	private Integer authorid;
	private String artistuserid;
	private String authorname;
	private Date timestart;
	private Date timeout;
	private String content;
	private Double money;
	private String imgone;//图片1地址
	private String imgtwo;//图片2地址
	private String imgthree;//图片3地址
	private Integer situation;//状态  0：未上架   1：上架中  2：已下架  3：已出售
	private Integer methodid;//出售方式id
	private String methodname;//出售方式名称
	private Integer typeid;//分类id
	private String typename;//分类名称
	private Integer addmoney = 0;
	public ProductVO(Product productBean) {
		super();
		this.id = productBean.getId();
		this.name = productBean.getName();
		this.imgurl = productBean.getImgurl();
		this.initmoney = productBean.getMoney();
		this.authorid = productBean.getArtistBean().getId();
		this.authorname = productBean.getArtistBean().getUsername();
		this.timestart = productBean.getTimestart();
		this.timeout = productBean.getTimeout();
		this.content = productBean.getContent();
		this.imgone = productBean.getImgone();
		this.imgtwo = productBean.getImgtwo();
		this.imgthree = productBean.getImgthree();
		this.situation = productBean.getSituation();
		this.methodid  = productBean.getProductSellBean().getSellMethodBean().getId();
		this.methodname = productBean.getProductSellBean().getSellMethodBean().getName();
		this.typeid = productBean.getProductTypeBean().getId();
		this.typename = productBean.getProductTypeBean().getName();
		this.artistuserid = productBean.getArtistBean().getUserid();
		this.money = productBean.getMoney();
		
	}
	public Double getMoney() {
		return money;
	}
	public void setMoney(Double money) {
		this.money = money;
	}
	public String getArtistuserid() {
		return artistuserid;
	}
	public void setArtistuserid(String artistuserid) {
		this.artistuserid = artistuserid;
	}
	public Integer getAddmoney() {
		return addmoney;
	}
	public void setAddmoney(Integer addmoney) {
		this.addmoney = addmoney;
	}
	/**
	 * 将list中的productbean实体转变为productvo
	 * @param list
	 * @return
	 */
	public static List<ProductVO> ChangeListProductToProductVo(List<Product> list ){
		List<ProductVO> productVOs = new ArrayList<ProductVO>();
		for(int i=0;i<list.size();i++){
			ProductVO productVO = new ProductVO(list.get(i));
			productVOs.add(productVO);
		}
		return productVOs;
	}
	
	public ProductVO(Integer id, String name, String imgurl, Double initmoney,
			Integer authorid, String authorname, Date timestart, Date timeout,
			String content, String imgone, String imgtwo, String imgthree,
			Integer situation, Integer methodid, String methodname,
			Integer typeid, String typename) {
		super();
		this.id = id;
		this.name = name;
		this.imgurl = imgurl;
		this.initmoney = initmoney;
		this.authorid = authorid;
		this.authorname = authorname;
		this.timestart = timestart;
		this.timeout = timeout;
		this.content = content;
		this.imgone = imgone;
		this.imgtwo = imgtwo;
		this.imgthree = imgthree;
		this.situation = situation;
		this.methodid = methodid;
		this.methodname = methodname;
		this.typeid = typeid;
		this.typename = typename;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImgurl() {
		return imgurl;
	}
	public void setImgurl(String imgurl) {
		this.imgurl = imgurl;
	}
	public Double getInitmoney() {
		return initmoney;
	}
	public void setInitmoney(Double initmoney) {
		this.initmoney = initmoney;
	}
	public Integer getAuthorid() {
		return authorid;
	}
	public void setAuthorid(Integer authorid) {
		this.authorid = authorid;
	}
	public String getAuthorname() {
		return authorname;
	}
	public void setAuthorname(String authorname) {
		this.authorname = authorname;
	}
	public Date getTimestart() {
		return timestart;
	}
	public void setTimestart(Date timestart) {
		this.timestart = timestart;
	}
	public Date getTimeout() {
		return timeout;
	}
	public void setTimeout(Date timeout) {
		this.timeout = timeout;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImgone() {
		return imgone;
	}
	public void setImgone(String imgone) {
		this.imgone = imgone;
	}
	public String getImgtwo() {
		return imgtwo;
	}
	public void setImgtwo(String imgtwo) {
		this.imgtwo = imgtwo;
	}
	public String getImgthree() {
		return imgthree;
	}
	public void setImgthree(String imgthree) {
		this.imgthree = imgthree;
	}
	public Integer getSituation() {
		return situation;
	}
	public void setSituation(Integer situation) {
		this.situation = situation;
	}
	public ProductVO() {
		super();
	}
	public Integer getMethodid() {
		return methodid;
	}
	public void setMethodid(Integer methodid) {
		this.methodid = methodid;
	}
	public String getMethodname() {
		return methodname;
	}
	public void setMethodname(String methodname) {
		this.methodname = methodname;
	}
	public Integer getTypeid() {
		return typeid;
	}
	public void setTypeid(Integer typeid) {
		this.typeid = typeid;
	}
	public String getTypename() {
		return typename;
	}
	public void setTypename(String typename) {
		this.typename = typename;
	}
	
	
}
