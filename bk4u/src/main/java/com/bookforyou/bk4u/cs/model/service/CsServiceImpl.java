package com.bookforyou.bk4u.cs.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.cs.model.dao.CsDao;
import com.bookforyou.bk4u.cs.model.vo.Cancel;
import com.bookforyou.bk4u.cs.model.vo.Refund;
import com.bookforyou.bk4u.cs.model.vo.Return;

@Service
public class CsServiceImpl implements CsService{

	@Autowired 
	private CsDao cDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
	 * [관리자] '주문취소' 목록 개수 조회 (한진)
	 */
	@Override
	public int selectAdminCancelCount() {
		return cDao.selectAdminCancelCount(sqlSession);
	}

	/**
	 * [관리자] '반품' 목록 개수 조회 (한진)
	 */
	@Override
	public int selectAdminReturnCount() {
		return cDao.selectAdminReturnCount(sqlSession);
	}

	/**
	 * [관리자] '환불' 목록 개수 조회 (한진)
	 */
	@Override
	public int selectAdminRefundCount() {
		return cDao.selectAdminRefundCount(sqlSession);
	}

	/**
	 * [관리자] '주문취소' 목록 조회 (한진)
	 */
	@Override
	public ArrayList<Cancel> selectAdminCancelList(PageInfo pi, HashMap<String, String> filter) {
		return cDao.selectAdminCancelList(sqlSession, pi, filter);
	}

	/**
	 * [관리자] '반품' 목록 조회 (한진)
	 */
	@Override
	public ArrayList<Return> selectAdminReturnList(PageInfo pi, HashMap<String, String> filter) {
		return cDao.selectAdminReturnList(sqlSession, pi, filter);
	}

	/**
	 * [관리자] '환불' 목록 조회 (한진)
	 */
	@Override
	public ArrayList<Refund> selectAdminRefundList(PageInfo pi, HashMap<String, String> filter) {
		return cDao.selectAdminRefundList(sqlSession, pi, filter);
	}

	/**
	 * [관리자] 검색조건에 일치하는 CS목록 개수 (한진)
	 */
	@Override
	public int selectAdminSearchCount(HashMap<String, String> map) {
		return cDao.selectAdminSearchCount(sqlSession, map);
	}

	/**
	 * [관리자] 검색조건에 일치하는 '주문취소'목록 조회 (한진)
	 */
	@Override
	public ArrayList<Cancel> selectAdminSearchCancelList(PageInfo pi, HashMap<String, String> map) {
		return cDao.selectAdminSearchCancelList(sqlSession, pi, map);
	}

	/**
	 * [관리자] 검색조건에 일치하는 '반품'목록 조회 (한진)
	 */
	@Override
	public ArrayList<Return> selectAdminSearchReturnList(PageInfo pi, HashMap<String, String> map) {
		return cDao.selectAdminSearchReturnList(sqlSession, pi, map);
	}

	/**
	 * [관리자] 검색조건에 일치하는 '환불'목록 조회 (한진)
	 */
	@Override
	public ArrayList<Refund> selectAdminSearchRefundList(PageInfo pi, HashMap<String, String> map) {
		return cDao.selectAdminSearchRefundList(sqlSession, pi, map);
	}

	/**
	 * [관리자] 주문취소 상세 조회 (한진)
	 */
	@Override
	public Cancel selectAdminCancelDetail(int cancelNo) {
		return cDao.selectAdminCancelDetail(sqlSession, cancelNo);
	}

	/**
	 * [관리자] 주문 취소 - orders테이블 상태 변경 (한빈)
	 */
	@Override
	public int updateAdminCsOrderStatus(int orderNo) {
		return cDao.updateAdminCsOrderStatus(sqlSession, orderNo);
	}

	/**
	 * [관리자] 주문취소 - cancel테이블 상태 변경 (한진)
	 */
	@Override
	public int updateAdminCancelStatus(int cancelNo) {
		return cDao.updateAdminCancelStatus(sqlSession, cancelNo);
	}
	
	

}
