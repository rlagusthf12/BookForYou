package com.bookforyou.bk4u.report.model.vo;

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
public class ReportList {
		private int reliNo;
		private String reliContent;
		private Date reliDate;
		private String memNickName;
		private String reliLink;
		private String reliType;
		private String originName;
		private String changeName;
}
