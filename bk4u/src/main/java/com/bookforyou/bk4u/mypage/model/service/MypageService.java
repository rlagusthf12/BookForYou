package com.bookforyou.bk4u.mypage.model.service;

import java.util.ArrayList;

import com.bookforyou.bk4u.book.model.vo.Book;
import com.bookforyou.bk4u.member.model.vo.Member;
import com.bookforyou.bk4u.member.model.vo.MemberCategory;
import com.bookforyou.bk4u.member.model.vo.MemberInterest;

public interface MypageService {

	int deleteAllMemInterest(Member member);

	int deleteAllMemCategory(Member member);

	ArrayList<MemberInterest> getMemberInterestList(int memNo);

	ArrayList<MemberCategory> getSubCategoryList(int memNo);

	int updateProfileImg(Member member);

	int updateMemPassword(Member member);

	int updateMemberNickname(Member member);


}
