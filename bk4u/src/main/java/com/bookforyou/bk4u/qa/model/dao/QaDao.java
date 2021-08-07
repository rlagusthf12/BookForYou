package com.bookforyou.bk4u.qa.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.qa.model.vo.As;
import com.bookforyou.bk4u.qa.model.vo.Qa;

@Repository
public class QaDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("qaMapper.selectListCount");
	}
	public int selectMemNoQaListCount(SqlSessionTemplate sqlSession,int memNo) {
		return sqlSession.selectOne("qaMapper.selectMemNoQaListCount", memNo);
	}
	public int selectAnsListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("qaMapper.selectAnsListCount");
	}
	public int selectYetListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("qaMapper.selectYetListCount");
	}
	
	public ArrayList<Qa> selectList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("qaMapper.selectList", null,rowBounds);
	}
	
	public Qa selectQa(SqlSessionTemplate sqlSession, int qaNo) {
		return sqlSession.selectOne("qaMapper.selectQa", qaNo);
	}
	
	public As selectAs(SqlSessionTemplate sqlSession, int qaNo) {
		return sqlSession.selectOne("qaMapper.selectAs", qaNo);
	}
	
	public ArrayList<Qa> searchMemNoQaList(SqlSessionTemplate sqlSession,PageInfo pi, int memNo) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("qaMapper.searchMemNoQaList",memNo,rowBounds);
	}
		
}
