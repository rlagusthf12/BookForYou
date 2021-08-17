package com.bookforyou.bk4u.rental.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.rental.model.dao.RentalDao;
import com.bookforyou.bk4u.rental.model.vo.Rental;

@Service
public class RentalServiceImpl implements RentalService {
	
	@Autowired
	private RentalDao rentalDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/*
	 * [사용자] 대여 내역 개수 조회 (연지)
	 */
	@Override
	public int selectRentalCount(int memNo) {
		return rentalDao.selectRentalCount(sqlSession, memNo);
	}
	
	/*
	 * [사용자] 대여 내역 조회 (연지)
	 */
	@Override
	public ArrayList<Rental> selectRentalList(PageInfo pi, int memNo) {
		return rentalDao.selectRentalList(sqlSession, pi, memNo);
	}
	
	/*
	 * [사용자] 대여 내역 상세 조회 (연지)
	 */
	@Override
	public Rental selectRental(int rentalNo){
		return rentalDao.selectRental(sqlSession, rentalNo);
	}

	/*
	 * [사용자] 도서 대여 신청 (연지)
	 */
	@Override
	public int insertRental(HashMap<String, Integer> map) {
		return rentalDao.insertRental(sqlSession, map);
	}

	/**
	 * [관리자] 대여 목록 개수 조회 (한진)
	 */
	@Override
	public int selectAdminRentalListCount() {
		return rentalDao.selectAdminRentalListCount(sqlSession);
	}

	/**
	 * [관리자] '예약중'인 목록 개수 조회 (한진)
	 */
	@Override
	public int selectAdminReserveListCount() {
		return rentalDao.selectAdminReserveListCount(sqlSession);
	}

	/**
	 * [관리자] '대여중'인 목록 개수 조회 (한진)
	 */
	@Override
	public int selectAdminRentalIngListCount() {
		return rentalDao.selectAdminRentalIngListCount(sqlSession);
	}

	/**
	 * [관리자] '반납완료'인 목록 개수 조회 (한진)
	 */
	@Override
	public int selectAdminReturnListCount() {
		return rentalDao.selectAdminReturnListCount(sqlSession);
	}

	/**
	 * [관리자] '연체'인 목록 개수 조회 (한진)
	 */
	@Override
	public int selectAdminOverdueListCount() {
		return rentalDao.selectAdminOverdueListCount(sqlSession);
	}

	/**
	 * [관리자] '예약취소'인 목록 개수 조회 (한진)
	 */
	@Override
	public int selectAdminRentalCancelListCount() {
		return rentalDao.selectAdminRentalCancelListCount(sqlSession);
	}

	/**
	 * [관리자] 대여 목록 조회 (한진)
	 */
	@Override
	public ArrayList<Rental> selectAdminRentalList(PageInfo pi, HashMap<String, Integer> filter) {
		return rentalDao.selectAdminRentalList(sqlSession, pi, filter);
	}

	/**
	 * [관리자] 검색 조건에 일치하는 목록 개수 조회 (한진)
	 */
	@Override
	public int selectAdminListSearchCount(HashMap<String, String> map) {
		return rentalDao.selectAdminListSearchCount(sqlSession, map);
	}

	/**
	 * [관리자] 검색 조건에 일치하는 목록 조회 (한진)
	 */
	@Override
	public ArrayList<Rental> selectAdminRentalSearchList(PageInfo pi, HashMap<String, String> map) {
		return rentalDao.selectAdminRentalSearchList(sqlSession, pi, map);
	}

	/**
	 * [관리자] 대여 상태 변경 (한진)
	 */
	@Override
	public int updateRentalStatus(HashMap<String, String> map) {
		return rentalDao.updateRentalStatus(sqlSession, map);
	}

	/**
	 * [관리자] '대여중' 수령일 변경 (한진)
	 */
	@Override
	public int updateRentalReceiveDate(HashMap<String, String> map) {
		return rentalDao.updateRentalReceiveDate(sqlSession, map);
	}

	/**
	 * [관리자] '반납완료' 반납일 변경 (한진)
	 */
	@Override
	public int updateRentalReturnDate(HashMap<String, String> map) {
		return rentalDao.updateRentalReturnDate(sqlSession, map);
	}

}
