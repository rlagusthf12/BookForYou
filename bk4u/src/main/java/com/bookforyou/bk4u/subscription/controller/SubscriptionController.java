package com.bookforyou.bk4u.subscription.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.common.template.Pagination;
import com.bookforyou.bk4u.subscription.model.service.SubscriptionService;
import com.bookforyou.bk4u.subscription.model.vo.Subscription;

@Controller
public class SubscriptionController {

	@Autowired
	private SubscriptionService sService;
	
	@RequestMapping("adminSubscList.su")
	public ModelAndView selectAdminSubscList(ModelAndView mv, @RequestParam(value="currentPage", defaultValue="1") int currentPage) {
		
		
		int listCount = sService.selectAllListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Subscription> subsc = sService.selectAdminSubscList(pi);
		
		mv.addObject("subsc", subsc)
		  .addObject("pi", pi)
		  .addObject("listCount", listCount)
		  .setViewName("subscription/adminSubscriptionList");
		
		return mv;
		
	}
}
