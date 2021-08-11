package com.bookforyou.bk4u.qa.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.faq.model.vo.Faq;
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
		public ArrayList<Qa> selectTypeList(){		
			return qDao.selectTypeList(sqlSession);
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
		
		@Override
		public int writeAns(As as) {
			return qDao.writeAns(sqlSession,as);
		}
		
		@Override
		public int writeQa(Qa qa) {
			return qDao.writeQa(sqlSession,qa);
		}
		
		@Override
		public int updateStatus(int qaNo) {
			return qDao.updateStatus(sqlSession, qaNo);
		}
		
		@Override
		public int updateQa(Qa qa) {
			return qDao.updateQa(sqlSession, qa);
		}
		@Override
		public int updateAns(As as) {
			return qDao.updateAns(sqlSession, as);
		}
		
		@Override
		public int deleteQa(int qaNo) {
			return qDao.deleteQa(sqlSession, qaNo);
		}
		
		@Override
		public int deleteAns(int qaNo) {
			return qDao.deleteAns(sqlSession, qaNo);
		}
		
		public int typeListCount(HashMap<String, String> map) {
			return qDao.typeListCount(sqlSession, map);
		}
		
		
		public int typeAnsListCount(HashMap<String, String> map) {
			return qDao.typeAnsListCount(sqlSession, map);
		}
		
		
		public int typeYetListCount(HashMap<String, String> map) {
			return qDao.typeYetListCount(sqlSession, map);
		}
		
		public ArrayList<Qa> selectTypeList1(PageInfo pi, HashMap<String, String> map) {
			return qDao.selectTypeList1(sqlSession, pi, map);
		}
}
