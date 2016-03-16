package com.edu.model;

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

import org.codehaus.jackson.annotate.JsonIgnoreProperties;


/**
 * 商品出售方式表
 * @author Gy
 *
 */
@Table(name="ps_productsell")
@Entity
@JsonIgnoreProperties(value="productBean")
public class ProductSell {
	private Integer id;
	private Product productBean;
	private SellMethod sellMethodBean;
	
	
	public ProductSell(Integer id, Product productBean,
			SellMethod sellMethodBean) {
		super();
		this.id = id;
		this.productBean = productBean;
		this.sellMethodBean = sellMethodBean;
	}
	public ProductSell() {
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
	@OneToOne(fetch=FetchType.LAZY)  
    @JoinColumn(name="productid") 
	public Product getProductBean() {
		return productBean;
	}
	
	public void setProductBean(Product productBean) {
		this.productBean = productBean;
	}
	@ManyToOne(cascade=CascadeType.ALL,fetch=FetchType.EAGER)
	@JoinColumn(name="sellmethodid")
	public SellMethod getSellMethodBean() {
		return sellMethodBean;
	}
	public void setSellMethodBean(SellMethod sellMethodBean) {
		this.sellMethodBean = sellMethodBean;
	}
}
