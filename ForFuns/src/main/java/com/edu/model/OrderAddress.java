package com.edu.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Entity;

import org.hibernate.annotations.Cascade;

/**
 * 订单地址关联表
 * @author Administrator
 *
 */
@Entity
@Table(name="oa_orderaddress")
public class OrderAddress {
	private Integer id;
	private Order orderBean;
	private Address addressBean;
	public OrderAddress(Integer id, Order orderBean, Address addressBean) {
		super();
		this.id = id;
		this.orderBean = orderBean;
		this.addressBean = addressBean;
	}
	public OrderAddress() {
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
	@OneToOne(cascade=CascadeType.ALL,fetch=FetchType.EAGER)
	@JoinColumn(name="orderid")
	public Order getOrderBean() {
		return orderBean;
	}
	public void setOrderBean(Order orderBean) {
		this.orderBean = orderBean;
	}
	@ManyToOne(cascade=CascadeType.ALL,fetch=FetchType.EAGER)
	@JoinColumn(name="addressid")
	public Address getAddressBean() {
		return addressBean;
	}
	public void setAddressBean(Address addressBean) {
		this.addressBean = addressBean;
	}
	
}
