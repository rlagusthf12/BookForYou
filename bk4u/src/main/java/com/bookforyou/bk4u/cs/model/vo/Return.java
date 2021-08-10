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
public class Return {
	private int returnNo;
	private int orderNo;
	private String returnReason;
	private Date returnDate;
	private String status;
	private String adminMemo;
	private String memId;
	private String memName;
	private String payWay;
	private int price;
	private String bkTitle;
	private String deliveryMsg;
	private String orderPriceComma;
}
