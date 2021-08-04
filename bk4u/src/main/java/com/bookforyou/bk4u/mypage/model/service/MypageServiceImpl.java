package com.bookforyou.bk4u.mypage.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookforyou.bk4u.book.model.dao.BookDao;
import com.bookforyou.bk4u.book.model.vo.Book;
import com.bookforyou.bk4u.member.model.vo.Member;
import com.bookforyou.bk4u.member.model.vo.MemberCategory;
import com.bookforyou.bk4u.member.model.vo.MemberInterest;
import com.bookforyou.bk4u.mypage.model.dao.MypageDao;

@Service
public class MypageServiceImpl implements MypageService {
	
	@Autowired
	private MypageDao mypageDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int deleteAllMemInterest(Member member) {
		return mypageDao.deleteAllMemInterest(sqlSession,member);
	}

	@Override
	public int deleteAllMemCategory(Member member) {
		return mypageDao.deleteAllMemCategory(sqlSession, member);
	}

	@Override
	public ArrayList<MemberInterest> getMemberInterestList(int memNo) {
		// TODO Auto-generated method stub
		return mypageDao.selectMemberInterestList(sqlSession,memNo);
	}

	@Override
	public ArrayList<MemberCategory> getSubCategoryList(int memNo) {
		// TODO Auto-generated method stub
		return mypageDao.selectSubCategoryList(sqlSession,memNo);
	}


	
	

}
