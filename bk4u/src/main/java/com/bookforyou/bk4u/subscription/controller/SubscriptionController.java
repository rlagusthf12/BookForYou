package com.bookforyou.bk4u.subscription.controller;

import java.util.ArrayList;
import java.util.HashMap;

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
	
	/**
	 * [관리자] 정기구독 목록 조회 (한진)
	 */
	@RequestMapping("adminSubscList.su")
	public ModelAndView selectAdminSubscList(ModelAndView mv, @RequestParam(value="currentPage", defaultValue="1") int currentPage,
											@RequestParam(value="array", defaultValue="0") String array,
											@RequestParam(value="subscStatus", defaultValue="0") String subscStatus) {
		
		HashMap<String, String> filter = new HashMap<>();
		filter.put("array", array);
		filter.put("subscStatus", subscStatus);
		
		int listCount = sService.selectAllListCount();
		int basicCount = sService.selectBasicListCount();
		int premiumCount = sService.selectPremiumListCount();
		int statusYCount = sService.selectStatusYListCount();
		int statusNCount = sService.selectStatusNListCount();
		
		PageInfo pi = null;
		
		if(subscStatus.equals("0")) {
			pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		}else {
			if(subscStatus.equals("1")) {
				pi = Pagination.getPageInfo(basicCount, currentPage, 10, 5);
			}else if(subscStatus.equals("2")) {
				pi = Pagination.getPageInfo(premiumCount, currentPage, 10, 5);
			}else if (subscStatus.equals("3")) {
				pi = Pagination.getPageInfo(statusYCount, currentPage, 10, 5);
			}else if (subscStatus.equals("4")) {
				pi = Pagination.getPageInfo(statusNCount, currentPage, 10, 5);
			}
		}
		
		ArrayList<Subscription> subsc = sService.selectAdminSubscList(pi, filter);
		
		mv.addObject("subsc", subsc)
		  .addObject("pi", pi)
		  .addObject("ar", array)
		  .addObject("listCount", listCount)
		  .addObject("basicCount", basicCount)
		  .addObject("premiumCount", premiumCount)
		  .addObject("statusYCount", statusYCount)
		  .addObject("statusNCount", statusNCount)
		  .addObject("subscStatus", subscStatus)
		  .setViewName("subscription/adminSubscriptionList");
		
		return mv;
		
	}
	
	/**
	 * [관리자] 검색조건에 일치하는 정기구독 목록 조회 (한진)
	 */
	@RequestMapping("adminSubscListSearch.su")
	public ModelAndView selectAdminSubscListSearch(ModelAndView mv, @RequestParam(value="currentPage", defaultValue="1") int currentPage,
													@RequestParam(value="array", defaultValue="0") String array,
													@RequestParam(value="subscStatus", defaultValue="0") String subscStatus,
													String condition, String keyword) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("subscStatus", subscStatus);
		map.put("array", array);
		
		int conListCount = sService.selectAdminSubscListSearchCount(map);
		
		int listCount = sService.selectAllListCount();
		int basicCount = sService.selectBasicListCount();
		int premiumCount = sService.selectPremiumListCount();
		int statusYCount = sService.selectStatusYListCount();
		int statusNCount = sService.selectStatusNListCount();
		
		PageInfo pi = null;
		
		if(subscStatus.equals("0")) {
			pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		}else {
			if(subscStatus.equals("1")) {
				pi = Pagination.getPageInfo(basicCount, currentPage, 10, 5);
			}else if(subscStatus.equals("2")) {
				pi = Pagination.getPageInfo(premiumCount, currentPage, 10, 5);
			}else if (subscStatus.equals("3")) {
				pi = Pagination.getPageInfo(statusYCount, currentPage, 10, 5);
			}else if (subscStatus.equals("4")) {
				pi = Pagination.getPageInfo(statusNCount, currentPage, 10, 5);
			}
		}
		
		ArrayList<Subscription> subsc = sService.selectAdminSubscSearchList(pi, map);
		
		mv.addObject("subsc", subsc)
		  .addObject("pi", pi)
		  .addObject("ar", array)
		  .addObject("listCount", listCount)
		  .addObject("basicCount", basicCount)
		  .addObject("premiumCount", premiumCount)
		  .addObject("statusYCount", statusYCount)
		  .addObject("statusNCount", statusNCount)
		  .addObject("subscStatus", subscStatus)
		  .setViewName("subscription/adminSubscriptionList");
		
		return mv;
	
	}
}
