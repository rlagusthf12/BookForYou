 package com.bookforyou.bk4u.meetboard.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.bookforyou.bk4u.meetboard.model.vo.MeetBoard;

public class MeetBoardDao {
	
	public ArrayList<MeetBoard> selectGBList(SqlSessionTemplate sqlSession) {

		return (ArrayList)sqlSession.selectList("groupMapper.selectGBList");
	}


}
