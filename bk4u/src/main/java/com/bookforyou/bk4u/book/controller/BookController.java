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
	
	@RequestMapping("adminBookList.ad")
	public String goAdminBookList(Model model) {
		
		ArrayList<Book> bList = (ArrayList)bookService.goAdminBookList();
		System.out.println(bList);
		model.addAttribute("bList", "bList");
		return "book/adminBookList";
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
}
