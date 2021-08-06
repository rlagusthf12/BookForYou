package com.bookforyou.bk4u.subscription.model.service;

import java.util.ArrayList; 
import java.util.HashMap;

import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.member.model.vo.Coupon;
import com.bookforyou.bk4u.payment.model.vo.Payment;
import com.bookforyou.bk4u.book.model.vo.Book;
import com.bookforyou.bk4u.subscription.model.vo.Subscription;

public interface SubscriptionService {

	
	/**
	 * [관리자] 정기구독 목록 개수 조회 (한진)
	 */
	int selectAllListCount();

	/**
	 * [관리자] 정기구독 목록 조회 (한진)
	 */
	ArrayList<Subscription> selectAdminSubscList(PageInfo pi, HashMap<String, String> filter);

	/*
	 * [관리자] '베이직' 목록 개수 조회 (한진)
	 */
	int selectBasicListCount();

	/*
	 * [관리자] '프리미엄' 목록 개수 조회 (한진)
	 */
	int selectPremiumListCount();

	/*
	 * [관리자] '구독중' 목록 개수 조회 (한진)
	 */
	int selectStatusYListCount();

	/*
	 * [관리자] '구독해지' 목록 개수 조회 (한진)
	 */
	int selectStatusNListCount();

	/**
	 * [관리자] 검색조건에 일치하는 목록 개수 조회 (한진)
	 */
	int selectAdminSubscListSearchCount(HashMap<String, String> map);

	/*
	 * [관리자] 검색조건에 일치하는 목록 조회 (한진)
	 */
	ArrayList<Subscription> selectAdminSubscSearchList(PageInfo pi, HashMap<String, String> map);

	/**
	 * [관리자] 정기구독 상세 조회 (한진)
	 */
	Subscription selectAdminSubscDetail(HashMap<String, Integer> map);

	/**
	 * [관리자] 정기구독 상세 조회 - 도서 (한진)
	 */
	ArrayList<Book> selectAdminSubscDetailBook(HashMap<String, Integer> map);

	/**
	 * [관리자] 정기구독 상세 조회 - 배송 (한진)
	 */
	Subscription selectAdminSubscDetailDel(HashMap<String, Integer> map);

	/**
	 * [관리자] 정기구독 상세 조회 - 결제 (한진)
	 */
	Payment selectAdminSubscDetailPay(HashMap<String, Integer> map);

	/**
	 * [관리자] 정기구독 상세 조회 - 쿠폰 (한진)
	 */
	Coupon selectAdminSubscDetailCoupon(HashMap<String, Integer> map);

	/**
	 * [관리자] 배송지 변경 (한진)
	 */
	int updateAdminAddress(Subscription s);

	/**
	 * [관리자] 오늘 날짜의 정기배송 목록 개수 조회 (한진)
	 */
	int selectTodaySubscCount();

	/**
	 * [관리자] 오늘 날짜의 정기배송 목록 조회 (한진)
	 */
	ArrayList<Subscription> selectTodaySubscList(PageInfo pi);


}
