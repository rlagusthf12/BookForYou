package com.bookforyou.bk4u.meetboard.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookforyou.bk4u.meetboard.model.dao.MeetBoardDao;
import com.bookforyou.bk4u.meetboard.model.vo.MeetBoard;

@Service
public class MeetBoardServiceImpl implements MeetBoardService{

	
	@Autowired
	private MeetBoardDao mbDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<MeetBoard> selectGBList(int groupBoardNo) {
		return mbDao.selectGBList(sqlSession,groupBoardNo);
	}

	@Override
	public ArrayList<MeetBoard> selectGBListMore(int page) {
		// TODO Auto-generated method stub
		return null;
	}

}
