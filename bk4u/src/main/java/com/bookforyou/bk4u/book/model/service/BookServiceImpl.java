package com.bookforyou.bk4u.book.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookforyou.bk4u.book.model.dao.BookDao;
import com.bookforyou.bk4u.book.model.vo.Book;

@Service
public class BookServiceImpl implements BookService {
	
	@Autowired
	BookDao bookDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<Book> goAdminBookList() {
		return bookDao.goAdminBookList(sqlSession);
	}

}
