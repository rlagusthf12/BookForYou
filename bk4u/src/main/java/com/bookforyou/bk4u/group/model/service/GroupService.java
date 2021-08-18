package com.bookforyou.bk4u.group.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.group.model.vo.GroupBoard;
import com.bookforyou.bk4u.group.model.vo.GroupMember;
import com.bookforyou.bk4u.member.model.vo.Member;

public interface GroupService {
  
	// 게시글 리스트
	ArrayList<GroupBoard> selectList();
	ArrayList<GroupBoard> selectListMore(int page);
	
	// 게시글 작성하기
	int insertGroup(GroupBoard g);
	
	int increaseCount(int groupBoardNo);
	
	// 게시글 상세조회용
	GroupBoard selectGroup(int GroupBoardNo);
	
	GroupBoard activeGroup();
	
	int deleteGroup(int GroupBoardNo);
	
	// 수정용
	int updateGroup(GroupBoard g); 
		
	int insertGMem(GroupMember gm);
	
	// 멤버리스트
	ArrayList<GroupMember> groupMemberList(int gno);
	
	// 탈퇴
	int deleteGroupMem(String userId);
	
	//검색결과갯수
	int selectSearchGListCount(HashMap<String, String> map);
	
	ArrayList<GroupBoard> selectSearchList(HashMap<String, String> map);
	
	ArrayList<Member> memberInfo(Member m);
	



	
	
	
	
	
	
	
}
