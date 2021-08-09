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
	private String changeName;
	private String originName;
	private String groupWriter;
	//그룹에 참가한 멤버 총 인원
	private int memCount;
	//그룹 상태
	private String groupStatus;
	
	

}
