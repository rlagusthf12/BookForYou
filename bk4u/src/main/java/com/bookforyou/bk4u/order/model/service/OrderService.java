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
	
	
}
