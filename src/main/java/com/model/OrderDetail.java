package com.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Data
@Table(name="orderdetail")
public class OrderDetail {
	private static final long serialVersionUID = 1L;
	@Id
    @Column(name="orderdetailno")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int orderDetailsNo;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "order_id", referencedColumnName = "order_id")
    private Order order;
//    @ManyToOne(fetch = FetchType.LAZY)
//    @JoinColumn(name = "product_id", referencedColumnName = "id")
    private long productID;
    @Column(name="quantity")
    private int quantity;
    @Column(name="subtotal")
    private double subTotal;
}
