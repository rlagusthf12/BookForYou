package com.bookforyou.bk4u.order.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.order.model.dao.OrderDao;
import com.bookforyou.bk4u.order.model.vo.Order;

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

	
}
