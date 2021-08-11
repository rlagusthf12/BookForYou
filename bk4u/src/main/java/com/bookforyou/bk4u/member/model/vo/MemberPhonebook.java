package com.bookforyou.bk4u.member.model.vo;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class MemberPhonebook {
	private int phoneNo;
	private int memNo;
	private String name;
	private String postNo;
	private String basicAddress;
	private String detailAddress;
	private String addressRefer;
	private String phone;
	private String receiverName;
	private String memName;
}
