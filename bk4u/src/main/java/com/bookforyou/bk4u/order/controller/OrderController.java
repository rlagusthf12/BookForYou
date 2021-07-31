package com.bookforyou.bk4u.order.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.common.template.Pagination;
import com.bookforyou.bk4u.order.model.service.OrderService;
import com.bookforyou.bk4u.order.model.vo.Order;

@Controller
public class OrderController {

	@Autowired
	private OrderService oService;
	
	@RequestMapping("adminOrderList.or")
	public ModelAndView adminOrderList(ModelAndView mv, @RequestParam(value="currentPage", defaultValue="1") int currentPage,
										@RequestParam(value="orStatus", defaultValue="0") String orStatus,
										@RequestParam(value="array", defaultValue="0") String array){
		
		HashMap<String, String> filter = new HashMap<>();
		filter.put("orStatus", orStatus);
		filter.put("array", array);
		
		int listCount = oService.selectAllListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Order> oList = (ArrayList)oService.selectAdminOrderList(pi, filter);
		
		mv.addObject("pi", pi)
		  .addObject("oList", oList)
		  .addObject("orStatus", orStatus)
		  .addObject("ar", array)
		  .setViewName("order/adminOrderList");
		
		return mv;
	}
		
	
}
