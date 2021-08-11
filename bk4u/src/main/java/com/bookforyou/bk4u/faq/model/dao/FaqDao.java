package com.bookforyou.bk4u.faq.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

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
		

		public ArrayList<Faq> selectList(SqlSessionTemplate sqlSession){
			
			
			return (ArrayList)sqlSession.selectList("faqMapper.selectList");
		}
		
		public int updateQueType(SqlSessionTemplate sqlSession,Faq f) {
			return sqlSession.update("faqMapper.updateQueType",f );
		}
		
		public int insertQueType(SqlSessionTemplate sqlSession,Faq f) {
			return sqlSession.insert("faqMapper.insertQueType",f );
		}
		
		public int deleteQueType(SqlSessionTemplate sqlSession, Faq f) {
			return sqlSession.delete("faqMapper.deleteQueType", f);
		}
		
		public int typeListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
			return sqlSession.selectOne("faqMapper.typeListCount", map);
		}
		
		public ArrayList<Faq> selectTypeList1(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> map) {
			int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
			RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
			return (ArrayList)sqlSession.selectList("faqMapper.selectTypeList1", map, rowBounds);
		}
		public int increaseCount(SqlSessionTemplate sqlSession, int faqNo) {
			return sqlSession.update("faqMapper.increaseCount",faqNo);
		}
		
		
		public Faq selectFaq(SqlSessionTemplate sqlSession, int faqNo) {
			return sqlSession.selectOne("faqMapper.selectFaq",faqNo);
		}
		
		public int writeFaq(SqlSessionTemplate sqlSession, Faq f) {
			return sqlSession.insert("faqMapper.writeFaq", f);
		}
		
		public int deleteFaq(SqlSessionTemplate sqlSession, int faqNo) {
			return sqlSession.delete("faqMapper.deleteFaq", faqNo);
		}
		
		public int updateFaq(SqlSessionTemplate sqlSession, Faq f) {
			return sqlSession.update("faqMapper.updateFaq", f);
		}
		
		
	
}
