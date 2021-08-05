package com.bookforyou.bk4u.booklist.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.bookforyou.bk4u.book.model.vo.Book;
import com.bookforyou.bk4u.booklist.model.vo.Booklist;
import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.reply.model.vo.Reply;

public interface BooklistService {
	
	/** 1. 독서록 게시글 갯수 조회용 (+페이징)
	 * @author daeunlee
	 */
	int selectListCount();
	ArrayList<Booklist> selectList(PageInfo pi);
	
	/** 2. 독서록 작성용
	 * @author daeunlee
	 */
	int insertBooklist(Booklist bl);
	
	/** 3. 독서록 상세조회 (조회수증가+해당독서록조회+책정보조회)
	 * @author daeunlee
	 */
	int increaseCount(int blNo);
	Booklist selectBooklist(int blNo);
	Book selectBook(int blNo);
	
	/** 4. 독서록 삭제
	 * @author daeunlee
	 */
	int deleteBooklist(int blNo);
	
	/** 5. 독서록 수정
	 * @author daeunlee
	 */
	int updateBooklist(Booklist bl);
	
	/** 6. 댓글 리스트 조회
	 * @author daeunlee
	 */
	ArrayList<Reply> selectReplyList(int blNo);
	
	/** 7. 댓글 작성
	 * @author daeunlee
	 */
	int insertReply(Reply r);
	
	/** 8. 도서 검색 모달창(1) : 도서 갯수 조회용
	 * 	      도서 검색 모달창(2) : 도서 조회용
	 * @author daeunlee
	 */
	//public int selectSearchListCount(HashMap<String, String> map);
	public ArrayList<Book> selectBookSearchList(HashMap<String, String> map);
	
	/** 9. 인기 독서록 정렬
	 * @author daeunlee
	 */
	public ArrayList<Booklist> selectTopBooklistList();

}
