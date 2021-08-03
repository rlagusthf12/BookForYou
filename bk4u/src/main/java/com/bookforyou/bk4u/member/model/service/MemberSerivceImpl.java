package com.bookforyou.bk4u.member.model.service;



import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookforyou.bk4u.member.model.dao.MemberDao;
import com.bookforyou.bk4u.member.model.vo.Coupon;
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
		return memberDao.selectEmailAndAuthKey(sqlSession,member);
	}

	@Override
	public Member findMemberByEmail(Member member) {
		return memberDao.selectMemberByEmail(sqlSession,member);
	}

	@Override
	public Member findMemberByEmailAndId(Member member) {
		return memberDao.selectMemberByEmailAndId(sqlSession,member);
	}
	
	/**
	 * 임시 비밀번호 생성하는 메서드
	 */
	@Override
	public String createTempPassword() {
		String pswd = "";
		StringBuffer sb = new StringBuffer();
		StringBuffer sc = new StringBuffer("!@#$%^&*-=?~"); 

		// 대문자 4개
		sb.append((char)((Math.random() * 26)+65));  

		for( int i = 0; i<3; i++) {
		   sb.append((char)((Math.random() * 26)+65));
		} 

		// 소문자 4개
		for( int i = 0; i<4; i++) {
		    sb.append((char)((Math.random() * 26)+97));
		}  


		// 숫자 2
		for( int i = 0; i<2; i++) {
		    sb.append((char)((Math.random() * 10)+48));
		}


		// 특수문자 두개 
		sb.setCharAt(((int)(Math.random()*3)+1), sc.charAt((int)(Math.random()*sc.length()-1))); //대문자3개중 하나   
		sb.setCharAt(((int)(Math.random()*4)+4), sc.charAt((int)(Math.random()*sc.length()-1))); //소문자4개중 하나

		pswd = sb.toString();

		return pswd;
	}

	@Override
	public int updatePassword(Member member) {
		return memberDao.updatePassword(sqlSession,member);
	}

	/*
	 * [사용자] 소지 쿠폰 개수 조회 (연지)
	 */
	@Override
	public int selectCouponCount(int memNo) {
		return memberDao.selectCouponCount(sqlSession, memNo);
	}

	/*
	 * [사용자] 소지 쿠폰 조회 (연지)
	 */
	@Override
	public ArrayList<Coupon> selectCouponList(int memNo){
		return memberDao.selectCouponList(sqlSession, memNo);
	}

	/**
	 * [사용자] 멤버의 직업과 책 선호 난이도 수정
	 * @author 안세아
	 */
	@Override
	public int updateMemberWorkAndLevel(Member member) {
		// TODO Auto-generated method stub
		return memberDao.updateMemberWorkAndLevel(sqlSession, member);
	}

}
