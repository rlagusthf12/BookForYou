package com.bookforyou.bk4u.subscription.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookforyou.bk4u.book.model.vo.Book;
import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.member.model.vo.Coupon;
import com.bookforyou.bk4u.payment.model.vo.Payment;
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
	public Subscription selectAdminSubscDetail(HashMap<String, Integer> map) {
		return sDao.selectAdminSubscDetail(sqlSession, map);
	}

	/**
	 * [관리자] 정기구독 상세 조회 - 도서 (한진)
	 */
	@Override
	public ArrayList<Book> selectAdminSubscDetailBook(HashMap<String, Integer> map) {
		return sDao.selectAdminSubscDetailBook(sqlSession, map);
	}

	/**
	 * [관리자] 정기구독 상세 조회 - 배송 (한진)
	 */
	@Override
	public Subscription selectAdminSubscDetailDel(HashMap<String, Integer> map) {
		return sDao.selectAdminSubscDetailDel(sqlSession, map);
	}

	/**
	 * [관리자] 정기구독 상세 조회 - 결제 (한진)
	 */
	@Override
	public Payment selectAdminSubscDetailPay(HashMap<String, Integer> map) {
		return sDao.selectAdminSubscDetailPay(sqlSession, map);
	}

	/**
	 * [관리자] 정기구독 상세 조회 - 쿠폰 (한진)
	 */
	@Override
	public Coupon selectAdminSubscDetailCoupon(HashMap<String, Integer> map) {
		return sDao.selectAdminSubscDetailCoupon(sqlSession, map);
	}

	/**
	 * [관리자] 배송지 변경 (한진)
	 */
	@Override
	public int updateAdminAddress(Subscription s) {
		return sDao.updateAdminAddress(sqlSession, s);
	}
	
	
}
