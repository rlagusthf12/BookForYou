package com.bookforyou.bk4u.book.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.bookforyou.bk4u.book.model.vo.Book;
import com.bookforyou.bk4u.common.model.vo.PageInfo;

public interface BookService {

	/**
	 * [관리자] 전체 도서 개수 조회 (한진)
	 */
	int selectAllListCount();
	
	/**
	 * [관리자] 전체 도서 목록 조회 (한진)
	 */
	ArrayList<Book> selectAdminBookList(PageInfo pi, HashMap<String, String> filter);

	/*
	 * [공통] 도서 검색 카운트 조회 (연지)
	 */
	int selectSearchBookCount(HashMap<String, String> map);
	
	/*
	 * [공통] 도서 검색 (연지)
	 */
	ArrayList<Book> selectSearchBook(PageInfo pi, HashMap<String, String> map);

	/**
	 * [관리자] '판매중'인 도서 개수 조회 (한진)
	 */
	int selectStatusYCount();
	
	/**
	 * [관리자] 게시'Y'인 도서 개수 조회 (한진)
	 */
	int selectSelStatusYCount();
	
	/**
	 * [관리자] 검색조건에 일치하는 도서 개수 조회 (한진)
	 */
	int selectAdminSearchCount(HashMap<String, String> map);
	
	ArrayList<Book> selectAdminSearchList(PageInfo pi, HashMap<String, String> map);

	/*
	 * [공통] 도서 상세 조회 (연지)
	 */
	Book selectBook(int bkNo);

	
}
