package com.edu.viewentity;

import java.util.ArrayList;
import java.util.List;

import com.edu.model.Artist;
import com.edu.model.Customer;
/**
 * 用户显示层
 * @author Administrator
 *
 */
public class CustomerVO {
	private Integer id;
	private String userid;
	private String name;
	private String avator;
	private String telephone;
	private String personnumber;
	private String realname;
	private Integer isartist;
	private Double balance;
	
	public CustomerVO(Integer id, String name, String avator) {
		super();
		this.id = id;
		this.name = name;
		this.avator = avator;
	}
	public CustomerVO(Customer customerBean) {
		super();
		this.id = customerBean.getId();
		this.name = customerBean.getUsername();
		this.avator = customerBean.getAvator();
		this.userid = customerBean.getUserid();
		this.telephone = customerBean.getTelphone();
		this.personnumber = customerBean.getPersonnumber();
		this.isartist = customerBean.getIsartist();
		this.realname = customerBean.getRealname();
		this.balance=customerBean.getBalance();
	}
	
	public CustomerVO(Artist customerBean) {
		super();
		this.id = customerBean.getId();
		this.name = customerBean.getUsername();
		this.avator = customerBean.getAvator();
		this.userid = customerBean.getUserid();
		this.telephone = customerBean.getTelphone();
		this.personnumber = customerBean.getPersonnumber();
		this.isartist = 1;
		this.realname = customerBean.getRealname();
	}
	
	public CustomerVO(Integer id, String userid, String name, String avator,
			String telephone, String personnumber, String realname,
			Integer isartist) {
		super();
		this.id = id;
		this.userid = userid;
		this.name = name;
		this.avator = avator;
		this.telephone = telephone;
		this.personnumber = personnumber;
		this.realname = realname;
		this.isartist = isartist;
	}
	public static List<CustomerVO> ChangeToList(List<Customer> temp){
		List<CustomerVO> list = new ArrayList<CustomerVO>();
		if(temp.size()==0||null==temp){
			return list;
		}
		for(Customer customerBean : temp){
			list.add(new CustomerVO(customerBean));
		}
		return list;
	}
	
	public static List<CustomerVO> ChangeArtistToList(List<Artist> temp){
		List<CustomerVO> list = new ArrayList<CustomerVO>();
		if(temp.size()==0||null==temp){
			return list;
		}
		for(Artist customerBean : temp){
			list.add(new CustomerVO(customerBean));
		}
		return list;
	}
	
	public CustomerVO() {
		super();
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
	public String getAvator() {
		return avator;
	}
	public void setAvator(String avator) {
		this.avator = avator;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getPersonnumber() {
		return personnumber;
	}
	public void setPersonnumber(String personnumber) {
		this.personnumber = personnumber;
	}
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public Integer getIsartist() {
		return isartist;
	}
	public void setIsartist(Integer isartist) {
		this.isartist = isartist;
	}
	public Double getBalance() {
		return balance;
	}
	public void setBalance(Double balance) {
		this.balance = balance;
	}
	
}
