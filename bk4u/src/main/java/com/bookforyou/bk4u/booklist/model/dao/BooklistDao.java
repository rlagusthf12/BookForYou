package com.bookforyou.bk4u.booklist.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bookforyou.bk4u.booklist.model.vo.Booklist;
import com.bookforyou.bk4u.common.model.vo.PageInfo;

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
		RowBounds rowbounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("booklistMapper.selectList", null, rowbounds);
	}
	
	/** 독서록 작성용
	 * @author daeunlee
	 */
	public int insertBooklist(SqlSessionTemplate sqlSession, Booklist bl) {
		return sqlSession.insert("booklistMapper.insertBooklist", bl);
	}

}
