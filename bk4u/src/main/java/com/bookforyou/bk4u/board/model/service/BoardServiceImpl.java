package com.bookforyou.bk4u.board.model.service;

import java.util.ArrayList;

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

	@Override
	public ArrayList<Reply> selectReplyList(int boNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertReply(Reply r) {
		// TODO Auto-generated method stub
		return 0;
	}

}
