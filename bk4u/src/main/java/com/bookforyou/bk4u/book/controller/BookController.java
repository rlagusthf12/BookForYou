package com.bookforyou.bk4u.book.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BookController {
	
	@RequestMapping("adminBookList.ad")
	public String goAdminBookList() {
		return "book/adminBookList";
	}
}
