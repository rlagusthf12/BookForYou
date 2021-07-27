package com.bookforyou.bk4u.book.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookforyou.bk4u.book.model.dao.BookDao;
import com.bookforyou.bk4u.book.model.vo.Book;
import com.bookforyou.bk4u.common.model.vo.PageInfo;

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
	
	@Override
	public int selectSearchBookCount(HashMap<String, String> map) {
		return bookDao.selectSearchBookCount(sqlSession, map);
	}
	
	@Override
	public ArrayList<Book> selectSearchBook(PageInfo pi, String condition, String keyword){
		return bookDao.selectSearchBook(sqlSession, pi, condition, keyword);
	}

}
