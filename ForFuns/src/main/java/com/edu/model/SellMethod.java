package com.edu.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 出售方式
 * @author Gy
 *
 */
@Entity
@Table(name="sm_sellmethod")
public class SellMethod {
	private Integer id;
	private String name;
	public SellMethod(Integer id, String name) {
		super();
		this.id = id;
		this.name = name;
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
	@Column(name = "name")
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public SellMethod() {
		super();
	}
	
}
