package com.bookforyou.bk4u.book.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bookforyou.bk4u.book.model.vo.Book;
import com.bookforyou.bk4u.common.model.vo.PageInfo;

@Repository
public class BookDao {
	
	/**
	 * [관리자] 도서 전체 개수  조회 (한진)
	 */
	public int selectAllListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("bookMapper.selectAllListCount");
	}
	
	/**
	 * [관리자] 도서 전체 목록 조회 (한진)
	 */
	public ArrayList<Book> selectAdminBookList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> filter) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("bookMapper.selectAdminBookList", filter, rowBounds);
	}
	
	/*
	 * [공통] 도서 검색 개수 조회 (연지)
	 */
	public int selectSearchBookCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("bookMapper.selectSearchBookCount");
	}
	
	/*
	 * [공통] 도서 검색 (연지)
	 */
	public ArrayList<Book> selectSearchBook(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> map) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("bookMapper.selectSearchBook", map, rowBounds);
	}
	
	/**
	 * [관리자] '판매중'인 도서 개수 조회 (한진)
	 */
	public int selectStatusYCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("bookMapper.selectStatusYCount");
	}
	
	/**
	 * [관리자]  게시 'Y'인 도서 개수 조회 (한진)
	 */
	public int selectSelStatusYCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("bookMapper.selectSelStatusYCount");
	}
	
	/**
	 * [관리자] 검색조건에 일치하는 도서 개수 조회 (한진)
	 */
	public int selectAdminSearchCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("bookMapper.selectAdminSearchCount", map);
	}
	
	/**
	 * [관리자] 검색조건에 일치하는 도서 목록 조회 (한진)
	 */
	public ArrayList<Book> selectAdminSearchList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> map) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("bookMapper.selectAdminSearchList", map, rowBounds);
	}

	/*
	 * [공통] 도서 상세 조회 (연지)
	 */
	public Book selectBook(SqlSessionTemplate sqlSession, int bkNo) {
		return sqlSession.selectOne("bookMapper.selectBook", bkNo);
	}

	/*
	 * [공통] 도서 장바구니 조회 (연지)
	 */
	public ArrayList<Book> selectCartList(SqlSessionTemplate sqlSession, int memNo) {
		return (ArrayList)sqlSession.selectList("bookMapper.selectCartList", memNo);
	}
	
	/**
	 * [관리자] 도서 상태 변경 + 다중체크박스 (한진)
	 */
	public int updateBookStatus(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.update("bookMapper.updateBookStatus", map);
	}
	
	/*
	 * [공통] 도서 장바구니 유무 확인 (연지)
	 */
	public int checkCart(SqlSessionTemplate sqlSession, HashMap<String, Integer> map) {
		return sqlSession.selectOne("bookMapper.checkCart", map);
	}

	/*
	 * [공통] 도서 장바구니 수량 증가 (연지)
	 */
	public int updateCartQty(SqlSessionTemplate sqlSession, HashMap<String, Integer> map) {
		return sqlSession.update("bookMapper.updateCartQty", map);
	}

	/*
	 * [공통] 도서 장바구니 추가 (연지)
	 */
	public int insertCart(SqlSessionTemplate sqlSession, HashMap<String, Integer> map) {
		return sqlSession.insert("bookMapper.insertCart", map);
	}
	
}
