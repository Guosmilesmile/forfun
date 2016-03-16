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

/**
 * 用户与地址关联中间表
 * @author Administrator
 *
 */
@Entity
@Table(name="ca_customeraddress")
public class CustomerAddress {
	private Integer id;
	private Customer customerBean;
	private Address addressBean;
	public CustomerAddress(Integer id, Customer customerBean,
			Address addressBean) {
		super();
		this.id = id;
		this.customerBean = customerBean;
		this.addressBean = addressBean;
	}
	public CustomerAddress() {
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
	@ManyToOne(cascade=CascadeType.ALL,fetch=FetchType.EAGER)
	@JoinColumn(name="customerid")
	public Customer getCustomerBean() {
		return customerBean;
	}
	public void setCustomerBean(Customer customerBean) {
		this.customerBean = customerBean;
	}
	@OneToOne(cascade=CascadeType.ALL,fetch=FetchType.EAGER)
	@JoinColumn(name="addressid")
	public Address getAddressBean() {
		return addressBean;
	}
	
	public void setAddressBean(Address addressBean) {
		this.addressBean = addressBean;
	}
}
