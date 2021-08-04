package com.bookforyou.bk4u.cs.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.bookforyou.bk4u.common.model.vo.PageInfo;

public interface CsService {

	/**
	 * [관리자] '주문취소' 목록 개수 조회 (한진)
	 */
	int selectAdminCancelCount(HashMap<String, String> filter);

	/**
	 * [관리자] '반품' 목록 개수 조회 (한진)
	 */
	int selectAdminReturnCount(HashMap<String, String> filter);

	/**
	 * [관리자] '환불' 목록 개수 조회 (한진)
	 */
	int selectAdminRefundCount(HashMap<String, String> filter);

	/**
	 * [관리자] '주문취소' 목록 조회 (한진)
	 */
	ArrayList selectAdminCancelList(PageInfo pi, HashMap<String, String> filter);

	/**
	 * [관리자] '반품' 목록 조회 (한진)
	 */
	ArrayList selectAdminReturnList(PageInfo pi, HashMap<String, String> filter);

	/**
	 * [관리자] '환불' 목록 조회 (한진)
	 */
	ArrayList selectAdminRefundList(PageInfo pi, HashMap<String, String> filter);

	
	
}
