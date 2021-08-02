package com.bookforyou.bk4u.mypage.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bookforyou.bk4u.book.model.vo.Book;

@Repository
public class MypageDao {

	/*
	 * [사용자] 대여 내역 조회 (연지)
	 */
	public ArrayList<Book> selectRentalList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("mypageMapper.selectRentalList");
	}

}
