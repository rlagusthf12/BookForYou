package com.bookforyou.bk4u.coupon.model.vo;

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
public class Coupon {
	public String couponNo;
	public String couponName;
	public String couponKind;
	public String couponContent;
	public int couponPrice;
	public int couponPriceRate;
	public Date couponStartDate;
	public Date couponEndDate;
	public String couponIssueNum;
	public Date useDate;
}
