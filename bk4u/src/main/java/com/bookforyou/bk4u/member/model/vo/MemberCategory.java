package com.bookforyou.bk4u.member.model.vo;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class MemberCategory {
	private int memNo;
	private int subCategoryNo;
	private String subCateName;
}
