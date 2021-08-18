package com.bookforyou.bk4u.Amember.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.bookforyou.bk4u.Amember.model.vo.Amem;
import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.member.model.vo.Member;


public interface AmemService {
	
	// 관리자 회원조회 (페이징)
	int selectListCount();
	ArrayList<Member> selectList(PageInfo pi);
	
	// 회원검색
	public int selectSearchListCount(HashMap<String, String> map);
	public ArrayList<Member> selectSearchAmemList(PageInfo pi, HashMap<String, String> map);
	
	// 회원상세조회
	int increaseCount(int memNo);
	Member selectAmemDetail(int memNo);
	
	// 회원탈퇴
	int amDelete(String memId);
	
	// 블랙리스트 추가
	int blackMember(HashMap<String, String> map);

	
	// 블랙리스트 회원조회
	int selectBlackListCount();
	ArrayList<Member>selectBlackList(PageInfo pi);
	// 블랙리스트 검색
	public int selectBlackSearchListCount(HashMap<String, String> map);
	public ArrayList<Member> selectBlackSearchList(PageInfo pi, HashMap<String, String> map);
	
	//블랙리스트 삭제
	int deleteBlack(int mno);
	
}
