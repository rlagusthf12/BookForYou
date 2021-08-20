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
import com.bookforyou.bk4u.store.model.service.StoreService;
import com.bookforyou.bk4u.store.model.vo.OffBook;
import com.bookforyou.bk4u.store.model.vo.Store;
import com.bookforyou.bk4u.store.model.vo.StoreBook;

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
	
	
	//관리자 (김현솔)
	@RequestMapping("list.store")
	public ModelAndView selectListStore(ModelAndView mv, @RequestParam(value="currentPage", defaultValue="1") int currentPage){
		
		int listCount = storeService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount,currentPage,10,5);
		ArrayList<Store> list = storeService.selectStoreList(pi);
		
		mv.addObject("listCount",listCount).addObject("pi",pi).addObject("list",list).setViewName("store/storeListView");
		return mv;
	}
	
	@RequestMapping("searchList.st")
	public ModelAndView selectSearchListStore(ModelAndView mv, @RequestParam(value="currentPage", defaultValue="1") int currentPage, String keyword, String type){
		
		HashMap<String, String> map = new HashMap<>();
		
		map.put("keyword", keyword);
		map.put("type", type);
		
		int listCount = storeService.selectSearchListCount(map);
		
		PageInfo pi = Pagination.getPageInfo(listCount,currentPage,10,5);
		ArrayList<Store> list = storeService.selectSearchStoreList(pi,map);
		
		mv.addObject("listCount",listCount).addObject("pi",pi).addObject("list",list).addObject("keyword",keyword).addObject("type",type).setViewName("store/storeListView");
		return mv;
	}
	
	@RequestMapping("list.storebook")
	public ModelAndView selectListStoreBook(ModelAndView mv, @RequestParam(value="currentPage", defaultValue="1") int currentPage,int storeNo){
		
		int listCount = storeService.selectBookListCount(storeNo);
		
		PageInfo pi = Pagination.getPageInfo(listCount,currentPage,10,5);
		ArrayList<StoreBook> list = storeService.selectStoreBookList(pi,storeNo);
		
		mv.addObject("listCount",listCount).addObject("pi",pi).addObject("list",list).addObject("storeNo", storeNo).setViewName("store/storeBooks");
		return mv;
	}
	
	@RequestMapping("add.store")
	public String addStore(Store st) {
		
			int result =  storeService.addStore(st);
		return "redirect:list.store";
	}
	
	@RequestMapping("update.store")
	public String updateStore(Store st) {
		
			int result =  storeService.updateStore(st);
		return "redirect:list.store";
	}
	

	@RequestMapping("delete.store")
	public String deleteStore(int storeNo) {
		
			int result =  storeService.deleteStore(storeNo);
		return "redirect:list.store";
	}
	
}
