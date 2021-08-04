package com.bookforyou.bk4u.group.model.vo;

import java.util.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@NoArgsConstructor
@Getter @Setter
@ToString
public class GroupBoard {
	
	private int groupBoardNo;
	private String groupType;
	private String groupTitle;
	private String groupScript;
	private Date groupDate;
	private int groupLimit;
	private String groupNotice;
	private String groupPlace;
	private String groupOpen;
	private String groupImg;
	private String groupWriter;
	
	

}
