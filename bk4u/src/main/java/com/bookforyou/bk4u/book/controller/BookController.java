package com.bookforyou.bk4u.book.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bookforyou.bk4u.book.model.service.BookService;
import com.bookforyou.bk4u.book.model.vo.Book;
import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.common.template.Pagination;

@Controller
public class BookController {
	
	@Autowired
	private BookService bookService;
	
	/**
	 * [관리자] 전체 도서 목록 조회 + 페이징, 상태별 개수 조회 (한진)
	 * @param mv
	 * @param currentPage
	 * @return
	 */
	@RequestMapping("adminBookList.bk")
	public ModelAndView adminBookList(ModelAndView mv, @RequestParam(value="currentPage", defaultValue="1") int currentPage) {
		
		int listCount = bookService.selectAllListCount();
	
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);	
		ArrayList<Book> bList = (ArrayList)bookService.selectAdminBookList(pi);
		
		int selectStatusY = bookService.selectStatusYCount();
		int selectSelStatusY = bookService.selectSelStatusYCount();
		int selectStatusN = listCount - selectStatusY;
		int selectSelStatusN = listCount - selectSelStatusY;
		
		mv.addObject("pi", pi)
		  .addObject("bList", bList)
		  .addObject("listCount", listCount)
		  .addObject("selectStatusY", selectStatusY)
		  .addObject("selectStatusN", selectStatusN)
		  .addObject("selectSelStatusY", selectSelStatusY)
		  .addObject("selectSelStatusN", selectSelStatusN)
		  .setViewName("book/adminBookList");
		
		return mv;
	}
	
	@RequestMapping("search.bk")
	public ModelAndView searchBook(ModelAndView mv, @RequestParam(value="currentPage", defaultValue="1") int currentPage, String condition, String keyword) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		int listCount = bookService.selectSearchBookCount(map);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);

		ArrayList<Book> bList = bookService.selectSearchBook(pi, condition, keyword);
		
		mv.addObject("pi", pi)
		  .addObject("bList", bList)
		  .setViewName("book/bookSearchList.jsp");
		
		return mv;
	}
	
	/**
	 * [관리자] 검색조건에 일치하는 도서 목록 조회 (한진) 
	 * @param mv
	 * @param currentPage
	 * @param condition
	 * @param bkStatus
	 * @param bkSelStatus
	 * @param keyword
	 * @return
	 */
	@RequestMapping("adminSearch.bk")
	public ModelAndView adminBookSearch(ModelAndView mv, @RequestParam(value="currentPage", defaultValue="1") int currentPage, 
										String condition, String bkStatus, String bkSelStatus, String keyword) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("bkStatus", bkStatus);
		map.put("bkStatus", bkStatus);
		map.put("keyword", keyword);
		
		int conListCount = bookService.selectAdminSearchCount(map);
		
		System.out.println(conListCount);
		
		PageInfo pi = Pagination.getPageInfo(conListCount, currentPage, 10, 5);
		ArrayList<Book> bList = bookService.selectAdminSearchList(pi, map);
		
		int listCount = bookService.selectAllListCount();
		int selectStatusY = bookService.selectStatusYCount();
		int selectSelStatusY = bookService.selectSelStatusYCount();
		int selectStatusN = listCount - selectStatusY;
		int selectSelStatusN = listCount - selectSelStatusY;
		
		mv.addObject("pi", pi)
		  .addObject("bList", bList)
		  .addObject("conListCount", conListCount)
		  .addObject("listCount", listCount)
		  .addObject("selectStatusY", selectStatusY)
		  .addObject("selectStatusN", selectStatusN)
		  .addObject("selectSelStatusY", selectSelStatusY)
		  .addObject("selectSelStatusN", selectSelStatusN)
		  .addObject("keyword", keyword)
		  .addObject("bkStatus", bkStatus)
		  .addObject("bkSelStatus", bkSelStatus)
		  .setViewName("book/adminBookList");
		
		return mv;
		
	}
}
