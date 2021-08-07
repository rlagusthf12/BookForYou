package com.bookforyou.bk4u.qa.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.qa.model.dao.QaDao;
import com.bookforyou.bk4u.qa.model.vo.As;
import com.bookforyou.bk4u.qa.model.vo.Qa;

@Service
public class QaServiceImpl implements QaService {

		@Autowired
		QaDao qDao;
		
		@Autowired
		SqlSessionTemplate sqlSession;
		
		@Override
		public int selectListCount() {
			return qDao.selectListCount(sqlSession);
		}
		
		@Override
		public int selectAnsListCount() {
			return qDao.selectAnsListCount(sqlSession);
		}
		
		@Override
		public int selectYetListCount() {
			return qDao.selectYetListCount(sqlSession);
		}
		
		@Override
		public ArrayList<Qa> selectList(PageInfo pi){
			return qDao.selectList(sqlSession,pi);
		}
		
		@Override
		public Qa selectQa(int qaNo) {
			return qDao.selectQa(sqlSession, qaNo);
		}
		
		@Override
		public As selectAs(int qaNo) {
			return qDao.selectAs(sqlSession, qaNo);
		}
		
		@Override
		public ArrayList<Qa>searchMemNoQaList(PageInfo pi,int memNo){
			return qDao.searchMemNoQaList(sqlSession,pi,memNo);
		}
		
		@Override
		public int selectMemNoQaListCount(int memNo) {
			return qDao.selectMemNoQaListCount(sqlSession,memNo);
		}
}
