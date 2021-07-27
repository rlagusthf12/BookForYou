package com.bookforyou.bk4u.book.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bookforyou.bk4u.book.model.vo.Book;

@Repository
public class BookDao {
	public ArrayList<Book> goAdminBookList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("bookMapper.bookList");
	}
}
