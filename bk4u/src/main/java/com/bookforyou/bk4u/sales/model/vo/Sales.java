package com.bookforyou.bk4u.sales.model.vo;


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
public class Sales {
	
	private String dt;	
	private int order;
	private int sub;	
	private int sales;

}
