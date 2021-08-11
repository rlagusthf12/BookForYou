package com.bookforyou.bk4u.payment.model.vo;

import java.sql.Date;
import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter @Getter
@ToString
public class Payment {
	private int payNo;
	private String payWay;
	private int price;
	private String status;
	private Date payDate;
	private int deposit;
	private String depositName;
	private String depositBank;
	
	ArrayList<Payment> paymentList;
}
