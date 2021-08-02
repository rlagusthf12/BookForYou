package com.bookforyou.bk4u.rental.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.rental.model.vo.Rental;

@Repository
public class RentalDao {

	/*
	 * [사용자] 대여 내역 조회 (연지)
	 */
	public ArrayList<Rental> selectRentalList(SqlSessionTemplate sqlSession, PageInfo pi, int memNo) {
		return (ArrayList)sqlSession.selectList("rentalMapper.selectRentalList", pi, memNo);
	}

	/*
	 * [사용자] 대여 내역 개수 조회 (연지)
	 */
	public int selectRentalCount(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("rentalMapper.selectRetalCount", memNo);
	}

}
