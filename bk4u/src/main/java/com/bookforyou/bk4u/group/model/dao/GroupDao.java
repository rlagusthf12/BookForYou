package com.bookforyou.bk4u.group.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.group.model.vo.GroupBoard;
import com.bookforyou.bk4u.group.model.vo.GroupMember;
import com.bookforyou.bk4u.member.model.vo.Member;


@Repository
public class GroupDao {


	public ArrayList<GroupBoard> selectListMore(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("groupMapper.selectListMore");

	}
	public ArrayList<GroupBoard> selectList(SqlSessionTemplate sqlSession) {

		return (ArrayList)sqlSession.selectList("groupMapper.selectList");
	}
	
	public int insertGBoard(SqlSessionTemplate sqlSession, GroupBoard g) {
		System.out.println(g);
		return sqlSession.insert("groupMapper.insertGBoard", g);
			
		}
	
	public ArrayList<Member> member(SqlSession sqlSession, Member m){
		System.out.println(m);
		return (ArrayList)sqlSession.selectList("groupMapper.memberInfo", m);
	}
	
	
	public int insertGMem(SqlSessionTemplate sqlSession, GroupMember gm) {
		System.out.println(gm);
		return sqlSession.insert("groupMapper.insertGMem", gm);
	}
	
	public ArrayList<GroupMember> groupMemberList(SqlSessionTemplate sqlSession, int gno){
		return (ArrayList)sqlSession.selectList("groupMapper.groupMemberList", gno);
	}
	
		
	public int selectSearchGListCount(SqlSession sqlSession , HashMap<String, String> map) {
		return sqlSession.selectOne("groupMapper.selectSearchGListCount", map);
		
	}
	
	public ArrayList<GroupBoard> selectSearchList(SqlSession sqlSession, HashMap<String, String> map){
		return (ArrayList)sqlSession.selectList("groupMapper.selectSearchList", map);
		
	}


	public GroupBoard selectGroup(SqlSessionTemplate sqlSession, int groupBoard) {
		System.out.println(groupBoard);
		return sqlSession.selectOne("groupMapper.selectGroup", groupBoard);
	}

	public int increaseCount(SqlSessionTemplate sqlSession, int groupBoardNo) {
		return sqlSession.update("groupMapper.increaseCount", groupBoardNo);
		
	}
	
	public int deleteGroup(SqlSessionTemplate sqlSession, int groupBoardNo) {
		return sqlSession.update("groupMapper.deleteGroup", groupBoardNo);
	}
	
	public int updateGroup(SqlSessionTemplate sqlSession, GroupBoard g){
		return sqlSession.update("groupMapper.updateGroup", g);
	}
	
	public int insertMeet(SqlSessionTemplate sqlSession, GroupBoard g) {
		return sqlSession.insert("groupMapper.insertMeet", g);
			
		}

}
