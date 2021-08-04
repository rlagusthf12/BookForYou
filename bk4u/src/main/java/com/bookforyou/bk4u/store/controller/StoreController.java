package com.bookforyou.bk4u.store.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bookforyou.bk4u.book.model.service.BookService;
import com.bookforyou.bk4u.book.model.vo.Book;
import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.common.template.Pagination;
import com.bookforyou.bk4u.rental.model.vo.Rental;
import com.bookforyou.bk4u.store.model.service.StoreService;
import com.bookforyou.bk4u.store.model.vo.OffBook;
import com.bookforyou.bk4u.store.model.vo.Store;

@Controller
public class StoreController {
	
	@Autowired
	private StoreService storeService;
	
	@Autowired
	private BookService bookService;
	
	/*
	 * [공통] 오프라인 매장 메인 조회 (연지)
	 */
	@RequestMapping("storeMain.st")
	public ModelAndView storeMain(ModelAndView mv) {
		
		mv.setViewName("store/storeMainView");
		
		return mv;
	}
	
	/*
	 * [공통] 오프라인 매장 상세 조회 (연지)
	 */
	@RequestMapping("storeDetail.st")
	public ModelAndView selectStoreDetail(ModelAndView mv, int storeNo) {
		
		Store st = storeService.selectStoreDetail(storeNo);
		
		ArrayList<OffBook> obList = storeService.selectStoreOffBookList(storeNo);
		ArrayList<OffBook> obRList = storeService.selectStoreOffBookListRecent(storeNo);
		
		mv.addObject("st", st)
		  .addObject("obList", obList)
		  .addObject("obRList", obRList)
		  .setViewName("store/storeDetailView");
		
		return mv;
	}
	
	/*
	 * [공통] 오프라인 매장 도서 상세 조회 (연지)
	 */
	@RequestMapping("bookDetail.st")
	public ModelAndView selectOffBook(ModelAndView mv, int bkNo, int storeNo) {
		
		HashMap<String, Integer> map = new HashMap<>();
		map.put("bkNo", bkNo);
		map.put("storeNo", storeNo);
		
		Book bk = bookService.selectBook(bkNo);
		OffBook ob = storeService.selectOffBook(map);
		ArrayList<Store> sList = storeService.selectOffBookStoreList(bkNo);
		
		mv.addObject("bk", bk)
		  .addObject("ob", ob)
		  .addObject("sList", sList)
		  .setViewName("store/offBookDetailView");
		
		return mv;
	}
	
}
