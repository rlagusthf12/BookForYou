package com.bookforyou.bk4u.group.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.bookforyou.bk4u.group.model.vo.GroupBoard;
import com.bookforyou.bk4u.member.model.vo.Member;

public interface GroupService {
  
	// 게시글 리스트
	ArrayList<GroupBoard> selectList();
	
	ArrayList<GroupBoard> selectListMore();
	
	// 게시글 작성하기
	int insertGBoard(GroupBoard g);
	
	// 게시글 상세조회용
	GroupBoard selectGBoard(int GroupBoardNo);
	
	// 삭제용
	int deleteGBoard(int GroupBoardNo);
	
	// 수정용
	int updateGBoard(GroupBoard g); 
	
	// 가입용
	int insertGMem(Member m);
	
	// 탈퇴
	int deleteMember(String userId);
	
	//검색결과갯수
	int selectSearchGListCount(HashMap<String, String> map);
	
	ArrayList<GroupBoard> selectSearchListOne(HashMap<String, String> map);
	
	
	
	
	
	
	
	
	
	
	
	
}
