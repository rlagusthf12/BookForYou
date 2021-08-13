package com.bookforyou.bk4u.mypage.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.bookforyou.bk4u.book.model.vo.Book;
import com.bookforyou.bk4u.book.model.vo.Grade;
import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.cs.model.vo.Cancel;
import com.bookforyou.bk4u.cs.model.vo.Return;
import com.bookforyou.bk4u.group.model.vo.GroupBoard;
import com.bookforyou.bk4u.member.model.vo.Member;
import com.bookforyou.bk4u.member.model.vo.MemberCategory;
import com.bookforyou.bk4u.member.model.vo.MemberInterest;
import com.bookforyou.bk4u.mypage.model.vo.MyList;
import com.bookforyou.bk4u.order.model.vo.Order;
import com.bookforyou.bk4u.order.model.vo.OrderDetail;
import com.bookforyou.bk4u.payment.model.vo.Payment;
import com.bookforyou.bk4u.point.model.vo.Point;

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

	ArrayList<OrderDetail> selectOrderDetailList(int orderNo);

	int selectMyOrderDeatilQuantity(int orderNo);

	Order selectOrder(int orderNo);

	Payment selectOrderedPayment(int orderNo);

	int insertMyOrderCancel(Cancel cancelData);

	int updateMyOrderDelivered(int orderNo);

	int updateMyOrderDetailDelivered(int orderNo);

	int insertOrderPoint(Point point);

	int insertMyOrderReturn(Return rt);

	int selectMyReturnCount(Return rt);

	int selectMyCancelCount(Cancel cancelData);

	int insertMyBookGrade(Grade grade);





}
