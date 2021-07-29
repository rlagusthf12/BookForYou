package com.bookforyou.bk4u.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookforyou.bk4u.member.model.dao.MemberDao;
import com.bookforyou.bk4u.member.model.vo.Member;

@Service
public class MemberSerivceImpl implements MemberService{
	
	@Autowired
	MemberDao memberDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public Member loginMember(Member member) {
		return memberDao.loginMember(sqlSession,member);
	}

	@Override
	public int idCheck(String memId) {
		return memberDao.idCheck(sqlSession,memId);
	}

	@Override
	public int nickCheck(String memNickname) {
		return memberDao.nickCheck(sqlSession,memNickname);
	}

	@Override
	public int emailCheck(String memEmail) {
		return memberDao.emailCheck(sqlSession,memEmail);
	}
	
}
