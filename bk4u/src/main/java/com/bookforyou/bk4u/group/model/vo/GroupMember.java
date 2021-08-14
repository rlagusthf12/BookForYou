package com.bookforyou.bk4u.group.model.vo;

import java.util.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter @Setter
@ToString
public class GroupMember {

	private int groupBoardNo;
	private int memNo;
	private Date groupEnrollDate;
	private String memEmail;
	private String groupLevel;
	private Date groupWithdraw;
	private String groupReason;
	private int groupMem;
	private String memId;
	
}
