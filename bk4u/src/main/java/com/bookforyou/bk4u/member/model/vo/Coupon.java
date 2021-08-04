package com.bookforyou.bk4u.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class Coupon {
	
	public int couponIssueNum;
	public String couponNo;
	public int memNo;
	public String couponKind;
	public Date createDate;
	public Date expireDate;
	public String status;
	public Date useDate;
	public String couponName;
	public String couponCategory;
	public int couponPrice;
	public int couponPriceRate;
}
