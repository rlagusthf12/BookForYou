package com.bookforyou.bk4u.Amember.model.service;

import java.util.ArrayList;

import com.bookforyou.bk4u.Amember.model.vo.Amem;
import com.bookforyou.bk4u.common.model.vo.PageInfo;


public interface AmemService {
	
	// 관리자 회원조회 (페이징)
	int selectAmemListCount();
	ArrayList<Amem> selectList(PageInfo pi);
	
	
	// 회원탈퇴
	int deleteAmem(int memNo);
	
	
	// 블랙리스트
	int updateAmem(Amem am);
	
}
