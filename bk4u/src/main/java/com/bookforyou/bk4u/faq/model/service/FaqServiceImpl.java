/**
 * 
 */
package com.bookforyou.bk4u.faq.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.faq.model.dao.FaqDao;
import com.bookforyou.bk4u.faq.model.vo.Faq;


@Service
public class FaqServiceImpl implements FaqService {
	@Autowired
	private FaqDao fDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
		

	@Override
	public ArrayList<Faq> selectFaqList(){		
		return fDao.selectFaqList(sqlSession);
	}
	@Override
	public ArrayList<Faq> selectTypeList(){		
		return fDao.selectTypeList(sqlSession);
	}
	@Override
	public ArrayList<Faq> selectList(){		
		return fDao.selectList(sqlSession);
	}
	@Override
	public int updateQueType(Faq f) {
	
		return fDao.updateQueType(sqlSession,f);
	}
	@Override
	public int insertQueType(Faq f) {
	
		return fDao.insertQueType(sqlSession,f);
	}
	
	@Override
	public int deleteQueType(Faq f) {
		return fDao.deleteQueType(sqlSession, f);
	}
	
	@Override
	public int increaseCount(int faqNo) {
		return fDao.increaseCount(sqlSession,faqNo);
	}
	
	@Override
	public Faq selectFaq(int faqNo) {
		return fDao.selectFaq(sqlSession,faqNo);
	}
	
	@Override
	public int writeFaq(Faq f) {
		return fDao.writeFaq(sqlSession, f);
	}
	
	@Override
	public int deleteFaq(int faqNo) {
		return fDao.deleteFaq(sqlSession, faqNo);
	}
	
	@Override
	public int updateFaq(Faq f) {
		return fDao.updateFaq(sqlSession, f);
	}
	
	public int typeListCount(HashMap<String, String> map) {
		return fDao.typeListCount(sqlSession, map);
	}
	
	public ArrayList<Faq> selectTypeList1(PageInfo pi, HashMap<String, String> map) {
		return fDao.selectTypeList1(sqlSession, pi, map);
	}
	
	

}
