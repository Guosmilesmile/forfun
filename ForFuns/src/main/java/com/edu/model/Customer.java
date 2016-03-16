/**
 * 
 */
package com.edu.model;

import java.beans.Transient;
import java.util.HashSet;
import java.util.Set;

import javax.management.relation.Role;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

/**
 * 用户实体
 * @author Administrator
 *
 */
@Table(name = "c_customer")
@Entity
public class Customer {
	private Integer id;
	private String userid;
	private String username;
	private String password;
	private String personnumber;
	private String telphone;
	private String realname;
	private String avator;
	private Integer isartist;
	private Double balance;
	private Set<CustomerAddress> customerAddressBeans;

	public Customer() {
		super();
	}
	@Column(name = "balance")
	public Double getBalance() {
		return balance;
	}
	public void setBalance(Double balance) {
		this.balance = balance;
	}

	public Customer(Integer id, String userid, String username, String password, String personnumber, String telphone,
			String realname, String avator, Integer isartist) {
		super();
		this.id = id;
		this.userid = userid;
		this.username = username;
		this.password = password;
		this.personnumber = personnumber;
		this.telphone = telphone;
		this.realname = realname;
		this.avator = avator;
		this.isartist = isartist;

	}

	public Customer(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}

	public Customer(int id, String username, String password) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
	}

	public Customer(String userid, String username, String password, String personnumber, String telphone,
			String realname, String avator, Integer isartist) {
		super();
		this.userid = userid;
		this.username = username;
		this.password = password;
		this.personnumber = personnumber;
		this.telphone = telphone;
		this.realname = realname;
		this.avator = avator;
		this.isartist = isartist;
	}
	
	@Override
	public String toString() {
		return "CustomerBean [id=" + id + ", userid=" + userid + ", username=" + username + ", password=" + password
				+ ", personnumber=" + personnumber + ", telphone=" + telphone + ", realname=" + realname + ", avator="
				+ avator + ", isartist=" + isartist + " balance="+balance+"]";
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

	@Column(name = "userid")
	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	@Column(name = "username")
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Column(name = "password")
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "personnumber")
	public String getPersonnumber() {
		return personnumber;
	}

	public void setPersonnumber(String personnumber) {
		this.personnumber = personnumber;
	}

	@Column(name = "telphone")
	public String getTelphone() {
		return telphone;
	}

	public void setTelphone(String telphone) {
		this.telphone = telphone;
	}

	@Column(name = "realname")
	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	@Column(name = "avator")
	public String getAvator() {
		return avator;
	}

	public void setAvator(String avator) {
		this.avator = avator;
	}

	@Column(name = "isartist")
	public Integer getIsartist() {
		return isartist;
	}

	public void setIsartist(Integer isartist) {
		this.isartist = isartist;
	}

	@OneToMany(mappedBy = "customerBean")
	public Set<CustomerAddress> getCustomerAddressBeans() {
		return customerAddressBeans;
	}

	public void setCustomerAddressBeans(Set<CustomerAddress> customerAddressBeans) {
		this.customerAddressBeans = customerAddressBeans;
	}

	public Customer(Integer id, String userid, String username, String password, String personnumber, String telphone,
			String realname, String avator, Integer isartist, Set<CustomerAddress> customerAddressBeans) {
		super();
		this.id = id;
		this.userid = userid;
		this.username = username;
		this.password = password;
		this.personnumber = personnumber;
		this.telphone = telphone;
		this.realname = realname;
		this.avator = avator;
		this.isartist = isartist;
		this.customerAddressBeans = customerAddressBeans;
	}

}