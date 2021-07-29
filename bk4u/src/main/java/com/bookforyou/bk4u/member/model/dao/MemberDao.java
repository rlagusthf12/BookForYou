package com.bookforyou.bk4u.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bookforyou.bk4u.member.model.vo.Member;

@Repository
public class MemberDao {
	
	
	public Member loginMember(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.selectOne("memberMapper.loginMember", member);
	}

	public int idCheck(SqlSessionTemplate sqlSession, String memId) {
		System.out.println("memberDao: " + memId);
		return sqlSession.selectOne("memberMapper.idCheck", memId);
	}

	public int nickCheck(SqlSessionTemplate sqlSession, String memNickname) {
		return sqlSession.selectOne("memberMapper.nickCheck",memNickname);
	}

	public int emailCheck(SqlSessionTemplate sqlSession, String memEmail) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.emailCheck",memEmail);
	}
	
	
}
