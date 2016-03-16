package com.edu.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 权限列表
 * @author Administrator
 *
 */
@Entity
@Table(name="f_function")
public class Function {
	private Integer id;
	private String functionname;
	private String functionlink;
	private Integer istopmenu;
	private Integer topmenu;
	
	public Function() {
		super();
	}
	public Function(String functionname, String functionlink,
			Integer istopmenu, Integer topmenu) {
		super();
		this.functionname = functionname;
		this.functionlink = functionlink;
		this.istopmenu = istopmenu;
		this.topmenu = topmenu;
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
	@Column(name="functionname")
	public String getFunctionname() {
		return functionname;
	}
	public void setFunctionname(String functionname) {
		this.functionname = functionname;
	}
	@Column(name="functionlink")
	public String getFunctionlink() {
		return functionlink;
	}
	public void setFunctionlink(String functionlink) {
		this.functionlink = functionlink;
	}
	public Function(String functionname, String functionlink) {
		super();
		this.functionname = functionname;
		this.functionlink = functionlink;
	}
	@Column(name="istopmenu")
	public Integer getIstopmenu() {
		return istopmenu;
	}
	public void setIstopmenu(Integer istopmenu) {
		this.istopmenu = istopmenu;
	}
	@Column(name="topmenu")
	public Integer getTopmenu() {
		return topmenu;
	}
	public void setTopmenu(Integer topmenu) {
		this.topmenu = topmenu;
	}
	public Function(Integer id, String functionname, String functionlink,
			Integer istopmenu, Integer topmenu) {
		super();
		this.id = id;
		this.functionname = functionname;
		this.functionlink = functionlink;
		this.istopmenu = istopmenu;
		this.topmenu = topmenu;
	}
	
	
}
