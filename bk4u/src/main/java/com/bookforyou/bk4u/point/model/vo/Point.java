package com.bookforyou.bk4u.point.model.vo;

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
public class Point {
	public int pointNo;
	public int memNo; 
	public int orderNo;
	public int subscNo;
	public String pointContent;
	public int pointPrice;
	public Date occurrenceDate;
}
