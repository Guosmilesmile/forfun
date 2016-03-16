/**
 * 
 */
package com.edu.model;

import java.beans.Transient;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

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
 * 管理员表
 * @author Administrator
 *
 */
@Table(name="u_user")
@Entity
public class User {
	private Integer id;
	private String username;
	private String password;
	private Set<Role> roleBeans = new HashSet<Role>();
	//private Set<NewsBean> newsBeans = new HashSet<NewsBean>();
	//private Set<AdvertBean> advertBeans = new HashSet<AdvertBean>();
	
	/*@Transient
	@OneToMany(mappedBy="userBean",fetch=FetchType.EAGER,cascade=CascadeType.ALL)
	public Set<AdvertBean> getAdvertBeans() {
		return advertBeans;
	}

	public void setAdvertBeans(Set<AdvertBean> advertBeans) {
		this.advertBeans = advertBeans;
	}
*/
	/*@Transient
	@OneToMany(mappedBy="userBean",fetch=FetchType.EAGER,cascade=CascadeType.ALL)
	public Set<NewsBean> getNewsBeans() {
		return newsBeans;
	}
	
	public void setNewsBeans(Set<NewsBean> newsBeans) {
		this.newsBeans = newsBeans;
	}
*/
	@Transient
	@ManyToMany(cascade=CascadeType.PERSIST,fetch=FetchType.EAGER)
	@JoinTable(name = "ur_userrole",joinColumns ={@JoinColumn(name = "userid", referencedColumnName = "id") },   
    inverseJoinColumns = { @JoinColumn(name = "roleid", referencedColumnName = "id")})  
	public Set<Role> getRoleBeans() {
		return roleBeans;
	}

	public void setRoleBeans(Set<Role> roleBeans) {
		this.roleBeans = roleBeans;
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


	@Override
	public String toString() {
		return "User [ \nid : " + this.id + "\nusername : " + this.username
				+ "\npassword : " + this.password + "\n]";
	}

	public User() {
		super();
	}

	public User(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}

	public User(Integer id, String username, String password) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
	}

	@Transient
	public List<Function> GetPowers(){
		List<Function> list = new ArrayList<Function>();
		for(Role roleBean:this.getRoleBeans()){
			for(Function functionBean : roleBean.getFunctionBeans()){
				list.add(functionBean);
			}
		}
		Collections.sort(list,new Comparator<Function>() {
			@Override
			public int compare(Function o1, Function o2) {
				return o1.getId().compareTo(o2.getId());
			}
		});
		return list;
	}
	
}
