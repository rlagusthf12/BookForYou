package com.bookforyou.bk4u.group.model.service;


import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.group.model.dao.GroupDao;
import com.bookforyou.bk4u.group.model.vo.GroupBoard;
import com.bookforyou.bk4u.group.model.vo.GroupMember;
import com.bookforyou.bk4u.member.model.vo.Member;



@Service
public class GroupServiceImpl implements GroupService{
	@Autowired
	private GroupDao gDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<GroupBoard> selectList() {
			return gDao.selectList(sqlSession);
	}
	
	@Override
	public ArrayList<GroupBoard> selectListMore(int page) {
			return gDao.selectListMore(sqlSession);

	}
	
	@Override
	public int insertGroup(GroupBoard g) {
		return gDao.insertGBoard(sqlSession, g);
	}

	@Override
	public GroupBoard selectGroup(int groupBoardNo) {
		return gDao.selectGroup(sqlSession, groupBoardNo);
	}
	
	public GroupBoard activeGroup(int groupBoardNo) {
		return gDao.activeGroup(sqlSession, groupBoardNo);
	}


	@Override
	public int updateGroup(GroupBoard g) {
		return gDao.updateGroup(sqlSession, g);
	}

	@Override
	public int insertGMem(GroupMember gm) {
		return gDao.insertGMem(sqlSession, gm);	
	}
	
	@Override
	public ArrayList<GroupMember> groupMemberList(int gno) {
		return gDao.groupMemberList(sqlSession, gno);
	}
	
	@Override
	public ArrayList<Member> memberInfo(Member m){
		return gDao.member(sqlSession, m);
	}

	@Override
	public int deleteGroupMem(String userId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int increaseCount(int groupBoardNo) {
		return gDao.increaseCount(sqlSession, groupBoardNo);

	}

	@Override
	public int selectSearchGListCount(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<GroupBoard> selectSearchList(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteGroup(int groupBoardNo) {
		 return gDao.deleteGroup(sqlSession, groupBoardNo);
		
	}

	

	
	

	

	

	

	

	
	

}
