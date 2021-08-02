package com.bookforyou.bk4u.mypage.model.service;

import java.util.ArrayList;

import com.bookforyou.bk4u.book.model.vo.Book;

public interface MypageService {
	
	/*
	 * [사용자] 대여 내역 조회 (연지)
	 */
	ArrayList<Book> selectRentalList();

}
