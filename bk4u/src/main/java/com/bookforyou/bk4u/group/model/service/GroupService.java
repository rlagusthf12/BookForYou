package com.bookforyou.bk4u.group.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.group.model.vo.GroupBoard;
import com.bookforyou.bk4u.group.model.vo.GroupMember;
import com.bookforyou.bk4u.member.model.vo.Member;

public interface GroupService {
  
	// 게시글 리스트
	int selectListCount();
	ArrayList<GroupBoard> selectList(PageInfo pi);
	
	// 게시글 작성하기
	int insertGBoard(GroupBoard g);
	
	// 게시글 상세조회용
	GroupBoard selectGroup(int GroupBoardNo);
	
	// 삭제용
	int deleteGBoard(int GroupBoardNo);
	
	// 수정용
	int updateGBoard(GroupBoard g); 
	
	// 가입용
	int insertGMem(Member m);
	
	// 멤버리스트
	ArrayList<GroupMember> groupMemberList();
	
	// 탈퇴
	int deleteMember(String userId);
	
	//검색결과갯수
	int selectSearchGListCount(HashMap<String, String> map);
	
	ArrayList<GroupBoard> selectSearchList(HashMap<String, String> map, PageInfo pi);
	
	
	
	
	
	
	
	
	
	
	
	
}
