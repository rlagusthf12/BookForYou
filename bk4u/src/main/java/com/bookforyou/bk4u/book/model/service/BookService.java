package com.bookforyou.bk4u.book.model.service;

import java.util.ArrayList;

import com.bookforyou.bk4u.book.model.vo.Book;

public interface BookService {

	/**
	 * 관리자 도서목록 조회 (한진)
	 * @return
	 */
	ArrayList<Book> goAdminBookList();
}
