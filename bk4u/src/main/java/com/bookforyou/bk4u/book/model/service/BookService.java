package com.bookforyou.bk4u.book.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.bookforyou.bk4u.book.model.vo.Book;
import com.bookforyou.bk4u.booklist.model.vo.Booklist;
import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.order.model.vo.Order;

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
	
	/**
	 * [관리자] 검색된 도서 목록 조회 (한진)
	 */
	ArrayList<Book> selectAdminSearchList(PageInfo pi, HashMap<String, String> map);

	/*
	 * [공통] 도서 상세 조회 (연지)
	 */
	Book selectBook(int bkNo);

	/*
	 * [공통] 도서 장바구니 조회
	 */
	ArrayList<Book> selectCartList(int memNo);
	
	/**
	 * [관리자] 도서 상태 변경 + 다중체크박스 (한진)
	 */
	int updateBookStatus(HashMap<String, String> map);

	/*
	 * [공통] 도서 장바구니 유무 확인 (연지)
	 */
	int checkCart(HashMap<String, Integer> map);

	/*
	 * [공통] 도서 장바구니 수량 증가 (연지)
	 */
	int updateCart(HashMap<String, Integer> map);

	/*
	 * [공통] 도서 장바구니 추가 (연지)
	 */
	int insertCart(HashMap<String, Integer> map);

	/**
	 * [관리자] 도서 상세 보기 (한진)
	 */
	ArrayList<Book> selectAdminBookDetail(int bkNo);
	
	/**
	 * [관리자] 도서 수정 (한진)
	 */
	int updateAdminBook(Book b);

	/**
	 * [관리자] 도서 추천 관심사 삽입 (한진)
	 */
	int insertAdminBookItrs(Book b);

	/**
	 * [관리자] 도서 추천 관심사 조회 (한진)
	 */
	List<String> selectAdminBookInterest(Book b);

	/**
	 * [관리자] 도서 추천 관심사 삭제 (한진)
	 */
	int deleteAdminBookItrs(Book b);

	/**
	 * [관리자] 도서 등록 (한진)
	 */
	int insertAdminBook(Book b);

	/**
	 * [관리자] 마지막 bkNo알아내기 (한진)
	 */
	int selectAdminLastBkNo();
	
	/*
	 * [공통] 도서 장바구니 삭제 (연지)
	 */
	int deleteCart(HashMap<String, Integer> map);

	/*
	 * [공통] 도서 장바구니 수량 갱신 (연지)
	 */
	int updateCartQty(HashMap<String, Integer> map);

	/*
	 * [공통] 도서 리스트 유무 확인 (연지)
	 */
	int checkList(HashMap<String, Integer> map);

	/*
	 * [공통] 도서 리스트 추가 (연지)
	 */
	int insertList(HashMap<String, Integer> map);

	/**
	 * [관리자] 도서 삭제 (한진)
	 */
	int deleteAdminBook(String bn);

	/**
	 * [관리자] 도서 관심사 행 삭제 (한진)
	 */
	int deleteAdminBookInterest(String bn);

	/**
	 * [메인] 베스트 셀러 조회 (한진)
	 */
	ArrayList<Book> selectMainBestSeller();

	/**
	 * [메인] 도서 추천 조회 - 로그인 했을 경우 (한진)
	 */
	ArrayList<Book> selectMainBookRecommand(int memNo);

	/**
	 * [메인] 도서 추천 조회 - 로그인을 하지 않았을 경우 (한진)
	 */
	ArrayList<Book> selectMainBookRecommandToAll();

	/*
	 * [공통] 도서 독서록 조회 (연지)
	 */
	ArrayList<Booklist> selectBookList(int bkNo);
}
