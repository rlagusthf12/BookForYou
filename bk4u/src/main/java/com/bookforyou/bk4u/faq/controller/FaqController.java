package com.bookforyou.bk4u.faq.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.common.template.Pagination;
import com.bookforyou.bk4u.faq.model.service.FaqService;
import com.bookforyou.bk4u.faq.model.vo.Faq;


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
	




}
