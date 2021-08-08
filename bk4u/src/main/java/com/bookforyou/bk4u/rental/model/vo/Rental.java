package com.bookforyou.bk4u.rental.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter @Getter
@ToString
public class Rental {
	
	public int rentalNo;
	public int memNo;
	public int bkNo;
	public int storeNo;
	public Date requestDate;
	public Date receiveDate;
	public Date returnDate;
	public String rentalStatus;
	public String bkTitle;
	public String bkPublish;
	public String writerName;
	public String storeName;
	public String bkLct;
	public String memName;
	public String memId;

}
