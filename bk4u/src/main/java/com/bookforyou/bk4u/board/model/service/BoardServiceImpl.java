package com.bookforyou.bk4u.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookforyou.bk4u.board.model.dao.BoardDao;
import com.bookforyou.bk4u.board.model.vo.Board;
import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.reply.model.vo.Reply;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardDao boDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 게시판 게시글 갯수 조회용
	@Override
	public int selectListCount() {
		return boDao.selectListCount(sqlSession);
	}
	
	// 게시판 리스트 페이지 조회용 (페이징)
	@Override
	public ArrayList<Board> selectList(PageInfo pi) {
		return boDao.selectList(sqlSession, pi);
	}
	
	// 게시글 상세조회용 : 조회수 증가
	@Override
	public int increaseCount(int boNo) {
		return boDao.increaseCount(sqlSession, boNo);
	}
	
	// 게시글 상세조회용 : 해당게시글 조회
	@Override
	public Board selectBoard(int boNo) {
		return boDao.selectBoard(sqlSession, boNo);
	}
	
	// 게시글 작성하기용
	@Override
	public int insertBoard(Board b) {
		return boDao.insertBoard(sqlSession, b);
	}
	
	// 게시글 삭제용
	@Override
	public int deleteBoard(int boNo) {
		return boDao.deleteBoard(sqlSession, boNo);
	}
	
	// 게시글 수정용
	@Override
	public int updateBoard(Board b) {
		return boDao.updateBoard(sqlSession, b);
	}
	
	// 6. 댓글리스트 조회용
	@Override
	public ArrayList<Reply> selectReplyList(int boNo) {
		return boDao.selectReplyList(sqlSession, boNo);
	}

	// 7. 댓글 작성용
	@Override
	public int insertReply(Reply r) {
		return boDao.insertReply(sqlSession, r);
	}
	
	// 8. 대댓글 작성용
	@Override
	public int insertReco(Reply r) {
		return boDao.insertReco(sqlSession, r);
	}
	
	// 9. 게시글 검색 : 갯수 조회용
	@Override
	public int selectSearchListCount(HashMap<String, String> map) {
		return boDao.selectSearchListCount(sqlSession, map);
	}
	
	// 10. 게시글 검색 : 게시글 조회용
	@Override
	public ArrayList<Board> selectBoardSearchList(HashMap<String, String> map, PageInfo pi) {
		return boDao.selectBoardSearchList(sqlSession, map, pi);
	}
	
	// 11. 카테고리별 게시글 갯수
	@Override
	public int selectBoardCategoryCount(String category) {
		return boDao.selectBoardCategoryCount(sqlSession, category);
	}
	
	// 12. 카테고리별 게시글 조회용
	@Override
	public ArrayList<Board> selectBoardCategory(String category, PageInfo pi) {
		return boDao.selectBoardCategory(sqlSession, category, pi);
	}
	


}
