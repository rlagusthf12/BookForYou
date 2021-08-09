package com.bookforyou.bk4u.board.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.bookforyou.bk4u.board.model.vo.Board;
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

}
