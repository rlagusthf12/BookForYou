package com.bookforyou.bk4u.booklist.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookforyou.bk4u.booklist.model.dao.BooklistDao;
import com.bookforyou.bk4u.booklist.model.vo.Booklist;
import com.bookforyou.bk4u.common.model.vo.PageInfo;
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

	@Override
	public int increaseCount(int blNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Booklist selectBooklist(int blNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteBooklist(int blNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateBooklist(Booklist bl) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Reply> selectReplyList(int blNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertReply(Reply r) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int selectSerchListCount(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Booklist> selectSearchList(PageInfo pi, HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Booklist> selectTopBooklistList() {
		// TODO Auto-generated method stub
		return null;
	}

}
