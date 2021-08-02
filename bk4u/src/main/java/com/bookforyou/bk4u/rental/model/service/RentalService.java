package com.bookforyou.bk4u.rental.model.service;

import java.util.ArrayList;

import com.bookforyou.bk4u.rental.model.vo.Rental;

public interface RentalService {
	
	/*
	 * [사용자] 대여 내역 조회 (연지)
	 */
	ArrayList<Rental> selectRentalList();

}
