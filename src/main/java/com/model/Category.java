package com.model;

import java.io.Serializable;
import java.util.Collection;

import java.util.List;

import javax.persistence.Column;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@Table(name = "category")
@Entity
@Data
public class Category implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Integer id;
	
	@Column(name = "name")
	@NotBlank(message = "Nhập tên danh mục")
	private String name;
	
	@Column(name = "status")
	private Integer status;
	@OneToMany(mappedBy = "category")
	@JsonIgnore
	private List<Product> listProduct;
	
}
