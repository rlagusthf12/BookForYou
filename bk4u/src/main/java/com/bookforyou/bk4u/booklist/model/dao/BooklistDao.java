package com.bookforyou.bk4u.booklist.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bookforyou.bk4u.book.model.vo.Book;
import com.bookforyou.bk4u.booklist.model.vo.Booklist;
import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.reply.model.vo.Reply;

@Repository
public class BooklistDao {
	
	/** 독서록 게시글 갯수 조회용
	 * @author daeunlee
	 */
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("booklistMapper.selectListCount");
	}
	
	/** 독서록 리스트 조회용 + 페이징
	 * @author daeunlee
	 */
	public ArrayList<Booklist> selectList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("booklistMapper.selectList", null, rowBounds);
	}
	
	/** 독서록 작성용
	 * @author daeunlee
	 */
	public int insertBooklist(SqlSessionTemplate sqlSession, Booklist bl) {
		return sqlSession.insert("booklistMapper.insertBooklist", bl);
	}
	
	/** 도서 검색 모달창(2) : 도서 조회용
	 * @author daeunlee
	 */
	public ArrayList<Book> selectBookSearchList(SqlSessionTemplate sqlSession, HashMap<String, String> map){
		return (ArrayList)sqlSession.selectList("booklistMapper.selectBookSearchList", map);
	}
	
	/** 독서록 상세조회용 : 조회수 증가
	 * @author daeunlee
	 */
	public int increaseCount(SqlSessionTemplate sqlSession, int blNo) {
		return sqlSession.update("booklistMapper.increaseCount", blNo);
	}
	
	/** 독서록 상세조회용 : 해당게시글 조회
	 * @author daeunlee
	 */
	public Booklist selectBooklist(SqlSessionTemplate sqlSession, int blNo) {
		return sqlSession.selectOne("booklistMapper.selectBooklist", blNo);
	}
	
	/** 독서록 상세조회용 : 해당 게시글의 책정보 조회
	 * @author daeunlee
	 */
	public Book selectBook(SqlSessionTemplate sqlSession, int blNo) {
		return sqlSession.selectOne("booklistMapper.selectBook", blNo);
	}
	
	/** 댓글 리스트 조회
	 * @author daeunlee
	 */
	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int blNo){
		return (ArrayList)sqlSession.selectList("booklistMapper.selectReplyList", blNo);
	}
	
	/** 댓글 작성
	 * @author daeunlee
	 */
	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("booklistMapper.insertReply", r);
	}
	
	/** 독서록 수정용
	 * @author daeunlee
	 */
	public int updateBooklist(SqlSessionTemplate sqlSession, Booklist bl) {
		return sqlSession.update("booklistMapper.updateBooklist", bl);
	}
	
	/** 독서록 삭제용
	 * @author daeunlee
	 */
	public int deleteBooklist(SqlSessionTemplate sqlSession, int blNo) {
		return sqlSession.update("booklistMapper.deleteBooklist", blNo);
	}
	
	/** 독서록 검색 : 갯수 조회용
	 * @author daeunlee
	 */
	public int selectSearchListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("booklistMapper.selectSearchListCount", map);
	}
	
	/** 독서록 검색 : 게시글 조회용
	 * @author daeunlee
	 */
	public ArrayList<Booklist> selectBooklistSearchList(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi){
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("booklistMapper.selectBooklistSearchList", map, rowBounds);
	}

	/**
	 * [메인] 인기 독서록 불러오기 (한진)
	 */
	public ArrayList<Booklist> selectMainBookReport(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("booklistMapper.selectMainBookReport");
	}
	
}
