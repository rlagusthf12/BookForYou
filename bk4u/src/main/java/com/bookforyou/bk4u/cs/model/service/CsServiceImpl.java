package com.bookforyou.bk4u.cs.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.cs.model.dao.CsDao;

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
	public int selectAdminCancelCount(HashMap<String, String> filter) {
		return cDao.selectAdminCancelCount(sqlSession, filter);
	}

	/**
	 * [관리자] '반품' 목록 개수 조회 (한진)
	 */
	@Override
	public int selectAdminReturnCount(HashMap<String, String> filter) {
		return cDao.selectAdminReturnCount(sqlSession, filter);
	}

	/**
	 * [관리자] '환불' 목록 개수 조회 (한진)
	 */
	@Override
	public int selectAdminRefundCount(HashMap<String, String> filter) {
		return cDao.selectAdminRefundCount(sqlSession, filter);
	}

	/**
	 * [관리자] '주문취소' 목록 조회 (한진)
	 */
	@Override
	public ArrayList selectAdminCancelList(PageInfo pi, HashMap<String, String> filter) {
		return cDao.selectAdminCancelList(sqlSession, pi, filter);
	}

	/**
	 * [관리자] '반품' 목록 조회 (한진)
	 */
	@Override
	public ArrayList selectAdminReturnList(PageInfo pi, HashMap<String, String> filter) {
		return cDao.selectAdminReturnList(sqlSession, pi, filter);
	}

	/**
	 * [관리자] '환불' 목록 조회 (한진)
	 */
	@Override
	public ArrayList selectAdminRefundList(PageInfo pi, HashMap<String, String> filter) {
		return cDao.selectAdminRefundList(sqlSession, pi, filter);
	}
	
	

}
