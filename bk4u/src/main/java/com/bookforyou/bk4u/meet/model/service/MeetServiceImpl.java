package com.bookforyou.bk4u.meet.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookforyou.bk4u.group.model.dao.GroupDao;
import com.bookforyou.bk4u.group.model.vo.GroupBoard;
import com.bookforyou.bk4u.meet.model.dao.MeetDao;
import com.bookforyou.bk4u.meet.model.vo.Meet;
import com.bookforyou.bk4u.meet.model.vo.MeetMember;
import com.bookforyou.bk4u.member.model.vo.Member;

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
	public ArrayList<Meet> meetList(int groupBoardNo) {
		return mDao.meetList(sqlSession,groupBoardNo);
	}

	@Override
	public ArrayList<Meet> meetLastList(int groupBoardNo) {
		return mDao.meetLastList(sqlSession, groupBoardNo);
	}
	
	@Override
	public ArrayList<MeetMember> meetMemberList(int gno) {
		return mDao.meetMemberList(sqlSession, gno);

	}

	@Override
	public int insertMeetMem(MeetMember mb) {
		return mDao.insertMeetMem(sqlSession, mb);	

	}

	@Override
	public ArrayList<Member> memberInfo(Member m) {
		return (ArrayList)sqlSession.selectList("groupMapper.memberInfo", m);

	}

	
	

}
