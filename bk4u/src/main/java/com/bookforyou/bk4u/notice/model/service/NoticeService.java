package com.bookforyou.bk4u.notice.model.service;

import java.util.ArrayList;

import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.notice.model.vo.Notice;

public interface NoticeService {
	
	int selectListCount();
	ArrayList<Notice> selectList(PageInfo pi);
	
	//게시글 상세조회용
	int increaseCount(int noNo);
	Notice selectNotice(int noNo);
	
	//게시글 수정
	int updateNotice(Notice n);
	
	//게시글 삭제
	int deleteNotice(int noNo);
	
	//게시글 작성
	int writeNotice(Notice n);
}
