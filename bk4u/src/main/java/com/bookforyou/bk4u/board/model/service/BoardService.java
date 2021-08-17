package com.bookforyou.bk4u.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Service;

import com.bookforyou.bk4u.board.model.vo.Board;
import com.bookforyou.bk4u.booklist.model.vo.Booklist;
import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.reply.model.vo.Reply;

@Service
public interface BoardService {
	
	// 1. 게시판 리스트 페이지 조회용 (페이징)
    int selectListCount();
    ArrayList<Board> selectList(PageInfo pi);

    // 2. 게시글 상세조회용
    int increaseCount(int boNo);
    Board selectBoard(int boNo);
    
    // 3. 게시글 작성하기용
    int insertBoard(Board b);

    // 4. 게시글 삭제용
    int deleteBoard(int boNo);

    // 5. 게시글 수정용
    int updateBoard(Board b);

    // 6. 댓글리스트 조회용
    ArrayList<Reply> selectReplyList(int boNo);

    // 7. 댓글 작성용
    int insertReply(Reply r);
    
    // 8. 대댓글 작성용
    int insertReco(Reply r);
    
    // 9. 독서록 검색 : 갯수 조회용
	int selectSearchListCount(HashMap<String, String> map);
	
	// 10. 독서록 검색 : 게시글 조회용
	ArrayList<Board> selectBoardSearchList(HashMap<String, String> map, PageInfo pi);
	
	// 11. 카테고리별 게시글 조회용
	ArrayList<Board> selectBoardCategory(String category, PageInfo pi);
	
	// 12. 카테고리별 갯수 조회용
	int selectBoardCategoryCount(String category);
	
	
}
