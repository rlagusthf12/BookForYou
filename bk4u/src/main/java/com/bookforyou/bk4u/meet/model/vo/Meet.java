package com.bookforyou.bk4u.meet.model.vo;

import java.util.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@NoArgsConstructor
@Getter @Setter
@ToString

public class Meet {

	private int meetNo;
	private int groupBoardNo;
	private int memNo;
	private String offlinePost;
	private String offlineAddress;
	private String mAddress;
	private String sAddress;
	private String onlineAddress;
	private Date meetDate;
	private Date meetTime;
	private String meetStatus;
 	private int meetLimit;
 	private String meetPrice;
 	private String groupLevel;
	
	
	
	
}
