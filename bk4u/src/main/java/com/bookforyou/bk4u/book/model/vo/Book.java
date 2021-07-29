package com.bookforyou.bk4u.book.model.vo;

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
public class Book {

	public int bkNo;
	public int subCateNo;
	public String bkTitle;
	public String bkPublish;
	public String bkDate;
	public int bkPrice;
	public String introOriginName;
	public String introChangeName;
	public int bkStock;
	public Date bkSelDate;
	public Date bkModiDate;
	public String bkSelStatus;
	public String bkAge;
	public String bkGender;
	public String bkWork;
	public String bkLevel;
	public String bkStatus;
	public String writerName;
	public String writerIntro;
	public String writerOriginName;
	public String writerChangeName;
	public String bkContent;
	public double bkGrade;
	
}
