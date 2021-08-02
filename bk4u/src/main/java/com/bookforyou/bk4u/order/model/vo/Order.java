package com.bookforyou.bk4u.order.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter @Getter
@ToString
public class Order {
	public int orderNo;
	public int memNo;
	public String memName;
	public String memId;
	public String bkTitle;
	public String payWay;
	public int payNo;
	public Date orderDate;
	public String orderReceiver;
	public String orderPost;
	public String orderAddress;
	public String AddressDetail;
	public String addressRef;
	public String orderPhone;
	public String deliveryMsg;
	public int orderPrice;
	public int addPrice;
	public int usedPoints;
	public String orderStatus;
	public String payStatus;
	public String csStatus;
	public String adminMemo;
	public String productStatus;
	public String deliveryCompany;
	public String shippingNumber;
	public Date shippingDate;
	public String deliveryStatus;
	public int couponIssueNum;
	public int detailPrice;
	public int couponPrice;
	public int couponPriceRate;
}
