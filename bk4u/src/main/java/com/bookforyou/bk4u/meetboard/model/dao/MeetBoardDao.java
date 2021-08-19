 package com.bookforyou.bk4u.meetboard.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bookforyou.bk4u.meetboard.model.vo.MeetBoard;

@Repository
public class MeetBoardDao {
	
	public ArrayList<MeetBoard> selectGBList(SqlSessionTemplate sqlSession) {

		return (ArrayList)sqlSession.selectList("groupMapper.selectGBList");
	}


}
