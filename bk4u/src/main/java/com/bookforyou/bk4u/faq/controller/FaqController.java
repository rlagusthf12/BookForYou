package com.bookforyou.bk4u.faq.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.common.template.Pagination;
import com.bookforyou.bk4u.faq.model.service.FaqService;
import com.bookforyou.bk4u.faq.model.vo.Faq;
import com.bookforyou.bk4u.faq.model.vo.FaqList1;

@Controller
public class FaqController {
	
	@Autowired
	private FaqService fService;
	
	@RequestMapping("main.faq")
	public ModelAndView selectMain(ModelAndView mv) {
		
		ArrayList<Faq> list = fService.selectFaqList();
		ArrayList<Faq> list1 = fService.selectTypeList();
		
		mv .addObject("list",list)
		   .addObject("list1",list1)
		   .setViewName("faq/faqMain");
		
		return mv;
	}
	
	@RequestMapping("typeUpdateForm.faq")
	public ModelAndView typeUpdateForm(ModelAndView mv) {
		ArrayList<Faq> list1 = fService.selectTypeList();
		
		mv.addObject("list1",list1)
		.setViewName("faq/faqTypeUpdate");
		return mv;
	}
	
	
	@RequestMapping("updateQueType.faq")
	public String updateQueType(FaqList1 f){
		int result1=1;
		ArrayList<Faq> a = f.getFaqList1();
		
		for(int i=0; i<a.size(); i++) {
			int result=0;
			if(a.get(i).getQueTypeNo()==0) {
				 result = fService.insertQueType(a.get(i));
			} else if(a.get(i).getQueType()==null){
				result = fService.deleteQueType(a.get(i));
			}			
			else {
				 result = fService.updateQueType(a.get(i));
			}
			result1 *= result;
		}
		
		return "redirect:typeUpdateForm.faq";
	
	}
	
	@RequestMapping("typeListView.faq")
	public ModelAndView typeListView(ModelAndView mv ,@RequestParam(value="currentPage", defaultValue="1") int currentPage, String type) {
		
		ArrayList<Faq> list1 = fService.selectTypeList();
		HashMap<String, String> map = new HashMap<>();
		map.put("type",type);
		
		int listCount = fService.typeListCount(map);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Faq> list = fService.selectTypeList1(pi, map);
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .addObject("list1", list1)
		  .addObject("type", type)		 
		  .setViewName("faq/faqListView");
		
		return mv;
	}
	
	
	
	
	@RequestMapping("detail.faq")
	public ModelAndView selectFaq(int faqNo, ModelAndView mv) {
		
		int result = fService.increaseCount(faqNo);
		
		if(result>0) {
			Faq f = fService.selectFaq(faqNo);
			mv.addObject("f",f).setViewName("faq/faqDetailView");
		}
		return mv;
		
	}

	@RequestMapping("writeForm.faq")
	public ModelAndView writeForm( ModelAndView mv) {
		
		ArrayList<Faq> list1 = fService.selectTypeList();
		
		mv.addObject("list1", list1)
		.setViewName("faq/faqWriteForm");
		
		return mv;
		
	}
	
	@RequestMapping("write.faq")
	public String writeFaq(Faq f) {	
		
		int result = fService.writeFaq(f);		
		return "redirect:main.faq";
	}
	
	@RequestMapping("delete.faq")
	public String deleteFaq(int faqNo) {
		int result = fService.deleteFaq(faqNo);
		
		
		return "redirect:main.faq";
	}
	
	
	@RequestMapping("updateForm.faq")
	public ModelAndView updateForm( ModelAndView mv, int faqNo) {
		
		ArrayList<Faq> list1 = fService.selectTypeList();	
		Faq f = fService.selectFaq(faqNo);			
		
		mv.addObject("list1", list1)
		.addObject("f",f)
		.setViewName("faq/faqUpdateForm");
		
		return mv;
		
	}
	
	@RequestMapping("update.faq")
	public ModelAndView updateFaq(ModelAndView mv,Faq f) {	
		
		int result = fService.updateFaq(f);		
		int faqNo = f.getFaqNo();
		int result1 = fService.increaseCount(faqNo);
		
		if(result1>0) {
			Faq f1 = fService.selectFaq(faqNo);			
			mv.addObject("f",f1).setViewName("faq/faqDetailView");
		}
		
		
		return mv;		
		
	}
	



}
