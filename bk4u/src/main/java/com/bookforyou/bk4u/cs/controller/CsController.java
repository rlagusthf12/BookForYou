package com.bookforyou.bk4u.cs.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.common.template.Pagination;
import com.bookforyou.bk4u.cs.model.service.CsService;
import com.bookforyou.bk4u.cs.model.vo.Cancel;
import com.bookforyou.bk4u.cs.model.vo.Refund;
import com.bookforyou.bk4u.cs.model.vo.Return;

@Controller
public class CsController {

	@Autowired
	private CsService cService;
	
	/**
	 * [관리자] '주문취소', '반품', '환불' 목록 조회 (한진)
	 */
	@RequestMapping("adminCSList.cs")
	public ModelAndView selectAdminCsList(ModelAndView mv, @RequestParam(value="currentPage", defaultValue="1") int currentPage,
											@RequestParam(value="cStatus") String cStatus,
											@RequestParam(value="array", defaultValue="0") String array) {
		
		HashMap<String, String> filter = new HashMap<>();
		filter.put("array", array);
		
		int cancelCount = cService.selectAdminCancelCount();
		int returnCount = cService.selectAdminReturnCount();
		int refundCount = cService.selectAdminRefundCount();
		
		PageInfo pi = null;
		
		if(cStatus.equals("1")) {
			pi = Pagination.getPageInfo(cancelCount, currentPage, 10, 5);
			ArrayList<Cancel> cList = (ArrayList)cService.selectAdminCancelList(pi, filter);
			mv.addObject("cList", cList)
			  .setViewName("cs/adminCancel");
		}else if(cStatus.equals("2")) {
			pi = Pagination.getPageInfo(returnCount, currentPage, 10, 5);
			ArrayList<Return> rtList = (ArrayList)cService.selectAdminReturnList(pi, filter);
			mv.addObject("rtList", rtList)
			  .setViewName("cs/adminReturn");
		}else if(cStatus.equals("3")) {
			pi = Pagination.getPageInfo(refundCount, currentPage, 10, 5);
			ArrayList<Refund> rfList = (ArrayList)cService.selectAdminRefundList(pi, filter);
			mv.addObject("rfList", rfList)
			  .setViewName("cs/adminRefund");
		}
		
		mv.addObject("pi", pi)
		  .addObject("ar", array)
		  .addObject("cancelCount", cancelCount)
		  .addObject("returnCount", returnCount)
		  .addObject("refundCount", refundCount);
		
		return mv;
		
	}
	
	/**
	 * [관리자] 검색조건에 일치하는 CS목록 조회 (한진)
	 */
	@RequestMapping("adminCsListSearch.cs")
	public ModelAndView adminCsSearch(ModelAndView mv, String condition, String keyword,
										@RequestParam(value="currentPage", defaultValue="1") int currentPage,
										@RequestParam(value="array", defaultValue="0") String array,
										@RequestParam(value="cStatus") String cStatus) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("cStatus", cStatus);
		map.put("array", array);
		
		int conListCount = cService.selectAdminSearchCount(map);
		
		PageInfo pi = null;
		
		int cancelCount = cService.selectAdminCancelCount();
		int returnCount = cService.selectAdminReturnCount();
		int refundCount = cService.selectAdminRefundCount();
		
		if(cStatus.equals("1")) {
			pi = Pagination.getPageInfo(conListCount, currentPage, 10, 5);
			ArrayList<Cancel> cList = (ArrayList)cService.selectAdminSearchCancelList(pi, map);
			mv.addObject("cList", cList)
			  .setViewName("cs/adminCancel");
		}else if(cStatus.equals("2")) {
			pi = Pagination.getPageInfo(conListCount, currentPage, 10, 5);
			ArrayList<Return> rtList = (ArrayList)cService.selectAdminSearchReturnList(pi, map);
			mv.addObject("rtList", rtList)
			  .setViewName("cs/adminReturn");
		}else if(cStatus.equals("3")) {
			pi = Pagination.getPageInfo(conListCount, currentPage, 10, 5);
			ArrayList<Refund> rfList = (ArrayList)cService.selectAdminSearchRefundList(pi, map);
			mv.addObject("rfList", rfList)
			  .setViewName("cs/adminRefund");
		}
		
		mv.addObject("pi", pi)
		  .addObject("ar", array)
		  .addObject("cancelCount", cancelCount)
		  .addObject("returnCount", returnCount)
		  .addObject("refundCount", refundCount);
		
		return mv;
	}
	
}
