package com.bookforyou.bk4u.like.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter @Getter
@ToString
public class Like {
	public int memNo;
	public int likeType;
	public int refPost;
	public Date likeDate;
}
