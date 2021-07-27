package com.bookforyou.bk4u.book.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bookforyou.bk4u.book.model.service.BookService;
import com.bookforyou.bk4u.book.model.vo.Book;

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
}
