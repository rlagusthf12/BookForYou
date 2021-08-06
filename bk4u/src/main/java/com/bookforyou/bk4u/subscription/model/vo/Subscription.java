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
	
	public int subscNo;
	public int memNo;
	public int payNo;
	public int couponIssueNo;
	public String subscName;
	public String subscPeriod;
	public String subscPrice;
	public Date subscSdate;
	public String subscEndDate;
	public int subscDelDate;
	public String subscStatus;
	public String subscReceiver;
	public String subscPost;
	public String subscAddress;
	public String addressRetail;
	public String addressRef;
	public int subscPhone;
	public String deliveryRequest;
	public String adminMemo;
	public String memName;
	public String memId;
	public String payStatus;
}
