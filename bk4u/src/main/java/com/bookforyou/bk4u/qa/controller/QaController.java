package com.bookforyou.bk4u.qa.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.common.template.Pagination;
import com.bookforyou.bk4u.qa.model.service.QaService;
import com.bookforyou.bk4u.qa.model.vo.As;
import com.bookforyou.bk4u.qa.model.vo.Qa;

@Controller
public class QaController {
	
	@Autowired
	private QaService qService;
	
	@RequestMapping("list.qa")
	public ModelAndView selectList(ModelAndView mv, @RequestParam(value="currentPage", defaultValue="1") int currentPage) {
		
		int listCount = qService.selectListCount();
		int ansListCount =qService.selectAnsListCount();
		int yetListCount=qService.selectYetListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Qa> list = qService.selectList(pi);
		
		for(int i=0; i<list.size();i++) {
			status(list.get(i));
		}
		
		mv.addObject("pi",pi)
		.addObject("listCount",listCount)
		.addObject("ansCount",ansListCount)
		.addObject("yetCount",yetListCount)
			.addObject("list",list)
			.setViewName("qa/qaListView");
		return mv;
	}
	
	@RequestMapping("searchMemNo.qa")
	public ModelAndView searchMemNoQaList(ModelAndView mv, @RequestParam(value="currentPage", defaultValue="1") int currentPage,int memNo) {
		
		int listCount = qService.selectMemNoQaListCount(memNo);		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Qa> list = qService.searchMemNoQaList(pi,memNo);
		
		for(int i=0; i<list.size();i++) {
			status(list.get(i));
		}
		
		mv.addObject("pi",pi)
		.addObject("listCount",listCount)	
			.addObject("list",list)
			.setViewName("qa/qaListView");
		return mv;
	}
	
	@RequestMapping("detail.qa")
	public ModelAndView selectQas(ModelAndView mv, int qaNo) {
				
		Qa q = qService.selectQa(qaNo);		
		As a = qService.selectAs(qaNo);		
		mv.addObject("q",q).addObject("a",a).setViewName("qa/qaDetailView");
		return mv;			
	}
	
	
	
	public void status(Qa q) {
		
		switch(q.getAnsStatus()) {
		
		case "Y": q.setAnsStatus("답변완료");
		break;
			
		case "N": q.setAnsStatus("처리중");
		break;		
		
		default:
			q.setAnsStatus("error");
			System.out.println("error");	
			break;			
		}
		
	}
	

	
}
