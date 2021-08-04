package com.bookforyou.bk4u.store.model.vo;


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
public class OffBook {
	
	private int bkNo;
	private int storeNo;
	private String bkStatus;
	private String bkLct;
	private Date addDate;
	private String bkTitle;
	private String bkPublish;
	private String writerName;

}
