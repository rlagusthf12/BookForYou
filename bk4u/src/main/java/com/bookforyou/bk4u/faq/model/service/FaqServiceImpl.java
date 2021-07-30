/**
 * 
 */
package com.bookforyou.bk4u.faq.model.service;

import java.util.ArrayList;

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
		
	

}
