package com.bookforyou.bk4u.reply.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter @Setter
@ToString
public class Reply {
	private int replyNo;
	private int memNo;
	private int replyType;
	private int refPost;
	private String replyContent;
	private Date replyCdate;
	private Date replyMdate;
	private String deleteStatus;
	private int replyRefNo;
	private int depth;
}
