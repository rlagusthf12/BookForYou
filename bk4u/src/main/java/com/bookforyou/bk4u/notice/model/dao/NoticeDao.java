package com.bookforyou.bk4u.notice.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.notice.model.vo.Notice;

@Repository
public class NoticeDao {
	
	//게시글 목록수
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("noticeMapper.selectListCount");
	}
	
	//게시글 목록 조회
	public ArrayList<Notice> selectList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("noticeMapper.selectList", null, rowBounds);
		
	}
	
	//게시글 조회
	public Notice selectNotice(SqlSessionTemplate sqlSession, int noNo) {
		return sqlSession.selectOne("noticeMapper.selectNotice", noNo);
	}
	// 조회수 증가
	public int increaseCount(SqlSessionTemplate sqlSession, int noNo) {
		return sqlSession.update("noticeMapper.increaseCount",noNo);
	}
	//게시글 수정
	public int updateNotice(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.update("noticeMapper.updateNotice",n);
	}
	//게시글 삭제
	public int deleteNotice(SqlSessionTemplate sqlSession, int noNo) {
		return sqlSession.delete("noticeMapper.deleteNotice",noNo);
	}
	//게시글 작성
	public int writeNotice(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.insert("noticeMapper.writeNotice", n);
	}
	
}
