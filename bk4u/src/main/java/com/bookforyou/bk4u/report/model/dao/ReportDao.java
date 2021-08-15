package com.bookforyou.bk4u.report.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.report.model.vo.Report;
import com.bookforyou.bk4u.report.model.vo.ReportList;

@Repository
public class ReportDao {

	public int selectListCount(SqlSessionTemplate sqlSession,int memNo) {
		return sqlSession.selectOne("reportMapper.selectListCount",memNo);
	}
	
	public int selectListCountAd(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("reportMapper.selectListCount");
	}	

	public int selectReListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("reportMapper.selectReListCount");
	}
	
	public ArrayList<Report> selectReportList(SqlSessionTemplate sqlSession, PageInfo pi,int memNo){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("reportMapper.selectReportList", memNo, rowBounds);
	}
	
	public ArrayList<Report> selectReportListAd(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("reportMapper.selectReportListAd", null, rowBounds);
	}
	
	public ArrayList<ReportList> selectReReportList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("reportMapper.selectReReportList", null, rowBounds);
	}
	
	public Report selectReport(SqlSessionTemplate sqlSession, int reportNo) {
		return sqlSession.selectOne("reportMapper.selectReport",reportNo);
	}
	
	public ReportList selectReReport(SqlSessionTemplate sqlSession, int reliNo) {
		return sqlSession.selectOne("reportMapper.selectReReport",reliNo);
	}
	
	public int deleteReport(SqlSessionTemplate sqlSession, int reportNo) {
		
		return sqlSession.delete("reportMapper.deleteReport",reportNo);
	}	
	public int deleteReReport(SqlSessionTemplate sqlSession, int reliNo) {
		
		return sqlSession.delete("reportMapper.deleteReReport",reliNo);
	}
	
	public int updateReport(SqlSessionTemplate sqlSession , Report report) {
		return sqlSession.update("reportMapper.updateReport", report);
	}
	public int updateReReport(SqlSessionTemplate sqlSession , ReportList reli) {
		return sqlSession.update("reportMapper.updateReReport", reli);
	}
	
	public int writeReport(SqlSessionTemplate sqlSession, Report report) {
		return sqlSession.insert("reportMapper.insertReport", report);
	}
	
	public int writeReReport(SqlSessionTemplate sqlSession, ReportList reli) {
		return sqlSession.insert("reportMapper.insertReReport", reli);
	}
}
