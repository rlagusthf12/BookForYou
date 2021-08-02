package com.bookforyou.bk4u.mypage.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bookforyou.bk4u.book.model.service.BookService;
import com.bookforyou.bk4u.book.model.vo.Book;
import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.common.template.Pagination;
import com.bookforyou.bk4u.mypage.model.service.MypageService;
import com.bookforyou.bk4u.rental.model.vo.Rental;

@Controller
public class MypageController {
	
	@Autowired
	private MypageService mypageService;
	
	/*
	 * [사용자] 대여 내역 조회 (연지)
	 */
	@RequestMapping("rentalList.mp")
	public ModelAndView selectRentalList(ModelAndView mv, @RequestParam(value="currentPage", defaultValue="1") int currentPage, int memNo) {
		
		int listCount = mypageService.selectRentalCount(memNo);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);

		ArrayList<Rental> rList = mypageService.selectRentalList(pi, memNo);
		
		return mv;
	}
}
