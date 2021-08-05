package com.bookforyou.bk4u.reply.model.vo;

import java.sql.Date;
import java.util.ArrayList;

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
	private int replyRefNo;	// 참조하는 상위 댓글 (첫댓이면 원글0) 
	private int depth;		// 댓글의 깊이(종류) (첫댓 0, 대댓1, 대대댓2, ...)
	
	public ArrayList<Reply> replyList;
}
