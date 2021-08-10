package com.bookforyou.bk4u.board.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter @Setter
@ToString
public class Board {
	
	public int boNo;
	public int memNo;
	public String boWriter;
	public String boTitle;
	public String boContent;
	public int boCount;
	public String boCategory;
	public Date boCdate;
	public Date boMdate;
	public int boLike;
	public String boStatus;

}
