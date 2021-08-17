package com.bookforyou.bk4u.subscription.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter @Setter
@ToString
public class Subscription {
	
	private int subscNo;
	private int memNo;
	private int payNo;
	private int couponIssueNo;
	private String subscName;
	private String subscPeriod;
	private String subscPrice;
	private String subscSdate;
	private String subscEndDate;
	private int subscDelDate;
	private String subscStatus;
	private String subscReceiver;
	private String subscPost;
	private String subscAddress;
	private String addressDetail;
	private String addressRef;
	private int subscPhone;
	private String deliveryRequest;
	private String adminMemo;
	private String memName;
	private String memId;
	private String memPhone;
	private String memEmail;
	private String payStatus;
	private String shippingDate;
	private String shippingCompany;
	private String shippingNumber;
	private String shippingStatus;
	private String bkTitle;
}
