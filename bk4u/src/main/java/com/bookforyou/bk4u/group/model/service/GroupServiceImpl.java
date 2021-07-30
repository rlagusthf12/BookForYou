package com.bookforyou.bk4u.group.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookforyou.bk4u.group.model.dao.GroupDao;
import com.bookforyou.bk4u.group.model.vo.GroupBoard;
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
	public int insertGBoard(GroupBoard g) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public GroupBoard selectGBoard(int GroupBoardNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteGBoard(int GroupBoardNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateGBoard(GroupBoard g) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertGMember(Member m) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMember(String userId) {
		// TODO Auto-generated method stub
		return 0;
	}

	

	
	

}
