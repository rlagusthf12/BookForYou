package com.bookforyou.bk4u.member.model.service;



import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookforyou.bk4u.member.model.dao.MemberDao;
import com.bookforyou.bk4u.member.model.vo.Member;
import com.bookforyou.bk4u.member.model.vo.MemberCategory;
import com.bookforyou.bk4u.member.model.vo.MemberInterest;

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

	@Override
	public int insertMember(Member member) {
		return memberDao.insertMember(sqlSession,member);
	}

	@Override
	public int updateEmailStatus(Member member) {
		return memberDao.updateEmailStatus(sqlSession,member);
	}

	@Override
	public int selectByMemId(Member member) {
		// TODO Auto-generated method stub
		return memberDao.selectByMemId(sqlSession,member);
	}

	@Override
	public int insertMemberInterest(MemberInterest memberInterest) {
		
		return memberDao.insertMemberInterest(sqlSession, memberInterest);
	}

	@Override
	public int insertMemberCategory(MemberCategory memberCategory) {
		
		return memberDao.insertMemberCategory(sqlSession, memberCategory);
	}

	@Override
	public Member selectEmailAndAuthKey(Member member) {
		// TODO Auto-generated method stub
		return memberDao.selectEmailAndAuthKey(sqlSession,member);
	}


	
}
