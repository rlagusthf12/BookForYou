package com.bookforyou.bk4u.report.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.report.model.dao.ReportDao;
import com.bookforyou.bk4u.report.model.vo.Report;
import com.bookforyou.bk4u.report.model.vo.ReportList;

@Service
public class ReportServiecImpl implements ReportService{
	@Autowired
	private ReportDao rDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCount() {
		return rDao.selectListCount(sqlSession);
	}
	@Override
	public int selectReListCount() {
		return rDao.selectReListCount(sqlSession);
	}
	
	@Override
	public ArrayList<Report> selectReportList(PageInfo pi){		
		return rDao.selectReportList(sqlSession,pi);
	}
	
	@Override
	public ArrayList<ReportList> selectReReportList(PageInfo pi){		
		return rDao.selectReReportList(sqlSession,pi);
	}
	@Override
	public Report selectReport(int reportNo) {
		return rDao.selectReport(sqlSession,reportNo);
	}
	@Override
	public ReportList selectReReport(int reliNo) {
		return rDao.selectReReport(sqlSession,reliNo);
	}
	@Override
	public int deleteReport(int reportNo) {
		return rDao.deleteReport(sqlSession, reportNo);
	}
	@Override
	public int deleteReReport(int reliNo) {
		return rDao.deleteReReport(sqlSession, reliNo);
	}
	@Override
	public int updateReport(Report report) {
		return rDao.updateReport(sqlSession, report);
	}
	@Override
	public int updateReReport(ReportList reli) {
		return rDao.updateReReport(sqlSession, reli);
	}
	
	@Override
	public int writeReport(Report report) {
		return rDao.writeReport(sqlSession,report);
	}
	
	@Override
	public int writeReReport(ReportList reli) {
		return rDao.writeReReport(sqlSession,reli);
	}
}
