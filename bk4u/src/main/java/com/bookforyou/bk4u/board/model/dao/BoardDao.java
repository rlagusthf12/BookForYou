package com.bookforyou.bk4u.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bookforyou.bk4u.board.model.vo.Board;
import com.bookforyou.bk4u.common.model.vo.PageInfo;

@Repository
public class BoardDao {
	
	/** 게시판 게시글 갯수 조회용
	 * @author daeunlee
	 */
	public int selectListCount(SqlSessionTemplate sqlSession) {
        return sqlSession.selectOne("boardMapper.selectListCount");
    }
	
	/** 게시판 리스트 조회용 + 페이징
	 * @author daeunlee
	 */
	public ArrayList<Board> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); // 몇개의 게시물을 건너뛸건지
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit()); // RowBounds = offset만큼 건너뛰고 & 몇개를 조회할건지 boardLimit만큼 가져온다
        return (ArrayList) sqlSession.selectList("boardMapper.selectList", null, rowBounds);
    }
	
	/** 게시글 상세조회용 : 조회수 증가
	 * @author daeunlee
	 */
	public int increaseCount(SqlSessionTemplate sqlSession, int boNo) {
        return sqlSession.update("boardMapper.increaseCount", boNo);
    }
	
	/** 게시글 상세조회용 : 해당게시글 조회
	 * @author daeunlee
	 */
	public Board selectBoard(SqlSessionTemplate sqlSession, int boNo) {
        return sqlSession.selectOne("boardMapper.selectBoard", boNo);
    }
}
