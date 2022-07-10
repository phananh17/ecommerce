package com.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="reicept_item")
public class ReceiptItem implements Serializable{
/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
@Id
@GeneratedValue
private long reiceptitemId;
@ManyToOne
@JoinColumn(name="productId")
private Product product;
@Column(name="receiptItemQuantity")
private int receiptItemQuantity;
@Column(name="receiptItemPrice")
private double receiptItemPrice;
@Column(name="receiptItemSale")
private int receiptItemSale;
@Column(name="receiptItemStatus")
private boolean receiptItemStatus;

public ReceiptItem(long reiceptitemId, Product product, int receiptItemQuantity, double receiptItemPrice,
		int receiptItemSale, boolean receiptItemStatus) {
	super();
	this.reiceptitemId = reiceptitemId;
	this.product = product;
	this.receiptItemQuantity = receiptItemQuantity;
	this.receiptItemPrice = receiptItemPrice;
	this.receiptItemSale = receiptItemSale;
	this.receiptItemStatus = receiptItemStatus;
}
public long getReiceptitemId() {
	return reiceptitemId;
}
public void setReiceptitemId(long reiceptitemId) {
	this.reiceptitemId = reiceptitemId;
}
public Product getProduct() {
	return product;
}
public void setProduct(Product product) {
	this.product = product;
}
public int getReceiptItemQuantity() {
	return receiptItemQuantity;
}
public void setReceiptItemQuantity(int receiptItemQuantity) {
	this.receiptItemQuantity = receiptItemQuantity;
}
public double getReceiptItemPrice() {
	return receiptItemPrice;
}
public void setReceiptItemPrice(double receiptItemPrice) {
	this.receiptItemPrice = receiptItemPrice;
}
public int getReceiptItemSale() {
	return receiptItemSale;
}
public void setReceiptItemSale(int receiptItemSale) {
	this.receiptItemSale = receiptItemSale;
}
public boolean isReceiptItemStatus() {
	return receiptItemStatus;
}
public void setReceiptItemStatus(boolean receiptItemStatus) {
	this.receiptItemStatus = receiptItemStatus;
}


}
