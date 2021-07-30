package com.bookforyou.bk4u.booklist.model.vo;

import java.sql.Date;
import java.util.ArrayList;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter @Getter
@ToString
public class Booklist {
	
	public int blNo;
	public int memNo;
	public int bkNo;
	public String blTitle;
	public String blWriter;
	public String blContent;
	public int blCount;
	public int blRate;
	public Date blCdate;
	public Date blMdate;
	public int blLike;
	public int blScrap;
	public String blStatus;
	
	public ArrayList<Booklist> booklistList;
}
