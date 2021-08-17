package com.bookforyou.bk4u.report.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class Report {
	
	private int reportNo;
	private int memNo;
	private String reportContent;
	private Date reportDate;
	private int reportRefNo;
	private int reportType;
	private String originName;
	private String changeName;
	private String reportLink;
	private String reportStatus;
	private String reportType1;

}
