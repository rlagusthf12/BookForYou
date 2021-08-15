package com.bookforyou.bk4u.report.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.common.template.Pagination;
import com.bookforyou.bk4u.report.model.service.ReportService;
import com.bookforyou.bk4u.report.model.vo.Report;
import com.bookforyou.bk4u.report.model.vo.ReportList;

@Controller
public class ReportController {

	@Autowired
	private ReportService rService;
	
	@RequestMapping("list.re")
	public ModelAndView selectMain(ModelAndView mv, @RequestParam(value="currentPage", defaultValue="1") int currentPage, int memNo) {
		
		int listCount = rService.selectListCount(memNo);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Report> list = rService.selectReportList(pi,memNo);
		for(Report re : list) {
			type(re);
		}
	
		mv .addObject("pi",pi)
		   .addObject("list",list)
		   .setViewName("report/reportList");
		
		return mv;
	}
	
	@RequestMapping("listAd.re")
	public ModelAndView selectMainAd(ModelAndView mv, @RequestParam(value="currentPage", defaultValue="1") int currentPage) {
		
		int listCount = rService.selectListCountAd();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Report> list = rService.selectReportListAd(pi);
		for(Report re : list) {
			type(re);
		}
	
		mv .addObject("pi",pi)
		   .addObject("list",list)
		   .setViewName("report/reportListAd");
		
		return mv;
	}
	
	@RequestMapping("list.reli")
	public ModelAndView selectReli(ModelAndView mv, @RequestParam(value="currentPage", defaultValue="1") int currentPage) {
		
		int listCount = rService.selectReListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<ReportList> list = rService.selectReReportList(pi);
	
		mv .addObject("pi",pi)
		   .addObject("list",list)
		   .setViewName("report/reportReason");
		
		return mv;
	}
	
	
	@RequestMapping("detail.re")
	public ModelAndView selectReport(ModelAndView mv,int reportNo ) {
		Report re = rService.selectReport(reportNo);
		type(re);
		
		mv.addObject("re",re)		
		.setViewName("report/reportDetailView");
		
		return mv;
	}
	
	@RequestMapping("detail.reli")
	public ModelAndView selectReReport(ModelAndView mv,int reliNo ) {
		
		ReportList reli = rService.selectReReport(reliNo);		
		
		mv.addObject("reli",reli)		
		.setViewName("report/reportReasonDatailView");
		
		return mv;
	}
	
	
	@RequestMapping("delete.re")
	public String deleteReport(int reportNo) {
		int result = rService.deleteReport(reportNo);
		
		return "redirect:list.re";
	}
	
	@RequestMapping("delete.reli")
	public String deleteReReport(int reliNo) {
		int result = rService.deleteReReport(reliNo);
		
		return "redirect:list.reli";
	}
	
	
	@RequestMapping("updateForm.re")
	public ModelAndView updateForm(ModelAndView mv,int reportNo) {		
	
		Report re = rService.selectReport(reportNo);
		type(re);
		mv.addObject("re",re)		
		.setViewName("report/reportUpdateForm");		
		return mv;
	}
	
	@RequestMapping("updateForm.reli")
	public ModelAndView updateReForm(ModelAndView mv,int reliNo) {		
	
		ReportList reli = rService.selectReReport(reliNo);		
		mv.addObject("reli",reli)		
		.setViewName("report/reportReasonUpdateForm");		
		return mv;
	}
	
	@RequestMapping("update.re")
	public ModelAndView updateReport(ModelAndView mv,Report report) {
		int result = rService.updateReport(report);
		Report re = rService.selectReport(report.getReportNo());
		mv.addObject("re",re)		
		.setViewName("report/reportDetailView");
		
		return mv;
	}
	
	@RequestMapping("update.reli")
	public ModelAndView updateReReport(ModelAndView mv,ReportList reli) {
		int result = rService.updateReReport(reli);
		ReportList re = rService.selectReReport(reli.getReliNo());
		System.out.println(re);
		mv.addObject("reli",re)		
		.setViewName("report/reportReasonDatailView");
		
		return mv;
	}
	
	@RequestMapping("writeForm.re")
	public ModelAndView writeForm(ModelAndView mv, Report re) {
		type(re);		
		mv.addObject("re",re)
		.setViewName("report/reportReasonWriteForm");
		return mv;
	}
	
	@RequestMapping("writeForm.reli")
	public ModelAndView reasonWriteForm(ModelAndView mv,int reNo) {
		
		Report re = rService.selectReport(reNo);
		
		System.out.println(re);
		type(re);
		
		mv.addObject("re",re)
		.setViewName("report/reportReasonWriteForm");
		return mv;
	}
	
	@RequestMapping("write.re")
	public String reasonWriteForm(ModelAndView mv,Report report) {
		
		int result = rService.writeReport(report);		
		
		return "redirect:list.re";
	}
	
	
	
	@RequestMapping("write.reli")
	public String reasonWriteForm(ModelAndView mv,ReportList reli) {
		
		int result = rService.writeReReport(reli);		
		
		return "redirect:list.reli";
	}
	
	
	
	
	public void type(Report re) {
		
		switch(re.getReportType()) {
		
		case 1: re.setReportType1("자유게시판");
		break;
			
		case 2: re.setReportType1("독서록");
		break;
		
		case 3: re.setReportType1("댓글");
				
		break;
		case 4: re.setReportType1("리뷰");	
		break;
		default:
			re.setReportType1("error");
			System.out.println("error");	
			break;			
		}
		
	}

}
