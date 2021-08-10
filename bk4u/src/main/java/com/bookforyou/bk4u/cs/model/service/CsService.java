package com.bookforyou.bk4u.cs.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.cs.model.vo.Cancel;
import com.bookforyou.bk4u.cs.model.vo.Refund;
import com.bookforyou.bk4u.cs.model.vo.Return;
import com.bookforyou.bk4u.order.model.vo.Order;

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

	/**
	 * [관리자] 주문취소 상세 조회 (한진)
	 */
	Cancel selectAdminCancelDetail(int cancelNo);

	/**
	 * [관리자] 주문취소  - orders테이블 상태 변경 (한진)
	 */
	int updateAdminCsOrderStatus(Order o);

	/**
	 * [관리자] 주문취소 - cancel테이블 상태 변경 (한진)
	 */
	int updateAdminCancelStatus(Order o);

	/**
	 * [관리자] 반품 상세 조회 (한진)
	 */
	Return selectAdminReturnDetail(int returnNo);

	/**
	 * [관리자] 반품 처리 (한진)
	 */
	int updateAdminReturnStatus(Order o);

	/**
	 * [관리자] 환불 상세 조회 (한진)
	 */
	Refund selectAdminRefundDetail(int refundNo);

	/**
	 * [관리자] 환불 처리 (한진)
	 */
	int updateAdminRefundStatus(int refundNo);

	/**
	 * [관리자] 환불 테이블 insert (한진)
	 */
	int insertAdminRefundStatus(Refund r);

	/**
	 * [관리자] 환불 - 사용된 쿠폰 반환 (한진)
	 */
	int updateAdminRefundCoupon(Refund r);

	/**
	 * [관리자] 환불 - 사용된 포인트 반환 (한진)
	 */
	int insertAdminRefundPoint(Refund r);

	

	
	
}
