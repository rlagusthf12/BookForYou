package com.bookforyou.bk4u.Amember.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bookforyou.bk4u.Amember.model.vo.Amem;
import com.bookforyou.bk4u.common.model.vo.PageInfo;

@Repository
public class AmemDao {
	
	public int selectAmemList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.selectAmemList");
	}
	
	public ArrayList<Amem> selecltAmemSearch(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectAmemSearch", null, rowBounds);
	}
	
	public int selectAmemSearchListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("memberMapper.selectAmemSearchListCount", map);
	}
	
	public ArrayList<Amem> selectAmemSearchList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> map){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		System.out.println(map);
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectAmemSearchList", map, rowBounds);
		
	}
	
	public int amDelete(SqlSessionTemplate sqlSession, String memId) {
		return sqlSession.delete("memberMapper.amDelete", memId);
		
	}
	
	//회원 상세조회
	
	public Amem selectAmemDetail(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("memberMapper.selectAmemDetail", memNo);
	}
	
}
