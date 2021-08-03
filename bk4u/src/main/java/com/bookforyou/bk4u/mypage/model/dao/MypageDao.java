package com.bookforyou.bk4u.mypage.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bookforyou.bk4u.book.model.vo.Book;
import com.bookforyou.bk4u.member.model.vo.Member;

@Repository
public class MypageDao {

	public int deleteAllMemInterest(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.delete("memberMapper.deleteAllMemInterest",member);
	}

	public int deleteAllMemCategory(SqlSessionTemplate sqlSession, Member member) {
		// TODO Auto-generated method stub
		return sqlSession.delete("memberMapper.deleteAllMemCategory",member);
	}



}
