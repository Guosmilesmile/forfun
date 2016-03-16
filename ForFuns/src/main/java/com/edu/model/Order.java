package com.edu.model;

import java.util.Date;

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
 * 订单列表
 * @author Administrator
 *
 */
@Table(name="o_order")
@Entity
public class Order {
	private Integer id;
	private Date current;
	private Integer ispay;
	private Double money;
	private Product productBean;
	private Customer customerBean;
	private OrderAddress orderAddressBean;

	public Order(Integer id, Date current, Integer ispay,
			Product productBean, Customer customerBean,
			OrderAddress orderAddressBean) {
		super();
		this.id = id;
		this.current = current;
		this.ispay = ispay;
		this.productBean = productBean;
		this.customerBean = customerBean;
		this.orderAddressBean = orderAddressBean;
	}
	public Order() {
		super();
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
	@Column(name="current")
	public Date getCurrent() {
		return current;
	}
	public void setCurrent(Date current) {
		this.current = current;
	}
	@OneToOne(fetch=FetchType.LAZY)  
    @JoinColumn(name="productid") 
	public Product getProductBean() {
		return productBean;
	}
	public void setProductBean(Product productBean) {
		this.productBean = productBean;
	}
	@OneToOne(fetch=FetchType.EAGER)  
    @JoinColumn(name="customerid") 
	public Customer getCustomerBean() {
		return customerBean;
	}
	public void setCustomerBean(Customer customerBean) {
		this.customerBean = customerBean;
	}
	@Column(name="ispay")
	public Integer getIspay() {
		return ispay;
	}
	public void setIspay(Integer ispay) {
		this.ispay = ispay;
	}
	@OneToOne(mappedBy="orderBean")
	public OrderAddress getOrderAddressBean() {
		return orderAddressBean;
	}

	public void setOrderAddressBean(OrderAddress orderAddressBean) {
		this.orderAddressBean = orderAddressBean;
	}
	@Column(name="money")
	public Double getMoney() {
		return money;
	}
	public void setMoney(Double money) {
		this.money = money;
	}
	
	
}
