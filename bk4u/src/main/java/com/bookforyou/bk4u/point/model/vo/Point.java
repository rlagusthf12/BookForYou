package com.bookforyou.bk4u.point.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Point {
	private int pointNo;
	private int memNo;
	private int orderNo;
	private int subscNo;
	private String pointContent;
	private int pointPrice;
	private Date occurrenceDate;
}
