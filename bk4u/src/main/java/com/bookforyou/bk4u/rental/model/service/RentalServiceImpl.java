package com.bookforyou.bk4u.rental.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookforyou.bk4u.rental.model.dao.RentalDao;
import com.bookforyou.bk4u.rental.model.vo.Rental;

@Service
public class RentalServiceImpl implements RentalService {
	
	@Autowired
	private RentalDao rentalDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/*
	 * [사용자] 대여 내역 조회 (연지)
	 */
	@Override
	public ArrayList<Rental> selectRentalList() {
		return rentalDao.selectRentalList(sqlSession);
	}

}
