package com.bookforyou.bk4u.subscription.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookforyou.bk4u.book.model.vo.Book;
import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.member.model.vo.Coupon;
import com.bookforyou.bk4u.member.model.vo.Member;
import com.bookforyou.bk4u.member.model.vo.MemberCategory;
import com.bookforyou.bk4u.member.model.vo.MemberInterest;
import com.bookforyou.bk4u.payment.model.vo.Payment;
import com.bookforyou.bk4u.point.model.vo.Point;
import com.bookforyou.bk4u.subscription.model.dao.SubscriptionDao;
import com.bookforyou.bk4u.subscription.model.vo.Subscription;

@Service
public class SubscriptionImpl implements SubscriptionService{

	@Autowired
	private SubscriptionDao sDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
	 * [관리자] 정기구독 목록 개수 조회 (한진)
	 */
	@Override
	public int selectAllListCount() {
		return sDao.selectAllListCount(sqlSession);
	}

	/**
	 * [관리자] 정기구독 목록 조회 (한진)
	 */
	@Override
	public ArrayList<Subscription> selectAdminSubscList(PageInfo pi, HashMap<String, String> filter) {
		return sDao.selectAdminSubscList(sqlSession, pi, filter);
	}

	/*
	 * [관리자] '베이직' 목록 개수 조회 (한진)
	 */
	@Override
	public int selectBasicListCount() {
		return sDao.selectBasicListCount(sqlSession);
	}

	/*
	 * [관리자] '프리미엄' 목록 개수 조회 (한진)
	 */
	@Override
	public int selectPremiumListCount() {
		return sDao.selectPremiumListCount(sqlSession);
	}

	/*
	 * [관리자] '구독중' 목록 개수 조회 (한진)
	 */
	@Override
	public int selectStatusYListCount() {
		return sDao.selectStatusYListCount(sqlSession);
	}

	/*
	 * [관리자] '구독해지' 목록 개수 조회 (한진)
	 */
	@Override
	public int selectStatusNListCount() {
		return sDao.selectStatusNListCount(sqlSession);
	}

	/**
	 * [관리자] 검색조건에 일치하는 목록 개수 조회 (한진)
	 */
	@Override
	public int selectAdminSubscListSearchCount(HashMap<String, String> map) {
		return sDao.selectAdminSubscListSearchCount(sqlSession, map);
	}

	/*
	 * [관리자] 검색조건에 일치하는 목록 조회 (한진)
	 */
	@Override
	public ArrayList<Subscription> selectAdminSubscSearchList(PageInfo pi, HashMap<String, String> map) {
		return sDao.selectAdminSubscSearchList(sqlSession, map);
	}

	/**
	 * [관리자] 정기구독 상세 조회 (한진)
	 */
	@Override
	public Subscription selectAdminSubscDetail(HashMap<String, String> map) {
		return sDao.selectAdminSubscDetail(sqlSession, map);
	}

	/**
	 * [관리자] 정기구독 상세 조회 - 도서 (한진)
	 */
	@Override
	public ArrayList<Book> selectAdminSubscDetailBook(HashMap<String, String> map) {
		return sDao.selectAdminSubscDetailBook(sqlSession, map);
	}

	/**
	 * [관리자] 정기구독 상세 조회 - 배송 (한진)
	 */
	@Override
	public Subscription selectAdminSubscDetailDel(HashMap<String, String> map) {
		return sDao.selectAdminSubscDetailDel(sqlSession, map);
	}

	/**
	 * [관리자] 정기구독 상세 조회 - 결제 (한진)
	 */
	@Override
	public Payment selectAdminSubscDetailPay(HashMap<String, String> map) {
		return sDao.selectAdminSubscDetailPay(sqlSession, map);
	}

	/**
	 * [관리자] 정기구독 상세 조회 - 쿠폰 (한진)
	 */
	@Override
	public Coupon selectAdminSubscDetailCoupon(HashMap<String, String> map) {
		return sDao.selectAdminSubscDetailCoupon(sqlSession, map);
	}

	/**
	 * [관리자] 배송지 변경 (한진)
	 */
	@Override
	public int updateAdminAddress(Subscription s) {
		return sDao.updateAdminAddress(sqlSession, s);
	}

	/**
	 * [관리자] 오늘 날짜의 정기배송 목록 개수 조회 (한진)
	 */
	@Override
	public int selectTodaySubscCount() {
		return sDao.selectTodaySubscCount(sqlSession);
	}

	/**
	 * [관리자] 오늘 날짜의 정기배송 목록 조회 (한진)
	 */
	@Override
	public ArrayList<Subscription> selectTodaySubscList(PageInfo pi) {
		return sDao.selectTodaySubscList(sqlSession, pi);
	}

	/**
	 * [관리자] 선택된 날짜의 정기배송 목록 개수 조회 (한진)
	 */
	@Override
	public int selectDaySubscCount(int date) {
		return sDao.selectDaySubscCount(sqlSession, date);
	}

	/**
	 * [관리자] 선택된 날짜의 정기배송 목록 조회 (한진)
	 */
	@Override
	public ArrayList<Subscription> selectDaySubscDeliveryList(PageInfo pi, int date) {
		return sDao.selectDaySubscDeliveryList(sqlSession, pi, date);
	}

	/**
	 * [관리자] 풀캘린더에 표시할 리스트 조회 (한진)
	 */
	@Override
	public ArrayList<Subscription> selectListForCalendarEvents() {
		return sDao.selectListForCalendarEvents(sqlSession);
	}

	/**
	 * [관리자] 회원 취향에 맞는 정기배송 책 목록 개수 조회 (한진)
	 */
	@Override
	public int selectAdminSubscBookCount(String sNo) {
		return sDao.selectAdminSubscBookCount(sqlSession, sNo);
	}

	/**
	 * [관리자] 회원 취향에 맞는 정기배송 책 목록 조회 (한진)
	 */
	@Override
	public ArrayList<Book> selectAdminSubscBookList(PageInfo pi, String sNo) {
		return sDao.selectAdminSubscBookList(sqlSession, pi, sNo);
	}

	/**
	 * [관리자] 회원 조회 (한진)
	 */
	@Override
	public Member selectAdminSubscMember(String sNo) {
		return sDao.selectAdminSubscMember(sqlSession, sNo);
	}

	/**
	 * [관리자] 정기구독 회원 interest 조회 (한진)
	 */
	@Override
	public ArrayList<MemberInterest> selectAdminSubscInterest(String sNo) {
		return sDao.selectAdminSubscInterest(sqlSession, sNo);
	}

	/**
	 * [관리자] 정기구독 회원 sub_category 조회 (한진)
	 */
	@Override
	public ArrayList<MemberCategory> selectAdminSubscCategory(String sNo) {
		return sDao.selectAdminSubscCategory(sqlSession, sNo);
	}

	/**
	 * [관리자] 도서 발송 (한진)
	 */
	@Override
	public int insertSubscOrder(HashMap<String, String> map) {
		return sDao.insertSubscOrder(sqlSession, map);
	}
	
	/** 쿠폰 조회
	 * @author daeunlee
	 */
	@Override
	public ArrayList<Coupon> selectSubscCoupon(int memNo) {
		return sDao.selectSubscCoupon(sqlSession, memNo);
	}
	
	/** 포인트 조회 
	 * @author daeunlee
	 */
	@Override
	public ArrayList<Point> selectSubPoint(int memNo) {
		return sDao.selectSubPoint(sqlSession, memNo);
	}
	
	/** 정기구독 등록
	 * @author daeunlee
	 */
	@Override
	public int insertSubsc(Subscription sub) {
		return sDao.insertSubsc(sqlSession, sub);
	}
	
	/** 정기구독 조회
	 * @author daeunlee
	 */
	@Override
	public Subscription selectSubscription(int memNo) {
		return sDao.selectSubscription(sqlSession, memNo);
	}

	/**
	 * [관리자] 정기구독 발송 내역 개수 조회 (한진)
	 */
	@Override
	public int selectAdminSubscOrderCount() {
		return sDao.selectAdminSubscOrderCount(sqlSession);
	}

	/**
	 * [관리자] 정기구독 발송 내역 조회 (한진)
	 */
	@Override
	public ArrayList<Subscription> selectAdminSubscOrderList(PageInfo pi, HashMap<String, Integer> map) {
		return sDao.selectAdminSubscOrderList(sqlSession, pi, map);
	}

	/**
	 * [관리자] 메모 등록/수정 (한진)
	 */
	@Override
	public int updateAdminMemo(HashMap<String, String> map) {
		return sDao.updateAdminMemo(sqlSession, map);
	}

	/**
	 * [관리자] 메모 삭제 (한진)
	 */
	@Override
	public int deleteAdminMemo(String subscNo) {
		return sDao.deleteAdminMemo(sqlSession, subscNo);
	}

	/**
	 * [관리자] 정기구독 도서 선택 페이지 검색 결과 개수 조회 (한진)
	 */
	@Override
	public int selectAdminBookSelectSearchListCount(HashMap<String, String> map) {
		return sDao.selectAdminBookSelectSearchListCount(sqlSession, map);
	}

	/**
	 * [관리자] 정기구독 도서 선택 페이지 검색 결과 조회 (한진)
	 */
	@Override
	public ArrayList<Book> selectAdminBookSelectSearchList(PageInfo pi, HashMap<String, String> map) {
		return sDao.selectAdminBookSelectSearchList(sqlSession, pi, map);
	}

	/**
	 * [관리자] 정기구독 도서 중복 체크 (한진)
	 */
	@Override
	public int checkBookDuplicates(HashMap<String, String> map) {
		return sDao.checkBookDuplicates(sqlSession, map);
	}

	/**
	 * [관리자] 정기구독 발송 내역 페이지 검색 결과 개수 조회 (한진)
	 */
	@Override
	public int selectSubscOrderSearchCount(HashMap<String, String> map) {
		return sDao.selectSubscOrderSearchCount(sqlSession, map);
	}

	/**
	 * [관리자] 정기구독 발송 내역 페이지 검색 결과 조회 (한진)
	 */
	@Override
	public ArrayList<Subscription> selectAdminSubscOrderSearchList(PageInfo pi, HashMap<String, String> map) {
		return sDao.selectAdminOrderSearchList(sqlSession, pi, map);
	}

	

	
	

	
	
}
