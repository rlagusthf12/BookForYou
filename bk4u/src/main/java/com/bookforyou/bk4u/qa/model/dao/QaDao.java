package com.bookforyou.bk4u.qa.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.faq.model.vo.Faq;
import com.bookforyou.bk4u.qa.model.vo.As;
import com.bookforyou.bk4u.qa.model.vo.Qa;

@Repository
public class QaDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("qaMapper.selectListCount");
	}
	
	public int selectListAdCount(SqlSessionTemplate sqlSession,int memNo) {
		return sqlSession.selectOne("qaMapper.selectListAdCount",memNo);
	}
	
	public int selectMemNoQaListCount(SqlSessionTemplate sqlSession,int memNo) {
		return sqlSession.selectOne("qaMapper.selectMemNoQaListCount", memNo);
	}
	public int selectAnsListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("qaMapper.selectAnsListCount");
	}
	
	public int selectAnsAdListCount(SqlSessionTemplate sqlSession,int memNo) {
		return sqlSession.selectOne("qaMapper.selectAnsAdListCount",memNo);
	}
	public int selectYetListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("qaMapper.selectYetListCount");
	}
	
	public int selectYetAdListCount(SqlSessionTemplate sqlSession,int memNo) {
		return sqlSession.selectOne("qaMapper.selectYetAdListCount",memNo);
	}
	public ArrayList<Qa> selectList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("qaMapper.selectList", null,rowBounds);
	}
	
	public ArrayList<Qa> selectAdList(SqlSessionTemplate sqlSession, PageInfo pi,int memNo){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("qaMapper.selectAdList",memNo,rowBounds);
	}
	public ArrayList<Qa> selectTypeList(SqlSessionTemplate sqlSession){
		
		
		return (ArrayList)sqlSession.selectList("qaMapper.selectTypeList");
	}
	
	
	public Qa selectQa(SqlSessionTemplate sqlSession, int qaNo) {
		return sqlSession.selectOne("qaMapper.selectQa", qaNo);
	}
	
	public As selectAs(SqlSessionTemplate sqlSession, int qaNo) {
		return sqlSession.selectOne("qaMapper.selectAs", qaNo);
	}
	
	public ArrayList<Qa> searchMemNoQaList(SqlSessionTemplate sqlSession,PageInfo pi, int memNo) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("qaMapper.searchMemNoQaList",memNo,rowBounds);
	}
	
	public int writeAns(SqlSessionTemplate sqlSession, As as) {
		return sqlSession.insert("qaMapper.writeAns",as);
	}
	
	public int writeQa(SqlSessionTemplate sqlSession, Qa qa) {
		return sqlSession.insert("qaMapper.writeQa",qa);
	}
	
	public int updateStatus(SqlSessionTemplate sqlSession, int qaNo) {
		return sqlSession.update("qaMapper.updateStatus",qaNo);
	}
	
	public int updateQa(SqlSessionTemplate sqlSession, Qa qa) {
		return sqlSession.update("qaMapper.updateQa",qa);
	}
	
	public int updateAns(SqlSessionTemplate sqlSession, As as) {
		return sqlSession.update("qaMapper.updateAns",as);
	}
	
	public int deleteQa(SqlSessionTemplate sqlSession, int qaNo) {
		return sqlSession.delete("qaMapper.deleteQa",qaNo);
	}
	
	public int deleteAns(SqlSessionTemplate sqlSession, int qaNo) {
		return sqlSession.delete("qaMapper.deleteAns",qaNo);
	}
	
	public int typeListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("qaMapper.typeListCount", map);
	}
	
	public int typeAnsListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("qaMapper.typeAnsListCount", map);
	}
	
	public int typeYetListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("qaMapper.typeYetListCount", map);
	}
	
	public ArrayList<Qa> selectTypeList1(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> map) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("qaMapper.selectTypeList1", map, rowBounds);
	}
		
		
}
