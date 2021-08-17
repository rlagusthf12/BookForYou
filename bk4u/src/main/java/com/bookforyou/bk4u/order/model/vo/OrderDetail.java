package com.bookforyou.bk4u.order.model.vo;

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
public class OrderDetail {
	private int orderNo;
	private int bkNo;
	private int quantity;
	private int detailPrice;
	private String detailStatus;
	private String bkTitle;
	private String bkPublish;
	private String writerName;
	private int gradeStar;
	
	private ArrayList<OrderDetail> odList;
}
