package com.bookforyou.bk4u.book.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookforyou.bk4u.book.model.dao.BookDao;
import com.bookforyou.bk4u.book.model.vo.Book;
import com.bookforyou.bk4u.common.model.vo.PageInfo;

@Service
public class BookServiceImpl implements BookService {
	
	@Autowired
	private BookDao bookDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
	 * [관리자] 전체 도서 개수 조회 (한진)
	 */
	@Override
	public int selectAllListCount() {
		return bookDao.selectAllListCount(sqlSession);
	}

	/**
	 * [관리자] 전체 도서 목록 조회 (한진)
	 */
	@Override
	public ArrayList<Book> selectAdminBookList(PageInfo pi, HashMap<String, String> filter) {
		return bookDao.selectAdminBookList(sqlSession, pi, filter);
	}
	
	/*
	 * [공통] 도서 검색 개수 조회 (연지)
	 */
	@Override
	public int selectSearchBookCount(HashMap<String, String> map) {
		return bookDao.selectSearchBookCount(sqlSession, map);
	}
	
	/*
	 * [공통] 도서 검색 (연지)
	 */
	@Override
	public ArrayList<Book> selectSearchBook(PageInfo pi, HashMap<String, String> map){
		return bookDao.selectSearchBook(sqlSession, pi, map);
	}

	/**
	 * [관리자] '판매중'인 도서 개수 조회 (한진)
	 */
	@Override
	public int selectStatusYCount() {
		return bookDao.selectStatusYCount(sqlSession);
	}

	/**
	 * [관리자] 게시 'Y'인 도서 개수 조회 (한진)
	 */
	@Override
	public int selectSelStatusYCount() {
		return bookDao.selectSelStatusYCount(sqlSession);
	}

	/**
	 * [관리자] 검색조건에 일치하는 도서 개수 조회(한진)
	 */
	@Override
	public int selectAdminSearchCount(HashMap<String, String> map) {
		return bookDao.selectAdminSearchCount(sqlSession, map);
	}

	/**
	 * [관리자] 검색조건에 일치하는 도서 목록 조회(한진)
	 */
	@Override
	public ArrayList<Book> selectAdminSearchList(PageInfo pi, HashMap<String, String> map) {
		return bookDao.selectAdminSearchList(sqlSession, pi, map);
	}
	
	/*
	 * [공통] 도서 상세 조회 (연지)
	 */
	@Override
	public Book selectBook(int bkNo) {
		return bookDao.selectBook(sqlSession, bkNo);
	}

	/*
	 * [공통] 도서 장바구니 조회 (연지)
	 */
	@Override
	public ArrayList<Book> selectCartList(int memNo) {
		return bookDao.selectCartList(sqlSession, memNo);
	}

	/**
	 * [관리자] 도서 상태 변경 + 다중체크박스 (한진)
	 */
	@Override
	public int updateBookStatus(HashMap<String, String> map) {
		return bookDao.updateBookStatus(sqlSession, map);
	}

	/*
	 * [공통] 도서 장바구니 추가
	 */
	@Override
	public int updateCart(int memNo, int bkNo) {
		return bookDao.updateCart(sqlSession, memNo, bkNo);
	}

	/**
	 * [관리자] 도서 상세 보기 (한진)
	 */
	@Override
	public Book selectAdminBookDetail(int bkNo) {
		return bookDao.selectAdminBookDetail(sqlSession, bkNo);
	}
}
