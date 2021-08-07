package com.bookforyou.bk4u.qa.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class Qa {
		private int qaNo;
		private int queTypeNo;
		private int memNo;
		private String qaContent;
		private Date qaDate;
		private String ansStatus;
		private String originName;
		private String changeName;
		private String email;	
		private String queType;
		private String memNickName;
}
