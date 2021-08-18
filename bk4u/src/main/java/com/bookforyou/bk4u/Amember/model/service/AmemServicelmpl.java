package com.bookforyou.bk4u.Amember.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookforyou.bk4u.Amember.model.dao.AmemDao;
import com.bookforyou.bk4u.Amember.model.vo.Amem;
import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.member.model.vo.Member;


@Service
public class AmemServicelmpl implements AmemService{
	
	@Autowired
	private AmemDao amDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int amDelete(String memId) {
		return amDao.amDelete(sqlSession, memId);
	}

	@Override
	public int increaseCount(int memNo) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public Member selectAmemDetail(int memNo) {
		return amDao.selectAmemDetail(sqlSession, memNo);
	}

	
	//검색
	@Override
	public int selectSearchListCount(HashMap<String, String> map) {
		return amDao.selectSearchListCount(sqlSession, map);
	}

	@Override
	public ArrayList<Member> selectSearchAmemList(PageInfo pi, HashMap<String, String> map) {
		return amDao.selectSearchAmemList(sqlSession, pi, map);		
	}
	//회원조회
	@Override
	public int selectListCount() {
		return amDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Member> selectList(PageInfo pi) {
		return amDao.selectList(sqlSession, pi);
	}
	//블랙리스트 조회
	@Override
	public int selectBlackListCount() {
		return amDao.selectBlackListCount(sqlSession);
	}
	@Override
	public ArrayList<Member> selectBlackList(PageInfo pi) {
		return amDao.selectBlackList(sqlSession, pi);
	}

	// 블랙리스트 추가
	@Override
	public int blackMember(int mno) {
		return amDao.blackMember(sqlSession, mno);
	}
	// 블랙리스트 검색
	@Override
	public int selectBlackSearchListCount(HashMap<String, String> map) {
		return amDao.selectBlackSearchListCount(sqlSession, map);
	}

	@Override
	public ArrayList<Member> selectBlackSearchList(PageInfo pi, HashMap<String, String> map) {
		return amDao.selectBlackSearchList(sqlSession, pi, map);
	}

	

}
