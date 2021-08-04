package com.bookforyou.bk4u.Amember.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.bookforyou.bk4u.Amember.model.vo.Amem;
import com.bookforyou.bk4u.common.model.vo.PageInfo;


public interface AmemService {
	
	// 관리자 회원조회 (페이징)
	int selectAmemListCount();
	ArrayList<Amem> selectList(PageInfo pi);
	
	// 회원검색
	public int selectAmemSearchListCount(HashMap<String, String> map);
	public ArrayList<Amem> selectAmemSearchList(PageInfo pi, HashMap<String, String> map);
	
	// 회원탈퇴
	int amDelete(String memId);
	
	
	// 블랙리스트
	int updateAmem(Amem am);
	
}
