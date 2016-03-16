package com.edu.model;

import java.beans.Transient;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

/**
 * 角色表
 * @author Administrator
 *
 */
@Table(name="r_role")
@Entity
public class Role {
	private Integer id;
	private String rolename;
	private Set<Function> functionBeans = new HashSet<Function>();
	public Role(Integer id, String rolename) {
		super();
		this.id = id;
		this.rolename = rolename;
	}
	
	public Role(String rolename) {
		super();
		this.rolename = rolename;
	}

	public Role() {
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
	@Column(name="rolename")
	public String getRolename() {
		return rolename;
	}
	public void setRolename(String rolename) {
		this.rolename = rolename;
	}
	
	
	public Role(Integer id, String rolename, Set<Function> functionBeans) {
		super();
		this.id = id;
		this.rolename = rolename;
		this.functionBeans = functionBeans;
	}



	@Transient
	@ManyToMany(cascade=CascadeType.PERSIST,fetch=FetchType.EAGER)
	@JoinTable(name = "rf_rolefunction",joinColumns ={@JoinColumn(name = "roleid", referencedColumnName = "id") },   
    inverseJoinColumns = { @JoinColumn(name = "functionid", referencedColumnName = "id")})  
	public Set<Function> getFunctionBeans() {
		return functionBeans;
	}



	public void setFunctionBeans(Set<Function> functionBeans) {
		this.functionBeans = functionBeans;
	}
	
	
}
