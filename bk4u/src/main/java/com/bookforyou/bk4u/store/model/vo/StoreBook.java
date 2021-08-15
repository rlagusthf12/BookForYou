package com.bookforyou.bk4u.store.model.vo;

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
public class StoreBook {
	
	private int bookNo;
	private int storeNo;
	private String bookTitle;
	private String bookAuthor;
	private String bookPubl;
	private Date bookDate;
	private String bookStatus;

}
