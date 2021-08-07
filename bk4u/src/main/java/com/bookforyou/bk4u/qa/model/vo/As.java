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
public class As {
		private int qaNo;		
		private int memNo;
		private String asContent;
		private Date asDate;		
		private String originName;
		private String changeName;	
}
