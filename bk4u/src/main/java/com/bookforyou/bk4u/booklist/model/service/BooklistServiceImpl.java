package com.bookforyou.bk4u.booklist.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookforyou.bk4u.book.model.vo.Book;
import com.bookforyou.bk4u.booklist.model.dao.BooklistDao;
import com.bookforyou.bk4u.booklist.model.vo.Booklist;
import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.like.model.vo.Like;
import com.bookforyou.bk4u.reply.model.vo.Reply;

@Service
public class BooklistServiceImpl implements BooklistService{
	
	@Autowired
	private BooklistDao blDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/** 독서록 게시글 갯수 조회용
	 * @author daeunlee
	 */
	@Override
	public int selectListCount() {
		return blDao.selectListCount(sqlSession);
	}
	
	/** 독서록 리스트 조회용 + 페이징
	 * @author daeunlee
	 */
	@Override
	public ArrayList<Booklist> selectList(PageInfo pi) {
		return blDao.selectList(sqlSession, pi);
	}
	
	/** 독서록 작성용
	 * @author daeunlee
	 */
	@Override
	public int insertBooklist(Booklist bl) {
		return blDao.insertBooklist(sqlSession, bl);
	}
	
	/** 도서 검색 모달창(2) : 도서 조회용
	 * @author daeunlee
	 */
	@Override
	public ArrayList<Book> selectBookSearchList(HashMap<String, String> map) {
		return blDao.selectBookSearchList(sqlSession, map);
	}
	
	/** 독서록 상세조회용 : 조회수 증가
	 * @author daeunlee
	 */
	@Override
	public int increaseCount(int blNo) {
		return blDao.increaseCount(sqlSession, blNo);
	}
	
	/** 독서록 상세조회용 : 해당게시글 조회
	 * @author daeunlee
	 */
	@Override
	public Booklist selectBooklist(int blNo) {
		return blDao.selectBooklist(sqlSession, blNo);
	}
	
	/** 독서록 상세조회용 : 해당 게시글의 책정보 조회
	 * @author daeunlee
	 */
	@Override
	public Book selectBook(int blNo) {
		return blDao.selectBook(sqlSession, blNo);
	}
	
	/** 독서록 수정용
	 * @author daeunlee
	 */
	@Override
	public int updateBooklist(Booklist bl) {
		return blDao.updateBooklist(sqlSession, bl);
	}
	
	/** 독서록 삭제용
	 * @author daeunlee
	 */
	public int deleteBooklist(int blNo) {
		return blDao.deleteBooklist(sqlSession, blNo);
	}
	
	/** 댓글 리스트 조회
	 * @author daeunlee
	 */
	@Override
	public ArrayList<Reply> selectReplyList(int blNo) {
		return blDao.selectReplyList(sqlSession, blNo);
	}
	
	/** 댓글 작성
	 * @author daeunlee
	 */
	@Override
	public int insertReply(Reply r) {
		return blDao.insertReply(sqlSession, r);
	}
	
	/** 독서록 검색 : 갯수 조회용
	 * @author daeunlee
	 */
	@Override
	public int selectSearchListCount(HashMap<String, String> map) {
		return blDao.selectSearchListCount(sqlSession, map);
	}
	
	/** 독서록 검색 : 게시글 조회용
	 * @author daeunlee
	 */
	@Override
	public ArrayList<Booklist> selectBooklistSearchList(HashMap<String, String> map, PageInfo pi){
		return blDao.selectBooklistSearchList(sqlSession, map, pi);
	}
	
	/** 인기 독서록 정렬
	 * @author daeunlee
	 */
	@Override
	public ArrayList<Booklist> selectTopBooklist() {
		return blDao.selectTopBooklist(sqlSession);
	}

	@Override
	public int selectLikeCount(Like l) {
		return blDao.selectLikeCount(sqlSession, l);
	}

	@Override
	public int insertLike(Like l) {
		return blDao.insertLike(sqlSession, l);
	}

}
