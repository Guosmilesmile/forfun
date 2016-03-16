package com.edu.model;

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
import javax.persistence.Table;

/**
 * 商品价位变动表
 * @author Gy
 *
 */
@Table(name="pm_productmoney")
@Entity
public class ProductMoney{
	private Integer id;
	private Product productBean;
	private Customer customerBean;
	private Double money;
	private Date currenttime;
	
	public ProductMoney(Product productBean, Customer customerBean,
			Double money, Date currenttime) {
		super();
		this.productBean = productBean;
		this.customerBean = customerBean;
		this.money = money;
		this.currenttime = currenttime;
	}
	public ProductMoney(Integer id, Product productBean,
			Customer customerBean, Double money, Date currenttime) {
		super();
		this.id = id;
		this.productBean = productBean;
		this.customerBean = customerBean;
		this.money = money;
		this.currenttime = currenttime;
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
	@ManyToOne(cascade=CascadeType.ALL,fetch=FetchType.EAGER)
	@JoinColumn(name="productid")
	public Product getProductBean() {
		return productBean;
	}
	public void setProductBean(Product productBean) {
		this.productBean = productBean;
	}
	@ManyToOne(cascade=CascadeType.ALL,fetch=FetchType.EAGER)
	@JoinColumn(name="customerid")
	public Customer getCustomerBean() {
		return customerBean;
	}
	public void setCustomerBean(Customer customerBean) {
		this.customerBean = customerBean;
	}
	@Column(name="money")
	public Double getMoney() {
		return money;
	}
	public void setMoney(Double money) {
		this.money = money;
	}
	public ProductMoney() {
		super();
	}
	@Column(name="currenttime")
	public Date getCurrenttime() {
		return currenttime;
	}
	public void setCurrenttime(Date currenttime) {
		this.currenttime = currenttime;
	}
	
}
