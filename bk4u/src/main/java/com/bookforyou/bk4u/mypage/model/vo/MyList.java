package com.bookforyou.bk4u.mypage.model.vo;

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
public class MyList {
	
	private int bkNo;
	private int memNo;
	private Date listDate;
	

}
