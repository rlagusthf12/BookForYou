package com.bookforyou.bk4u.book.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bookforyou.bk4u.book.model.vo.Book;
import com.bookforyou.bk4u.common.model.vo.PageInfo;

@Repository
public class BookDao {
	
	/**
	 * [관리자] 도서 전체 개수  조회 (한진)
	 * @param sqlSession
	 * @return
	 */
	public int selectAllListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("bookMapper.selectAllListCount");
	}
	
	/**
	 * [관리자] 도서 전체 목록 조회 (한진)
	 * @param sqlSession
	 * @param pi
	 * @return
	 */
	public ArrayList<Book> selectAdminBookList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("bookMapper.selectAdminBookList", null, rowBounds);
	}

	public int selectSearchBookCount(SqlSessionTemplate sqlSession, String condition, String keyword) {
		return sqlSession.selectOne("bookMapper.selectSearchBookCount");
	}

	public ArrayList<Book> selectSearchBook(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> map) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("bookMapper.selectSearchBook", map, rowBounds);
	}
	
	/**
	 * [관리자] '판매중'인 도서 개수 조회 (한진)
	 * @param sqlSession
	 * @return
	 */
	public int selectStatusYCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("bookMapper.selectStatusYCount");
	}
	
	/**
	 * [관리자]  게시 'Y'인 도서 개수 조회 (한진)
	 * @param sqlSession
	 * @return
	 */
	public int selectSelStatusYCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("bookMapper.selectSelStatusYCount");
	}
}
