package com.bookforyou.bk4u.order.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.member.model.vo.Member;
import com.bookforyou.bk4u.order.model.vo.Order;
import com.bookforyou.bk4u.order.model.vo.OrderDetail;
import com.bookforyou.bk4u.payment.model.vo.Payment;

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
		return sqlSession.selectOne("orderMapper.selectOrder", orderNo);
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
	 * [관리자] '배송완료'인 주문 개수 조회 (한진) 
	 */
	public int selectFinishCnt(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("orderMapper.selectFinishCnt");
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

	/**
	 * [관리자] 관리자 메모 등록/수정 (한진) 
	 */
	public int updateAdminMemo(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.update("orderMapper.updateAdminMemo", map);
	}

	/**
	 * [관리자] 관리자 메모 삭제 (한진)
	 */
	public int deleteAdminMemo(SqlSessionTemplate sqlSession, String orderNo) {
		return sqlSession.delete("orderMapper.deleteAdminMemo", orderNo);
	}

	/**
	 * [관리자] 주문 상세 조회 - 주문 내역 조회 (한진)
	 */
	public ArrayList<Order> selectAdminOrderDetail(SqlSessionTemplate sqlSession, int orderNo) {
		return (ArrayList)sqlSession.selectList("orderMapper.selectAdminOrderDetail", orderNo);
	}

	/**
	 * [관리자] 주문 상세 조회 - 주문된 도서 조회 (한진)
	 */
	public ArrayList<OrderDetail> selectAdminOrderedBook(SqlSessionTemplate sqlSession, int orderNo) {
		return (ArrayList)sqlSession.selectList("orderMapper.selectAdminOrderedBook", orderNo);
	}

	/**
	 * [관리자] 주문 상세 조회 - 주문한 회원 조회 (한진)
	 */
	public Member selectAdminOrderedMem(SqlSessionTemplate sqlSession, int orderNo) {
		return sqlSession.selectOne("memberMapper.selectAdminOrderedMem", orderNo);
	}

	public Payment selectAdminOrderedPayment(SqlSessionTemplate sqlSession, int orderNo) {
		return sqlSession.selectOne("paymentMapper.selectOrderedPayment", orderNo);
	}

	
}
