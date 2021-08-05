package com.bookforyou.bk4u.group.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookforyou.bk4u.common.model.vo.PageInfo;
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
	public ArrayList<GroupBoard> selectListMore(int page) {
		return gDao.selectListMore(sqlSession, page);
	}
	
	@Override
	public int insertGBoard(GroupBoard g) {
		return gDao.insertGBoard(sqlSession, g);
	}

	@Override
	public GroupBoard selectGBoard(int groupBoardNo) {
		return gDao.selectGBoard(sqlSession, groupBoardNo);
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
	public int insertGMem(Member m) {
		return gDao.insertGMem(sqlSession, m);
		
		
	}

	@Override
	public int deleteMember(String userId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int selectSearchGListCount(HashMap<String, String> map) {
		
		SqlSession sqlSession = getSqlSession();
		int searchCount = gDao.selectSearchGListCount(sqlSession, map);
		sqlSession.close();
		return searchCount;
		
	}

	@Override
	public ArrayList<GroupBoard> selectSearchList(HashMap<String, String> map, PageInfo pi) {
		SqlSession sqlSession = getSqlSession();
		ArrayList<GroupBoard> list = gDao.selectSearchList(sqlSession, map, pi);
		sqlSession.close();
		return list;
		
	}

	private SqlSession getSqlSession() {
		// TODO Auto-generated method stub
		return null;
	}

	

	
	

}
