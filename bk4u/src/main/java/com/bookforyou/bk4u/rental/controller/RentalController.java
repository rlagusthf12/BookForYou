package com.bookforyou.bk4u.rental.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.common.template.Pagination;
import com.bookforyou.bk4u.rental.model.service.RentalService;
import com.bookforyou.bk4u.rental.model.vo.Rental;

@Controller
public class RentalController {
	
	@Autowired
	private RentalService rentalService;
	
	/*
	 * [사용자] 대여 내역 조회 (연지)
	 */
	@RequestMapping("rentalList.mp")
	public ModelAndView selectRentalList(ModelAndView mv, @RequestParam(value="currentPage", defaultValue="1") int currentPage, int memNo) {
		
		int listCount = rentalService.selectRentalCount(memNo);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);

		ArrayList<Rental> rList = rentalService.selectRentalList(pi, memNo);
		
		mv.addObject("pi", pi)
		  .addObject("rList", rList)
		  .setViewName("mypage/mypageRentalList");
		
		return mv;
	}
	
	/*
	 * [사용자] 대여 내역 조회 (연지)
	 */
	@RequestMapping("rentalDetail.mp")
	public ModelAndView selectRental(ModelAndView mv, int rentalNo) {

		Rental rt = rentalService.selectRental(rentalNo);
		
		mv.addObject("rt", rt)
		  .setViewName("mypage/mypageRentalDetail");
		
		return mv;
		
	}
	
	/*
	 * [사용자] 대여 내역 조회 (연지)
	 */
	@ResponseBody
	@RequestMapping(value="rentalInsert.rt", produces="text/html; charset=utf-8")
	public String insertRental(int memNo, int bkNo, int storeNo) {
		
		HashMap<String, Integer> map = new HashMap<>();
		map.put("memNo", memNo);
		map.put("bkNo", bkNo);
		map.put("storeNo", storeNo);

		int result = rentalService.insertRental(map);
		
		System.out.println(result);
		
		return result> 0 ? "success" : "fail";
		
	}

}
