package com.bookforyou.bk4u.group.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import oracle.sql.DATE;

@NoArgsConstructor
@Getter @Setter
@ToString
public class GroupBoard {
	
	private int groupBoard;
	private int memNo;
	private String groupType;
	private String groupTitle;
	private String groupScript;
	private DATE groupDate;
	private int groupLimit;
	private String groupNotice;
	private String groupPlace;
	private String groupOpen;
	private String groupImg;
	
	

}
