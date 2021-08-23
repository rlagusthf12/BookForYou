package com.bookforyou.bk4u.meet.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bookforyou.bk4u.group.model.vo.GroupBoard;
import com.bookforyou.bk4u.group.model.vo.GroupMember;
import com.bookforyou.bk4u.meet.model.vo.Meet;
import com.bookforyou.bk4u.meet.model.vo.MeetMember;
import com.bookforyou.bk4u.member.model.vo.Member;

@Repository
public class MeetDao {

	public int insertMeet(SqlSessionTemplate sqlSession, Meet m) {
		System.out.println(m);
		return sqlSession.insert("groupMapper.insertMeet", m);
		}
	
	public ArrayList<Meet> meetList(SqlSessionTemplate sqlSession, int groupBoardNo) {
		return (ArrayList)sqlSession.selectList("groupMapper.meetList", groupBoardNo);
		
	}
	
	public ArrayList<Meet> meetLastList(SqlSessionTemplate sqlSession, int groupBoardNo) {
		return (ArrayList)sqlSession.selectList("groupMapper.meetLastList" , groupBoardNo);
		
	}
	
	
	public int insertMeetMem(SqlSessionTemplate sqlSession, MeetMember mb) {
		System.out.println(mb);
		return sqlSession.insert("groupMapper.insertMeetMem", mb);
	}
	
	public ArrayList<MeetMember> meetMemberList(SqlSessionTemplate sqlSession, int gno){
		return (ArrayList)sqlSession.selectList("groupMapper.meetMemberList", gno);
	}
	
	public ArrayList<Member> member(SqlSession sqlSession, Member m){
		return (ArrayList)sqlSession.selectList("groupMapper.memberInfo", m);
	}
	
	
	
	
}
