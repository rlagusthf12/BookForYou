package com.bookforyou.bk4u.group.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bookforyou.bk4u.group.model.vo.GroupBoard;
import com.bookforyou.bk4u.member.model.vo.Member;


@Repository
public class GroupDao {

	public ArrayList<GroupBoard> selectList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("groupMapper.selectList");
	}
	
	public ArrayList<GroupBoard> selectListMore(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("gorupMapper.selectListMore");
	}
	
	public int insertGBoard(SqlSessionTemplate sqlSession, GroupBoard g) {
		return sqlSession.insert("groupMapper.insertGBoard", g);
			
		}
	
	
	public int insertGMem(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("boardMapper.insertGMem", m);
	}
	
		
	public int selectSearchGListCount(SqlSession sqlSession , HashMap<String, String> map) {
		return sqlSession.selectOne("groupMapper.selectSearchGListCout", map);
		
	}
	
	public ArrayList<GroupBoard> selectSearchList(SqlSession sqlSession, HashMap<String, String> map){
		
		return (ArrayList)sqlSession.selectList("groupMapper.selectSearchList", map);
		
	}


	

	
	

}
