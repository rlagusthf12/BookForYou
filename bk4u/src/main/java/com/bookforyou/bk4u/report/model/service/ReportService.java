package com.bookforyou.bk4u.report.model.service;

import java.util.ArrayList;

import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.report.model.vo.Report;
import com.bookforyou.bk4u.report.model.vo.ReportList;

public interface ReportService {
	
	int selectListCount();
	int selectReListCount();
	ArrayList<Report> selectReportList(PageInfo pi);
	ArrayList<ReportList> selectReReportList(PageInfo pi);
	Report selectReport(int reportNo);
	ReportList selectReReport(int reportNo);
	int deleteReport(int reportNo);
	int deleteReReport(int reliNo);
	int updateReport(Report report);
	int updateReReport(ReportList reli);
	int writeReport(Report report);
	int writeReReport(ReportList reli);
}
