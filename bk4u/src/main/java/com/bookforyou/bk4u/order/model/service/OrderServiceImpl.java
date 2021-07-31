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
}
