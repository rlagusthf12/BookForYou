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
	
	public ArrayList<GroupMember> groupMemberList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("groupMapper.groupMemberList");
	}
	
		
	public int selectSearchGListCount(SqlSession sqlSession , HashMap<String, String> map) {
		return sqlSession.selectOne("groupMapper.selectSearchGListCount", map);
		
	}
	
	public ArrayList<GroupBoard> selectSearchList(SqlSession sqlSession, HashMap<String, String> map, PageInfo pi){
		
		int offset = (pi.getCurrentPage() -1) + pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("groupMapper.selectSearchList", map, rowBounds);
		
	}


	public GroupBoard selectGroup(SqlSessionTemplate sqlSession, int groupBoard) {
		return sqlSession.selectOne("boardMapper.selectGroup", groupBoard);
	}

	
	

}
