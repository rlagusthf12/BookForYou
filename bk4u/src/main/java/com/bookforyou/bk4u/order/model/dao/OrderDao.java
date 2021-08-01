package com.bookforyou.bk4u.order.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.order.model.vo.Order;

@Repository
public class OrderDao {

	/**
	 * [관리자] 전체 주문 개수 조회 (한진) 
	 */
	public int selectAllListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("orderMapper.selectAllListCount");
	}

	/**
	 * [관리자] 전체 주문 목록 조회 (한진) 
	 */
	public ArrayList<Order> selectAdminOrderList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> filter) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("orderMapper.selectAdminOrderList", filter, rowBounds);
	}

	/*
	 * [사용자] 도서 주문 조회 (연지)
	 */
	public Order selectOrder(SqlSessionTemplate sqlSession, int orderNo) {
		return sqlSession.selectOne("orderMapper.selectOrder");
	}

	/*
	 * [사용자] 도서 상세 주문 리스트 조회 (연지)
	 */
	public ArrayList<Order> selectOrderList(SqlSessionTemplate sqlSession, int orderNo) {
		return (ArrayList)sqlSession.selectList("orderMapper.selectOrderList", orderNo);
	}

	/**
	 * [관리자] '주문확인'인 주문 개수 조회 (한진)
	 */
	public int selectConfirmCnt(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("orderMapper.selectConfirmCnt");
	}

	/**
	 * [관리자] '상품준비중'인 주문 개수 조회 (한진)
	 */
	public int selectProductReadyCnt(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("orderMapper.selectProductReadyCnt");
	}

	/**
	 * [관리자] '배송준비중'인 주문 개수 조회 (한진)
	 */
	public int selectDeliveryReadyCnt(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("orderMapper.selectDeliveryReadyCnt");
	}

	/**
	 * [관리자] '배송중'인 주문 개수 조회 (한진)
	 */
	public int selectDeliveryCnt(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("orderMapper.selectDeliveryCnt");
	}

	/**
	 * [관리자] 검색 조건에 일치하는 주문 개수 조회 (한진)
	 */
	public int selectAdminOListSearchCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("orderMapper.selectAdminOListSearchCount", map);
	}

	/**
	 * [관리자] 검색 조건에 일치하는 주문 목록 조회 (한진)
	 */
	public ArrayList<Order> selectAdminOrderSearchList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> map) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("orderMapper.selectAdminOrderSearchList", map, rowBounds);
	}
}
