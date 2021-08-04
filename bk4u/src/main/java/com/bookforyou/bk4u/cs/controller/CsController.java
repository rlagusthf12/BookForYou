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
		
		int cancelCount = cService.selectAdminCancelCount(filter);
		int returnCount = cService.selectAdminReturnCount(filter);
		int refundCount = cService.selectAdminRefundCount(filter);
		
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
	
}
