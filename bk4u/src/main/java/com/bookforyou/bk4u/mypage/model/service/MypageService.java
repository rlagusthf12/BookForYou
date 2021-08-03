package com.bookforyou.bk4u.mypage.model.service;

import java.util.ArrayList;

import com.bookforyou.bk4u.book.model.vo.Book;
import com.bookforyou.bk4u.member.model.vo.Member;

public interface MypageService {

	int deleteAllMemInterest(Member member);

	int deleteAllMemCategory(Member member);

}
