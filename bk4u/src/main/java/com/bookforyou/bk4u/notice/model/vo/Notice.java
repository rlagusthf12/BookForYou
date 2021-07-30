package com.bookforyou.bk4u.notice.model.vo;

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
public class Notice {
	private int noNo;
	private int memNo;
	private String noTitle;
	private String noContent;
	private Date noDate;
	private int noCount;

}
