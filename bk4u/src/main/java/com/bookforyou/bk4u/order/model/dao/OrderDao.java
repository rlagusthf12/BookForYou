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
}
