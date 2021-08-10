package com.bookforyou.bk4u.mypage.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookforyou.bk4u.book.model.dao.BookDao;
import com.bookforyou.bk4u.book.model.vo.Book;
import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.group.model.vo.GroupBoard;
import com.bookforyou.bk4u.meetboard.model.vo.MeetBoard;
import com.bookforyou.bk4u.member.model.vo.Member;
import com.bookforyou.bk4u.member.model.vo.MemberCategory;
import com.bookforyou.bk4u.member.model.vo.MemberInterest;
import com.bookforyou.bk4u.mypage.model.dao.MypageDao;
import com.bookforyou.bk4u.mypage.model.vo.MyList;
import com.bookforyou.bk4u.order.model.vo.Order;

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
		return mypageDao.selectMemberInterestList(sqlSession,memNo);
	}

	@Override
	public ArrayList<MemberCategory> getSubCategoryList(int memNo) {
		return mypageDao.selectSubCategoryList(sqlSession,memNo);
	}

	@Override
	public int updateProfileImg(Member member) {
		return mypageDao.updateProfileImg(sqlSession,member);
	}

	@Override
	public int updateMemPassword(Member member) {
		return mypageDao.updateMemPassword(sqlSession,member);
	}

	@Override
	public int updateMemberNickname(Member member) {
		return mypageDao.updateMemberNickname(sqlSession,member);
	}

	@Override
	public int updateMemberEmail(Member member) {
		return mypageDao.updateMemberEmail(sqlSession,member);
	}

	@Override
	public int updateMemberDetail(Member member) {
		return mypageDao.updateMemberDetail(sqlSession,member);
	}

	@Override
	public int updateMemberStatusDisable(Member member) {
		return mypageDao.updateMemberStatusDisable(sqlSession,member);
	}

	@Override
	public int selectMyListCount(Member member) {
		return mypageDao.selectMyListCount(sqlSession,member);
	}

	@Override
	public ArrayList<Book> selectMyList(HashMap<String, Object> listParam) {
		
		return mypageDao.selectMyList(sqlSession,listParam);
	}

	@Override
	public int deleteMyList(MyList list) {
		return mypageDao.deleteMyList(sqlSession,list);
	}

	@Override
	public int selectMyOrderListCount(HashMap<String, Object> listParam) {
		return mypageDao.selectMyOrderListCount(sqlSession, listParam);
	}

	@Override
	public ArrayList<Order> selectMyOrderList(HashMap<String, Object> listParam, PageInfo pi) {
		return mypageDao.selectMyOrderList(sqlSession, listParam,pi);
	}

	@Override
	public int selectMyReadingGroupListCount(Member member) {
		return mypageDao.selectMyReadingGroupListCount(sqlSession,member);
	}

	@Override
	public ArrayList<GroupBoard> selectMyReadingGroupList(PageInfo pi, int memNo) {
		return mypageDao.selectMyReadingGroupList(sqlSession,pi,memNo);
	}

	@Override
	public int selectMyReadingGroupMemberCount(int groupBoardNo) {
		return mypageDao.selectMyReadingGroupMemberCount(sqlSession,groupBoardNo);
	}


}
