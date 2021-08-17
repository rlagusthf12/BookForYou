package com.bookforyou.bk4u.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bookforyou.bk4u.board.model.vo.Board;
import com.bookforyou.bk4u.booklist.model.vo.Booklist;
import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.reply.model.vo.Reply;

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
	
	/** 게시글 작성용 
	 * @author daeunlee
	 */
	public int insertBoard(SqlSessionTemplate sqlSession, Board b) {
        return sqlSession.insert("boardMapper.insertBoard", b);
    }
	
	/** 게시글 수정용 
	 * @author daeunlee
	 */
	public int updateBoard(SqlSessionTemplate sqlSession, Board b) {
        return sqlSession.update("boardMapper.updateBoard", b);
    }
	
	/** 게시글 삭제용 
	 * @author daeunlee
	 */
	public int deleteBoard(SqlSessionTemplate sqlSession, int boNo) {
        return sqlSession.update("boardMapper.deleteBoard", boNo);
    }
	
	/** 게시판 검색 : 갯수 조회용
	 * @author daeunlee
	 */
	public int selectSearchListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("boardMapper.selectSearchListCount", map);
	}
	
	/** 게시판 검색 : 게시글 조회용
	 * @author daeunlee
	 */
	public ArrayList<Board> selectBoardSearchList(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi){
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.selectBoardSearchList", map, rowBounds);
	}
	
	/** 카테고리별 게시글 조회용
	 * @author daeunlee
	 */
	public ArrayList<Board> selectBoardCategory(SqlSessionTemplate sqlSession, String category, PageInfo pi){
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.selectBoardCategory", category, rowBounds);
	}
	
	/** 카테고리별 갯수 조회용
	 * @author daeunlee
	 */
	public int selectBoardCategoryCount(SqlSessionTemplate sqlSession, String category) {
		return sqlSession.selectOne("boardMapper.selectBoardCategoryCount", category);
	}
	
	/** 댓글 리스트 조회
	 * @author daeunlee
	 */
	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int boNo){
		return (ArrayList)sqlSession.selectList("boardMapper.selectReplyList", boNo);
	}
	
	/** 댓글 작성
	 * @author daeunlee
	 */
	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("boardMapper.insertReply", r);
	}
	
	/** 대댓글 작성
	 * @author daeunlee
	 */
	public int insertReco(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("boardMapper.insertReply", r);
	}
	
	
}
