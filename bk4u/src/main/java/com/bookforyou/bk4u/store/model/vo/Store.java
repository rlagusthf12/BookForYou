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
public class Store {
	private int storeNo;
	private String storeName;
	private String storeAddress;
	private String storeClosed;
	private String storeOpen;
	private String storePhone;
	private String storeStatus;
}
