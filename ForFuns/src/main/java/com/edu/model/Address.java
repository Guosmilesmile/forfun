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
import javax.persistence.Table;

/**
 * 地址列表
 * @author Administrator
 *
 */
@Table(name="ad_address")
@Entity
public class Address
{
	private Integer id;
	private String address;
	private String telephone;
	private String receiver;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	public Integer getId()
	{
		return id;
	}
	public void setId(Integer id)
	{
		this.id = id;
	}
	
	@Column(name="address")
	public String getAddress()
	{
		return address;
	}
	public void setAddress(String address)
	{
		this.address = address;
	}
	
	@Column(name="telephone")
	public String getTelephone()
	{
		return telephone;
	}
	public void setTelephone(String telephone)
	{
		this.telephone = telephone;
	}
	
	
	@Column(name="receiver")
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public Address() {
		super();
	}
	public Address(Integer id, String address, String telephone, String receiver) 
	{
		super();
		this.id = id;
		this.address = address;
		this.telephone = telephone;
		this.receiver = receiver;
	}
	public Address(String address, String telephone, String receiver)
	{
		super();
		this.address = address;
		this.telephone = telephone;
		this.receiver = receiver;
	}
}
