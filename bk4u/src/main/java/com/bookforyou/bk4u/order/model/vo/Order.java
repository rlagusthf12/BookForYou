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
	private int orderNo;
	private int memNo;
	private String memName;
	private String memId;
	private String bkTitle;
	private String payWay;
	private int payNo;
	private Date orderDate;
	private String orderReceiver;
	private String orderPost;
	private String orderAddress;
	private String AddressDetail;
	private String addressRef;
	private String orderPhone;
	private String deliveryMsg;
	private int orderPrice;
	private int addPrice;
	private int usedPoints;
	private String orderStatus;
	private String payStatus;
	private String csStatus;
	private String adminMemo;
	private String productStatus;
	private String deliveryCompany;
	private String shippingNumber;
	private Date shippingDate;
	private String deliveryStatus;
	private int couponIssueNum;
	private int detailPrice;
	private int couponPrice;
	private int couponPriceRate;
	private String orderPriceComma;
}
