package com.bookforyou.bk4u.faq.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.faq.model.vo.Faq;

@Repository
public class FaqDao {	
		
		
		public ArrayList<Faq> selectFaqList(SqlSessionTemplate sqlSession){
			
			
			return (ArrayList)sqlSession.selectList("faqMapper.selectFaqList");
		}
		
		public ArrayList<Faq> selectTypeList(SqlSessionTemplate sqlSession){
			
			
			return (ArrayList)sqlSession.selectList("faqMapper.selectTypeList");
		}
		
	
	
}
