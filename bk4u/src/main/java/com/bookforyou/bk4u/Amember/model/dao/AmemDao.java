package com.bookforyou.bk4u.Amember.model.dao;

import java.util.ArrayList;

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
	
}
