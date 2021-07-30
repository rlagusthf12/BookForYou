package com.bookforyou.bk4u.faq.model.vo;

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
public class Faq {
	
	private int faqNo;
	private int memNo;
	private int queTypeNo;
	private String faqQue;
	private String faqAns;
	private Date faqDate;
	private int faqCount;
	private String faqList;
	private String queType;
	

}
