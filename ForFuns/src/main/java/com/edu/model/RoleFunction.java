package com.edu.model;

import java.beans.Transient;

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
 * 角色权限关联表
 * @author Administrator
 *
 */
@Entity
@Table(name="rf_rolefunction")
public class RoleFunction {
	private Integer id;
	private Role role;
	private Function function;
	public RoleFunction(Integer id, Role role, Function function) {
		super();
		this.id = id;
		this.role = role;
		this.function = function;
	}
	public RoleFunction() {
		super();
	}
	public RoleFunction(Role role, Function function) {
		super();
		this.role = role;
		this.function = function;
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
	@JoinColumn(name="roleid")
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}
	@ManyToOne(cascade=CascadeType.ALL,fetch=FetchType.EAGER)
	@JoinColumn(name="functionid")
	public Function getFunction() {
		return function;
	}
	public void setFunction(Function function) {
		this.function = function;
	}
	
	
}
