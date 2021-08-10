package com.bookforyou.bk4u.cs.model.vo;

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
public class Refund {
	private int refundNo;
	private int orderNo;
	private String status;
	private Date refundDate;
	private String adminMemo;
	private String refundKind;
	private int kindNo;
	private int refundPrice;
	private int refundPoint;
	private int memNo;
	private String memId;
	private String memName;
	private String payWay;
	private int price;
	private String bkTitle;
	private String deliveryMsg;
	private int refundCoupon;
}
