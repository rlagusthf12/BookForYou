package com.bookforyou.bk4u.store.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
		
		mv.addObject("st", st)
		  .setViewName("store/storeDetailView");
		
		return mv;
	}
	
}
