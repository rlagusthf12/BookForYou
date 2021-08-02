package com.bookforyou.bk4u.rental.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bookforyou.bk4u.rental.model.vo.Rental;

@Repository
public class RentalDao {

	/*
	 * [사용자] 대여 내역 조회 (연지)
	 */
	public ArrayList<Rental> selectRentalList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("rentalMapper.selectRentalList");
	}

}
