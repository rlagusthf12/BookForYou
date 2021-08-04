package com.bookforyou.bk4u.cs.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.cs.model.vo.Cancel;
import com.bookforyou.bk4u.cs.model.vo.Refund;
import com.bookforyou.bk4u.cs.model.vo.Return;

public interface CsService {

	/**
	 * [관리자] '주문취소' 목록 개수 조회 (한진)
	 */
	int selectAdminCancelCount();

	/**
	 * [관리자] '반품' 목록 개수 조회 (한진)
	 */
	int selectAdminReturnCount();

	/**
	 * [관리자] '환불' 목록 개수 조회 (한진)
	 */
	int selectAdminRefundCount();

	/**
	 * [관리자] '주문취소' 목록 조회 (한진)
	 */
	ArrayList<Cancel> selectAdminCancelList(PageInfo pi, HashMap<String, String> filter);

	/**
	 * [관리자] '반품' 목록 조회 (한진)
	 */
	ArrayList<Return> selectAdminReturnList(PageInfo pi, HashMap<String, String> filter);

	/**
	 * [관리자] '환불' 목록 조회 (한진)
	 */
	ArrayList<Refund> selectAdminRefundList(PageInfo pi, HashMap<String, String> filter);

	/**
	 * [관리자] 검색조건에 일치하는 CS목록 개수 (한진)
	 */
	int selectAdminSearchCount(HashMap<String, String> map);

	/**
	 * [관리자] 검색조건에 일치하는 '주문취소'목록 조회 (한진)
	 */
	ArrayList<Cancel> selectAdminSearchCancelList(PageInfo pi, HashMap<String, String> map);

	/**
	 * [관리자] 검색조건에 일치하는 '반품'목록 조회 (한진)
	 */
	ArrayList<Return> selectAdminSearchReturnList(PageInfo pi, HashMap<String, String> map);

	/**
	 * [관리자] 검색조건에 일치하는 '환불' 목록 조회 (한진)
	 */
	ArrayList<Refund> selectAdminSearchRefundList(PageInfo pi, HashMap<String, String> map);

	
	
}
