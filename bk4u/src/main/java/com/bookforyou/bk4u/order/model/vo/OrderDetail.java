package com.bookforyou.bk4u.order.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter @Getter
@ToString
public class OrderDetail {
	public int orderNo;
	public int bkNo;
	public int quantity;
	public int detailPrice;
	public String detailStatus;
	public String writerName;
}
