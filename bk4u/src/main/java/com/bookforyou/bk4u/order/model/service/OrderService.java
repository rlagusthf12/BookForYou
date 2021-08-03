package com.bookforyou.bk4u.order.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.member.model.vo.Coupon;
import com.bookforyou.bk4u.member.model.vo.Member;
import com.bookforyou.bk4u.order.model.vo.Order;
import com.bookforyou.bk4u.order.model.vo.OrderDetail;
import com.bookforyou.bk4u.payment.model.vo.Payment;

public interface OrderService {

	/**
	 * [관리자] 전체 주문 개수 조회 (한진)
	 */
	int selectAllListCount();

	/**
	 * [관리자] 전체 주문 목록 조회 (한진) 
	 */
	ArrayList<Order> selectAdminOrderList(PageInfo pi, HashMap<String, String> filter);

	/*
	 * [사용자] 도서 주문 조회 (연지)
	 */
	Order selectOrder(int orderNo);

	/*
	 * [사용자] 도서 상세 주문 리스트 조회 (연지)
	 */
	ArrayList<Order> selectOrderList(int orderNo);

	/**
	 * [관리자] '주문확인'인 주문 개수 조회 (한진)
	 */
	int selectConfirmCnt();

	/**
	 * [관리자] '상품준비중'인 주문 개수 조회 (한진)
	 */
	int selectProductReadyCnt();

	/**
	 * [관리자] '배송준비중'인 주문 개수 조회 (한진)
	 */
	int selectDeliveryReadyCnt();
	
	/**
	 * [관리자] '배송중'인 주문 개수 조회 (한진)
	 */
	int selectDeliveryCnt();
	
	/**
	 * [관리자] '배송완료'인 주문 개수 조회 (한진)
	 */
	int selectFinishCnt();

	/**
	 * [관리자] 검색 조건에 일치하는 주문 개수 조회 (한진)
	 */
	int selectAdminOListSearchCount(HashMap<String, String> map);

	/**
	 * [관리자] 검색 조건에 일치하는 주문 목록 조회 (한진)
	 */
	ArrayList<Order> selectAdminOrderSearchList(PageInfo pi, HashMap<String, String> map);

	/**
	 * [관리자] 관리자 메모 등록/수정 (한진) 
	 */
	int updateAdminMemo(HashMap<String, String> map);

	/**
	 * [관리자] 관리자 메모 삭제 (한진)
	 */
	int deleteAdminMemo(String orderNo);

	/**
	 * [관리자] 주문 상세 조회 - 주문 내역 조회 (한진)
	 */
	ArrayList<Order> selectAdminOrderDetail(int orderNo);

	/**
	 * [관리자] 주문 상세 조회 - 주문된 도서 조회 (한진)
	 */
	ArrayList<OrderDetail> selectAdminOrderedBook(int orderNo);

	/**
	 * [관리자] 주문 상세 조회 - 주문한 회원 조회 (한진)
	 */
	Member selectAdminOrderedMem(int orderNo);

	/**
	 * [관리자] 주문 상세 조회 - 사용된 결제 내역 조회 (한진)
	 */
	Payment selectAdminOrderedPayment(int orderNo);

	/**
	 * [관리자] 주문 상세 조회 - 사용된 쿠폰 조회 (한진)
	 */
	Coupon selectAdminOrderedUsedCoupon(int orderNo);

	/**
	 * [관리자] 주문 배송지 변경 (한진)
	 */
	int updateAdminAddress(Order o);
	
}
