package com.bookforyou.bk4u.mypage.model.vo;

import java.sql.Date;
import java.util.ArrayList;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

public class Booklist2 {
	
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
		public String originName;
		public String changeName;
		public String bkTitle;
		public String bkPublish;
		public String writerName;
		public ArrayList<Booklist> booklistList;
		public int rank;
		public String changeImgName;
		public String introChangeName;
	}
}
