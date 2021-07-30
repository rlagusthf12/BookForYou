package com.bookforyou.bk4u.notice.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.notice.model.dao.NoticeDao;
import com.bookforyou.bk4u.notice.model.vo.Notice;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeDao nDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCount() {
		return nDao.selectListCount(sqlSession);
	}
	
	@Override
	public ArrayList<Notice> selectList(PageInfo pi){		
		return nDao.selectList(sqlSession,pi);
	}
	
	
	@Override
	public Notice selectNotice(int noNo) {
		return nDao.selectNotice(sqlSession, noNo);
	}
	
	@Override
	public int increaseCount(int noNo) {
		return nDao.increaseCount(sqlSession, noNo);
	}
	
	@Override
	public int updateNotice(Notice n) {
		return nDao.updateNotice(sqlSession, n);
	}
	
	public int deleteNotice(int noNo) {
		return nDao.deleteNotice(sqlSession, noNo);
	}
	
	@Override
	public int writeNotice(Notice n) {
		return nDao.writeNotice(sqlSession,n);
	}

}
