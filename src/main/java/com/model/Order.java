package com.model;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.Data;
@Entity
@Data
@Table(name="order")
public class Order implements Serializable{
	 /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	    @Column(name = "order_id")
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private int orderId;
	    @ManyToOne(fetch = FetchType.LAZY)
	    @JoinColumn(name = "user_id")
	    private User user;
//	    @OneToMany
//	    private List<OrderDetail> orderDetail;
	    @Column(name="name")
	    private String name;
	    @Column(name="email")
	    private String email;
	    @Column(name="phone")
	    private String phone;
	    @Column(name="address")
	    private String address;
	    @Column(name="created")
	    private Date created;
	    
}
