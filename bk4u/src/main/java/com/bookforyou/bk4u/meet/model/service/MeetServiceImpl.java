package com.bookforyou.bk4u.meet.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookforyou.bk4u.group.model.vo.GroupBoard;
import com.bookforyou.bk4u.meet.model.dao.MeetDao;
import com.bookforyou.bk4u.meet.model.vo.Meet;

@Service
public class MeetServiceImpl implements MeetService {

	@Autowired
	private MeetDao mDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertMeet(Meet m) {
		return mDao.insertMeet(sqlSession, m);

	}

	@Override
	public int deleteMeet(int meetNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateMeet(Meet m) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public ArrayList<Meet> selectMList() {
		return mDao.selectMList(sqlSession);
	}

	@Override
	public ArrayList<Meet> selectLastList() {
		return mDao.selectLastMList(sqlSession);
	}

}
