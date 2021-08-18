package com.bookforyou.bk4u.meet.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bookforyou.bk4u.meet.model.vo.Meet;

@Repository
public class MeetDao {

	public int insertMeet(SqlSessionTemplate sqlSession, Meet m) {
		System.out.println(m);
		return sqlSession.insert("groupMapper.insertMeet", m);
		}
	
	public ArrayList<Meet> meetList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("groupMapper.meetList");
		
	}
	
	public ArrayList<Meet> meetLastList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("groupMapper.meetLastList");
		
	}
}
