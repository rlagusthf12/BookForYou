package com.bookforyou.bk4u.book.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.bookforyou.bk4u.book.model.vo.Book;
import com.bookforyou.bk4u.common.model.vo.PageInfo;

public interface BookService {

	/**
	 * 관리자 도서목록 조회 (한진)
	 * @return
	 */
	int selectAdminListCount();
	ArrayList<Book> selectAdminBookList(PageInfo pi);

	int selectSearchBookCount(HashMap<String, String> map);

	ArrayList<Book> selectSearchBook(PageInfo pi, String condition, String keyword);
}
