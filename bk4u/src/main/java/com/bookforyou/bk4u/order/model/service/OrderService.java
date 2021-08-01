package com.bookforyou.bk4u.order.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.order.model.vo.Order;

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
	 * [관리자] 검색 조건에 일치하는 주문 개수 조회 (한진)
	 */
	int selectAdminOListSearchCount(HashMap<String, String> map);

	/**
	 * [관리자] 검색 조건에 일치하는 주문 목록 조회 (한진)
	 */
	ArrayList<Order> selectAdminOrderSearchList(PageInfo pi, HashMap<String, String> map);
}
