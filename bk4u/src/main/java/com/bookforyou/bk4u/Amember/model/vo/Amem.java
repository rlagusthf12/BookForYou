package com.bookforyou.bk4u.Amember.model.vo;

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
public class Amem {
	public int memNo;
	public String memId;
	public String memPwd;
	public String memName;
	public String memPost;
	public String memBasicAddress;
	public String memDetailAddress;
	public String memAddressRefer;
	public String memGender;
	public String memAge;
	public String memPhone;
	public String memEmail;
	public String emailStatus;
	public String memStatus;
	public String memNickname;
	public String memWork;
	public String memLevel;
	public Date memEnrolldate;
	public String blackReason;
	public Date blackDate;
	public int reportCount;
	public String originImgName;
	public String changeImgName;
}