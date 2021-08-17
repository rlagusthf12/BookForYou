package com.bookforyou.bk4u.order.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookforyou.bk4u.book.model.vo.Book;
import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.couponDetail.model.vo.CouponDetail;
import com.bookforyou.bk4u.member.model.vo.Member;
import com.bookforyou.bk4u.order.model.dao.OrderDao;
import com.bookforyou.bk4u.order.model.vo.Order;
import com.bookforyou.bk4u.order.model.vo.OrderDetail;
import com.bookforyou.bk4u.payment.model.vo.Payment;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderDao oDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
	 * [관리자] 전체 주문 개수 조회 (한진)
	 */
	@Override
	public int selectAllListCount() {
		return oDao.selectAllListCount(sqlSession);
	}

	/**
	 * [관리자] 전체 주문 목록 조회 (한진)
	 */
	@Override
	public ArrayList<Order> selectAdminOrderList(PageInfo pi, HashMap<String, String> filter) {
		return oDao.selectAdminOrderList(sqlSession, pi, filter);
	}

	/*
	 * [사용자] 도서 주문 조회 (연지)
	 */
	@Override
	public Order selectOrder(int orderNo) {
		return oDao.selectOrder(sqlSession, orderNo);
	}

	/*
	 * [사용자] 도서 상세 주문 리스트 조회 (연지)
	 */
	@Override
	public ArrayList<Order> selectOrderList(int orderNo){
		return oDao.selectOrderList(sqlSession, orderNo);
	}

	/**
	 * [관리자] '주문확인'인 주문 개수 조회 (한진)
	 */
	@Override
	public int selectConfirmCnt() {
		return oDao.selectConfirmCnt(sqlSession);
	}

	/**
	 * [관리자] '상품준비중'인 주문 개수 조회 (한진)
	 */
	@Override
	public int selectProductReadyCnt() {
		return oDao.selectProductReadyCnt(sqlSession);
	}

	/**
	 * [관리자] '배송준비중'인 주문 개수 조회 (한진)
	 */
	@Override
	public int selectDeliveryReadyCnt() {
		return oDao.selectDeliveryReadyCnt(sqlSession);
	}

	/**
	 * [관리자] '배송중'인 주문 개수 조회 (한진)
	 */
	@Override
	public int selectDeliveryCnt() {
		return oDao.selectDeliveryCnt(sqlSession);
	}
	
	/**
	 * [관리자] '배송완료'인 주문 개수 조회 (한진)
	 */
	@Override
	public int selectFinishCnt() {
		return oDao.selectFinishCnt(sqlSession);
	}

	/**
	 * [관리자] 검색 조건에 일치하는 주문 개수 조회 (한진)
	 */
	@Override
	public int selectAdminOListSearchCount(HashMap<String, String> map) {
		return oDao.selectAdminOListSearchCount(sqlSession, map);
	}

	/**
	 * [관리자] 검색 조건에 일치하는 주문 목록 조회 (한진)
	 */
	@Override
	public ArrayList<Order> selectAdminOrderSearchList(PageInfo pi, HashMap<String, String> map) {
		return oDao.selectAdminOrderSearchList(sqlSession, pi, map);
	}

	/**
	 * [관리자] 관리자 메모 등록/수정 (한진)
	 */
	@Override
	public int updateAdminMemo(HashMap<String, String> map) {
		return oDao.updateAdminMemo(sqlSession, map);
	}

	/**
	 * [관리자] 관리자 메모 삭제 (한진)
	 */
	@Override
	public int deleteAdminMemo(String orderNo) {
		return oDao.deleteAdminMemo(sqlSession, orderNo);
	}

	/**
	 * [관리자] 주문 상세 조회 - 주문 내역 조회 (한진)
	 */
	@Override
	public Order selectAdminOrderDetail(int orderNo) {
		return oDao.selectAdminOrderDetail(sqlSession, orderNo);
	}

	/**
	 * [관리자] 주문 상세 조회 - 주문된 도서 조회(한진)
	 */
	@Override
	public ArrayList<OrderDetail> selectAdminOrderedBook(int orderNo) {
		return oDao.selectAdminOrderedBook(sqlSession, orderNo);
	}

	/**
	 * [관리자] 주문 상세 조회 - 주문한 회원 조회 (한진)
	 */
	@Override
	public Member selectAdminOrderedMem(int orderNo) {
		return oDao.selectAdminOrderedMem(sqlSession, orderNo);
	}

	/**
	 * [관리자] 주문 상세 조회 - 사용된 결제 내역 조회 (한진)
	 */
	@Override
	public Payment selectAdminOrderedPayment(int orderNo) {
		return oDao.selectAdminOrderedPayment(sqlSession, orderNo);
	}

	/**
	 * [관리자] 주문 상세 조회 - 사용된 쿠폰 조회 (한진)
	 */
	@Override
	public CouponDetail selectAdminOrderedUsedCoupon(int orderNo) {
		return oDao.selectAdminOrderUsedCoupon(sqlSession, orderNo);
	}

	/**
	 * [관리자] 주문 배송지 변경 (한진)
	 */
	@Override
	public int updateAdminAddress(Order o) {
		return oDao.updateAdminAddress(sqlSession, o);
	}

	/**
	 * [관리자] 주문 상태 변경 (한진)
	 */
	@Override
	public int updateAdminOrderConfirm(HashMap<String, String> map) {
		return oDao.updateAdminOrderConfirm(sqlSession, map);
	}

	/**
	 * [관리자] 주문 취소 테이블 insert (한진)
	 */
	@Override
	public int insertAdminCancel(HashMap<String, String> map) {
		return oDao.insertAdminCancel(sqlSession, map);
	}

	/**
	 * [관리자] 운송장정보 등록/저장 (한진)
	 */
	@Override
	public int updateDeliveryInfo(HashMap<String, String> map) {
		return oDao.updateDeliveryInfo(sqlSession, map);
	}

	/**
	 * [관리자] 반품 테이블 insert(한진)
	 */
	@Override
	public int insertAdminReturn(HashMap<String, String> map) {
		return oDao.insertAdminReturn(sqlSession, map);
	}

	/*
	 * [사용자] 주문 도서 조회 (연지)
	 */
	@Override
	public Book selectOrderBook(HashMap<String, Integer> map) {
		return oDao.selectOrderBook(sqlSession, map);
	}

	/*
	 * [사용자] 주문 정보 입력 (연지)
	 */
	@Override
	public int insertOrderInfo(Order o) {
		return oDao.insertOrderInfo(sqlSession, o);
	}

	/*
	 * [사용자] 주문 상세 정보 입력 (연지)
	 */
	@Override
	public int insertOrderDetailInfo(Map<String, Object> m) {
		return oDao.insertOrderDetailInfo(sqlSession, m);
	}

	/*
	 * [사용자] 사용한 포인트 차감 (연지)
	 */
	@Override
	public int insertUsedPoint(Order o) {
		return oDao.insertUsedPoint(sqlSession, o);
	}
	
}
