package com.bookforyou.bk4u.rental.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	/**
	 * [관리자] 대여 목록 조회 (한진)
	 */
	@RequestMapping("adminRentalList.re")
	public ModelAndView selectAdminRentalList(ModelAndView mv, @RequestParam(value="currentPage", defaultValue="1") int currentPage,
												@RequestParam(value="rStatus", defaultValue="0") int rStatus,
												@RequestParam(value="array", defaultValue="0") int array) {
		
		HashMap<String, Integer> filter = new HashMap<>();
		filter.put("rStatus", rStatus);
		filter.put("array", array);
		
		int listCount = rentalService.selectAdminRentalListCount();
		
		int reserveCount = rentalService.selectAdminReserveListCount();
		int rentalIngCount = rentalService.selectAdminRentalIngListCount();
		int returnCount = rentalService.selectAdminReturnListCount();
		int overDueCount = rentalService.selectAdminOverdueListCount();
		int rentalCancelCount = rentalService.selectAdminRentalCancelListCount();
		
		PageInfo pi = null;
		
		if(rStatus == 0) {
			pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
			mv.setViewName("rental/adminRentalList");
		}else {
			if(rStatus == 1) {
				pi = Pagination.getPageInfo(reserveCount, currentPage, 10, 5);
				mv.setViewName("rental/adminReserve");
			}else if(rStatus == 2) {
				pi = Pagination.getPageInfo(rentalIngCount, currentPage, 10, 5);
				mv.setViewName("rental/adminRentalIng");
			}else if(rStatus == 3) {
				pi = Pagination.getPageInfo(returnCount, currentPage, 10, 5);
				mv.setViewName("rental/adminReturnBook");
			}else if(rStatus == 4) {
				pi = Pagination.getPageInfo(overDueCount, currentPage, 10, 5);
				mv.setViewName("rental/adminOverdue");
			}else if(rStatus == 5) {
				pi = Pagination.getPageInfo(rentalCancelCount, currentPage, 10, 5);
				mv.setViewName("rental/adminRentalCancel");
			}
		} 
		
		ArrayList<Rental> rList = rentalService.selectAdminRentalList(pi, filter);
		
		mv.addObject("listCount", listCount)
		  .addObject("reserveCount", reserveCount)
		  .addObject("rentalIngCount", rentalIngCount)
		  .addObject("returnCount", returnCount)
		  .addObject("overDueCount", overDueCount)
		  .addObject("rentalCancelCount", rentalCancelCount)
		  .addObject("pi", pi)
		  .addObject("rStatus", rStatus)
		  .addObject("ar", array)
		  .addObject("rList", rList);
		
		return mv;
	}
	
	/**
	 * [관리자] 검색 조건에 일치하는 대여 목록 조회 (한진)
	 */
	@RequestMapping("adminRentalListSearch.re")
	public ModelAndView selectAdminRentalListSearch(ModelAndView mv, @RequestParam(value="currentPage", defaultValue="1") int currentPage,
													String condition, String keyword,
													@RequestParam(value="rStatus", defaultValue="0") String rStatus,
													@RequestParam(value="array", defaultValue="0") String array) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("rStatus", rStatus);
		map.put("array", array);
		
		int conListCount = rentalService.selectAdminListSearchCount(map);
		
		int listCount = rentalService.selectAdminRentalListCount();
		
		int reserveCount = rentalService.selectAdminReserveListCount();
		int rentalIngCount = rentalService.selectAdminRentalIngListCount();
		int returnCount = rentalService.selectAdminReturnListCount();
		int overDueCount = rentalService.selectAdminOverdueListCount();
		int rentalCancelCount = rentalService.selectAdminRentalCancelListCount();
		
		PageInfo pi = Pagination.getPageInfo(conListCount, currentPage, 10, 5);
		ArrayList<Rental> rList = rentalService.selectAdminRentalSearchList(pi, map);
		
		if(rStatus.equals("0")) {
			
			mv.setViewName("rental/adminRentalList");
		}else {
			if(rStatus.equals("1")) {
				mv.setViewName("rental/adminReserve");
			}else if(rStatus.equals("2")) {
				mv.setViewName("rental/adminRentalIng");
			}else if(rStatus.equals("3")) {
				mv.setViewName("rental/adminReturnBook");
			}else if(rStatus.equals("4")) {
				mv.setViewName("rental/adminOverdue");
			}else if(rStatus.equals("5")) {
				mv.setViewName("rental/adminRentalCancel");
			}
		} 
		
		mv.addObject("listCount", listCount)
		  .addObject("reserveCount", reserveCount)
		  .addObject("rentalIngCount", rentalIngCount)
		  .addObject("returnCount", returnCount)
		  .addObject("overDueCount", overDueCount)
		  .addObject("rentalCancelCount", rentalCancelCount)
		  .addObject("conListCount", conListCount)
		  .addObject("pi", pi)
		  .addObject("rStatus", rStatus)
		  .addObject("ar", array)
		  .addObject("keyword", keyword)
		  .addObject("condition", condition)
		  .addObject("rList", rList);
		
		return mv;
		
	}
	
	/**
	 * [관리자] 대여 상태 변경 (한진)
	 */
	@RequestMapping("adminRentalStatusHandling.re")
	public String updateRentalStatus(RedirectAttributes ra, @RequestParam(value="selectedRNo") List<String> selectedRNo, String statusValue, String page) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("statusValue", statusValue);
		
		int result = 0;
		for(int i=0; i<selectedRNo.size(); i++) {
			map.put("rNo", selectedRNo.get(i));
			
			result = rentalService.updateRentalStatus(map);
			
			if(statusValue.equals("rental")) {
				rentalService.updateRentalReceiveDate(map);
			}else if(statusValue.equals("return")) {
				rentalService.updateRentalReturnDate(map);
			}
		}
		
		if(result > 0) {
			ra.addAttribute("alertMsg", "대여 상태가 변경되었습니다.");
		}
		
		if(page.equals("reserve")) {
			ra.addAttribute("rStatus", "1");
		}else if(page.equals("rental")) {
			ra.addAttribute("rStatus", "2");
		}else if(page.equals("overDue")) {
			ra.addAttribute("rStatus", "4");
		}
		
		return "redirect:/adminRentalList.re?";
	}
}
