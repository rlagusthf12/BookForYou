package com.bookforyou.bk4u.qa.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bookforyou.bk4u.common.model.service.MailSendService;
import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.common.template.Pagination;
import com.bookforyou.bk4u.faq.model.vo.Faq;
import com.bookforyou.bk4u.qa.model.service.QaService;
import com.bookforyou.bk4u.qa.model.vo.As;
import com.bookforyou.bk4u.qa.model.vo.Qa;

@Controller
public class QaController {
	
	@Autowired
	private QaService qService;
	
	@Autowired
	private MailSendService mss;
	
	@RequestMapping("list.qa")
	public ModelAndView selectList(ModelAndView mv, @RequestParam(value="currentPage", defaultValue="1") int currentPage) {
		
		int listCount = qService.selectListCount();
		int ansListCount =qService.selectAnsListCount();
		int yetListCount=qService.selectYetListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Qa> list = qService.selectList(pi);
		ArrayList<Qa> list1 = qService.selectTypeList();		
		for(int i=0; i<list.size();i++) {
			status(list.get(i));
		}
		
		mv.addObject("pi",pi)
		.addObject("listCount",listCount)
		.addObject("ansCount",ansListCount)
		.addObject("yetCount",yetListCount)
		 .addObject("list1", list1)
			.addObject("list",list)
			.setViewName("qa/qaListView");
		return mv;
	}
	
	@RequestMapping("typeListView.qa")
	public ModelAndView typeListView(ModelAndView mv ,@RequestParam(value="currentPage", defaultValue="1") int currentPage, String type) {
				
		
		
		ArrayList<Qa> list1 = qService.selectTypeList();
		HashMap<String, String> map = new HashMap<>();
		map.put("type",type);
		
		int listCount = qService.typeListCount(map);
		int ansListCount =qService.typeAnsListCount(map);
		int yetListCount=qService.typeYetListCount(map);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Qa> list = qService.selectTypeList1(pi, map);
		for(int i=0; i<list.size();i++) {
			status(list.get(i));
		}
		mv.addObject("pi", pi)
		.addObject("listCount",listCount)
		.addObject("ansCount",ansListCount)
		.addObject("yetCount",yetListCount)
		  .addObject("list", list)
		  .addObject("list1", list1)
		  .addObject("type", type)		 
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
	
	@RequestMapping("writeForm.as")
	public ModelAndView writeFormAns(ModelAndView mv, int qaNo) {			
		
		Qa q = qService.selectQa(qaNo);
		
		mv.addObject("q",q).setViewName("qa/qaAnsWrite");
		
		return mv;
	}
	
	@RequestMapping("writeForm.qa")
	public ModelAndView writeFormQa(ModelAndView mv) {			
		
		ArrayList<Qa> list1 = qService.selectTypeList();
		
		mv.addObject("list1",list1).setViewName("qa/qaWriteForm");
		
		return mv;
	}
	
	@RequestMapping("write.qa")
	public String writeQa(ModelAndView mv, Qa qa) {		
		
		int result = qService.writeQa(qa);		
	
	 return "redirect:list.qa";		
		
	}
	
	@RequestMapping("write.as")
	public String writeAns(ModelAndView mv, As as) {		
		
		int result = qService.writeAns(as);
		int result1 = qService.updateStatus(as.getQaNo());
		Qa qa = qService.selectQa(as.getQaNo());
		
		if(qa.getEmail()!=null) {
		mss.sendMail(qa.getEmail());
		}		
		
		return "redirect:list.qa";
	}
	
	@RequestMapping("updateForm.qa")
	public ModelAndView updateQaForm(ModelAndView mv, int qaNo) {
		Qa q = qService.selectQa(qaNo);
		ArrayList<Qa> list1 = qService.selectTypeList();
		mv.addObject("q",q).addObject("list1",list1).setViewName("qa/qaUpdate");
		
		return mv;
	}
	
	@RequestMapping("updateForm.as")
	public ModelAndView updateAnsForm(ModelAndView mv, int qaNo) {
		Qa q = qService.selectQa(qaNo);
		As a = qService.selectAs(qaNo);	
		mv.addObject("q",q).addObject("a",a).setViewName("qa/qaAnsUpdate");
		
		return mv;
	}
	
	@RequestMapping("update.as")
	public String updateAns(As as) {


		int result = qService.updateAns(as);
		
		return "redirect:detail.qa?qaNo="+as.getQaNo();
	}
	
	@RequestMapping("update.qa")
	public String updateQa(Qa qa) {


		int result = qService.updateQa(qa);
		
		return "redirect:detail.qa?qaNo="+qa.getQaNo();
	}
	
	@RequestMapping("delete.qa")
	public String deleteQa(int qaNo) {
		Qa qa = qService.selectQa(qaNo);
		
			int result1 = qService.deleteAns(qaNo);
			int result = qService.deleteQa(qaNo);		
		
		
		return "redirect:list.qa";
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
