package com.bookforyou.bk4u.member.model.dao;


import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bookforyou.bk4u.member.model.vo.Coupon;
import com.bookforyou.bk4u.member.model.vo.Member;
import com.bookforyou.bk4u.member.model.vo.MemberCategory;
import com.bookforyou.bk4u.member.model.vo.MemberInterest;

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
		return sqlSession.selectOne("memberMapper.emailCheck",memEmail);
	}

	public int insertMember(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.insert("memberMapper.insertMember",member);
	}

	public int updateEmailStatus(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.update("memberMapper.updateEmailStatus",member);
	}

	public int selectByMemId(SqlSessionTemplate sqlSession, Member member) {
		
		return sqlSession.selectOne("memberMapper.selectMemberById",member);
	}

	public int insertMemberInterest(SqlSessionTemplate sqlSession, MemberInterest memberInterest) {
		
		return sqlSession.insert("memberMapper.insertMemberInterest", memberInterest);
	}

	public int insertMemberCategory(SqlSessionTemplate sqlSession, MemberCategory memberCategory) {
		return sqlSession.insert("memberMapper.insertMemberCategory",memberCategory);
	}

	public Member selectEmailAndAuthKey(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.selectOne("memberMapper.selectEmailAndAuthKey",member);
	}

	public Member selectMemberByEmail(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.selectOne("memberMapper.selectMemberByEmail",member);
	}

	public Member selectMemberByEmailAndId(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.selectOne("memberMapper.selectMemberByEmailAndId",member);
	}

	public int updatePassword(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.update("memberMapper.updatePassword",member);
	}

	/*
	 * [사용자] 소지 쿠폰 개수 조회 (연지)
	 */
	public int selectCouponCount(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("memberMapper.selectCouponCount", memNo);
	}

	/*
	 * [사용자] 소지 쿠폰 조회 (연지)
	 */
	public ArrayList<Coupon> selectCouponList(SqlSessionTemplate sqlSession, int memNo) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectCouponList", memNo);
	}
	
	/**
	 * [사용자] 멤버의 직업과 책 선호난이도 수정
	 * @author 안세아
	 * @param sqlSession
	 * @param member
	 * @return
	 */
	public int updateMemberWorkAndLevel(SqlSessionTemplate sqlSession, Member member) {
		// TODO Auto-generated method stub
		return sqlSession.update("memberMapper.updateMemberWorkAndLevel",member);
	}

	public String selectMemberPassword(SqlSessionTemplate sqlSession, int memNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.selectMemberPassword", memNo);
	}



	
	
}
