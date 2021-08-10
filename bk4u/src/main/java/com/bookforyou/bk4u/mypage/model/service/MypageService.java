package com.bookforyou.bk4u.mypage.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.bookforyou.bk4u.book.model.vo.Book;
import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.group.model.vo.GroupBoard;
import com.bookforyou.bk4u.member.model.vo.Member;
import com.bookforyou.bk4u.member.model.vo.MemberCategory;
import com.bookforyou.bk4u.member.model.vo.MemberInterest;
import com.bookforyou.bk4u.mypage.model.vo.MyList;
import com.bookforyou.bk4u.order.model.vo.Order;

public interface MypageService {

	int deleteAllMemInterest(Member member);

	int deleteAllMemCategory(Member member);

	ArrayList<MemberInterest> getMemberInterestList(int memNo);

	ArrayList<MemberCategory> getSubCategoryList(int memNo);

	int updateProfileImg(Member member);

	int updateMemPassword(Member member);

	int updateMemberNickname(Member member);

	int updateMemberEmail(Member member);

	int updateMemberDetail(Member member);

	int updateMemberStatusDisable(Member member);

	int selectMyListCount(Member member);

	ArrayList<Book> selectMyList(HashMap<String, Object> listParam);

	int deleteMyList(MyList myList);

	int selectMyOrderListCount(HashMap<String, Object> listParam);

	ArrayList<Order> selectMyOrderList(HashMap<String, Object> listParam, PageInfo pi);

	int selectMyReadingGroupListCount(Member member);

	ArrayList<GroupBoard> selectMyReadingGroupList(PageInfo pi, int memNo);

	int selectMyReadingGroupMemberCount(int groupBoardNo);



}
