package com.bookforyou.bk4u.rental.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.rental.model.vo.Rental;

@Repository
public class RentalDao {

	/*
	 * [사용자] 대여 내역 개수 조회 (연지)
	 */
	public int selectRentalCount(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("rentalMapper.selectRentalCount", memNo);
	}

	/*
	 * [사용자] 대여 내역 리스트 조회 (연지)
	 */
	public ArrayList<Rental> selectRentalList(SqlSessionTemplate sqlSession, PageInfo pi, int memNo) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("rentalMapper.selectRentalList", memNo, rowBounds);
	}

	/*
	 * [사용자] 대여 내역 조회 (연지)
	 */
	public Rental selectRental(SqlSessionTemplate sqlSession, int rentalNo) {
		return sqlSession.selectOne("rentalMapper.selectRental", rentalNo);
	}

	/*
	 * [사용자] 도서 대여 신청 (연지)
	 */
	public int insertRental(SqlSessionTemplate sqlSession, HashMap<String, Integer> map) {
		return sqlSession.insert("rentalMapper.insertRental", map);
	}

	/**
	 * [관리자] 대여 목록 개수 조회 (한진)
	 */
	public int selectAdminRentalListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("rentalMapper.selectAdminRentalListCount");
	}

	/*
	 * [관리자] '예약중'인 목록 개수 조회 (한진)
	 */
	public int selectAdminReserveListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("rentalMapper.selectAdminReserveListCount");
	}

	/**
	 * [관리자] '대여중'인 목록 개수 조회 (한진)
	 */
	public int selectAdminRentalIngListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("rentalMapper.selectAdminRentalIngListCount");
	}

	/**
	 * [관리자] '반납완료'인 목록 개수 조회 (한진)
	 */
	public int selectAdminReturnListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("rentalMapper.selectAdminReturnListCount");
	}

	/**
	 * [관리자] '연체'인 목록 개수 조회 (한진)
	 */
	public int selectAdminOverdueListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("rentalMapper.selectAdminOverdueListCount");
	}

	/**
	 * [관리자] '예약취소'인 목록 개수 조회 (한진)
	 */
	public int selectAdminRentalCancelListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("rentalMapper.selectAdminRentalCancelListCount");
	}

	/**
	 * [관리자] 대여 목록 조회 (한진)
	 */
	public ArrayList<Rental> selectAdminRentalList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, Integer> filter) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("rentalMapper.selectAdminRentalList", filter, rowBounds);
	}

}
