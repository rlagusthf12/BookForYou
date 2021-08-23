package com.bookforyou.bk4u.meet.model.vo;

import java.util.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter @Setter
@ToString
public class MeetMember {

	private int groupBoardNo;
	private int memNo;
	private int meetNo;
	private String meetAttand;
	private String groupLevel;
	private String memEmail;
	private String memId;
}
