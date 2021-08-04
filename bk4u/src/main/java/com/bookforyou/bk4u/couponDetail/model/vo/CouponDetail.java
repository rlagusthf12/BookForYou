package com.bookforyou.bk4u.couponDetail.model.vo;

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
public class CouponDetail {
	private String couponNo;
	private String couponName;
	private String couponKind;
	private String couponContent;
	private int couponPrice;
	private int couponPriceRate;
	private Date couponStartDate;
	private Date couponEndDate;
	private String couponIssueNum;
	private Date useDate;
}
