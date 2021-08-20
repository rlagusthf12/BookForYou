package com.bookforyou.bk4u.mypage.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookforyou.bk4u.board.model.vo.Board;
import com.bookforyou.bk4u.book.model.dao.BookDao;
import com.bookforyou.bk4u.book.model.vo.Book;
import com.bookforyou.bk4u.book.model.vo.Grade;
import com.bookforyou.bk4u.booklist.model.vo.Booklist;
import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.cs.model.vo.Cancel;
import com.bookforyou.bk4u.cs.model.vo.Refund;
import com.bookforyou.bk4u.cs.model.vo.Return;
import com.bookforyou.bk4u.group.model.vo.GroupBoard;
import com.bookforyou.bk4u.meetboard.model.vo.MeetBoard;
import com.bookforyou.bk4u.member.model.vo.Member;
import com.bookforyou.bk4u.member.model.vo.MemberCategory;
import com.bookforyou.bk4u.member.model.vo.MemberInterest;
import com.bookforyou.bk4u.mypage.model.dao.MypageDao;
import com.bookforyou.bk4u.mypage.model.vo.MyList;
import com.bookforyou.bk4u.order.model.vo.Order;
import com.bookforyou.bk4u.order.model.vo.OrderDetail;
import com.bookforyou.bk4u.payment.model.vo.Payment;
import com.bookforyou.bk4u.point.model.vo.Point;
import com.bookforyou.bk4u.reply.model.vo.Reply;

@Service
public class MypageServiceImpl implements MypageService {
	
	@Autowired
	private MypageDao mypageDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int deleteAllMemInterest(Member member) {
		return mypageDao.deleteAllMemInterest(sqlSession,member);
	}

	@Override
	public int deleteAllMemCategory(Member member) {
		return mypageDao.deleteAllMemCategory(sqlSession, member);
	}

	@Override
	public ArrayList<MemberInterest> getMemberInterestList(int memNo) {
		return mypageDao.selectMemberInterestList(sqlSession,memNo);
	}

	@Override
	public ArrayList<MemberCategory> getSubCategoryList(int memNo) {
		return mypageDao.selectSubCategoryList(sqlSession,memNo);
	}

	@Override
	public int updateProfileImg(Member member) {
		return mypageDao.updateProfileImg(sqlSession,member);
	}

	@Override
	public int updateMemPassword(Member member) {
		return mypageDao.updateMemPassword(sqlSession,member);
	}

	@Override
	public int updateMemberNickname(Member member) {
		return mypageDao.updateMemberNickname(sqlSession,member);
	}

	@Override
	public int updateMemberEmail(Member member) {
		return mypageDao.updateMemberEmail(sqlSession,member);
	}

	@Override
	public int updateMemberDetail(Member member) {
		return mypageDao.updateMemberDetail(sqlSession,member);
	}

	@Override
	public int updateMemberStatusDisable(Member member) {
		return mypageDao.updateMemberStatusDisable(sqlSession,member);
	}

	@Override
	public int selectMyListCount(Member member) {
		return mypageDao.selectMyListCount(sqlSession,member);
	}

	@Override
	public ArrayList<Book> selectMyList(HashMap<String, Object> listParam) {
		
		return mypageDao.selectMyList(sqlSession,listParam);
	}

	@Override
	public int deleteMyList(MyList list) {
		return mypageDao.deleteMyList(sqlSession,list);
	}

	@Override
	public int selectMyOrderListCount(HashMap<String, Object> listParam) {
		return mypageDao.selectMyOrderListCount(sqlSession, listParam);
	}

	@Override
	public ArrayList<Order> selectMyOrderList(HashMap<String, Object> listParam, PageInfo pi) {
		return mypageDao.selectMyOrderList(sqlSession, listParam,pi);
	}

	@Override
	public int selectMyReadingGroupListCount(Member member) {
		return mypageDao.selectMyReadingGroupListCount(sqlSession,member);
	}

	@Override
	public ArrayList<GroupBoard> selectMyReadingGroupList(PageInfo pi, int memNo) {
		return mypageDao.selectMyReadingGroupList(sqlSession,pi,memNo);
	}

	@Override
	public int selectMyReadingGroupMemberCount(int groupBoardNo) {
		return mypageDao.selectMyReadingGroupMemberCount(sqlSession,groupBoardNo);
	}

	@Override
	public ArrayList<OrderDetail> selectOrderDetailList(int orderNo) {
		return mypageDao.selectMyOrderDetailList(sqlSession,orderNo);
	}

	@Override
	public int selectMyOrderDeatilQuantity(int orderNo) {
		return mypageDao.selectMyOrderDetailQuantity(sqlSession,orderNo);
	}

	@Override
	public Order selectOrder(int orderNo) {
		return mypageDao.selectMyOrder(sqlSession,orderNo);
	}

	@Override
	public Payment selectOrderedPayment(int orderNo) {
		return mypageDao.selectOrderedPayment(sqlSession,orderNo);
	}

	@Override
	public int insertMyOrderCancel(Cancel cancelData) {
		return mypageDao.insertMyOrderCancel(sqlSession,cancelData);
	}

	@Override
	public int updateMyOrderDelivered(int orderNo) {
		return mypageDao.updateMyOrderDelivered(sqlSession,orderNo);
	}

	@Override
	public int updateMyOrderDetailDelivered(int orderNo) {
		return mypageDao.updateMyOrderDetailDelivered(sqlSession, orderNo);
	}

	@Override
	public int insertOrderPoint(Point point) {
		return mypageDao.insertOrderPoint(sqlSession,point);
	}

	@Override
	public int insertMyOrderReturn(Return rt) {
		return mypageDao.insertMyOrderReturn(sqlSession,rt);
	}

	@Override
	public int selectMyReturnCount(Return rt) {
		return mypageDao.selectMyReturnCount(sqlSession,rt);
	}

	@Override
	public int selectMyCancelCount(Cancel cancelData) {
		return mypageDao.selectMyCancelCount(sqlSession,cancelData);
	}

	@Override
	public int insertMyBookGrade(Grade grade) {
		return mypageDao.insertMyBookGrade(sqlSession, grade);
	}

	@Override
	public Refund selectMyRefund(int orderNo) {
		return mypageDao.selectMyRefund(sqlSession,orderNo);
	}

	@Override
	public int selectMyBoardListCount(int memNo) {
		return mypageDao.selectMyBoardListCount(sqlSession,memNo);
	}

	@Override
	public ArrayList<Board> selectMyBoardList(PageInfo pi, int memNo) {
		return mypageDao.selectMyBoardList(sqlSession,pi,memNo);
	}

	@Override
	public int selectMyReplyListCount(int memNo) {
		return mypageDao.selectMyReplyListCount(sqlSession,memNo);
	}

	@Override
	public ArrayList<Reply> selectMyReplyList(PageInfo pi, int memNo) {
		return mypageDao.selectMyReplyList(sqlSession,pi,memNo);
	}
	
	//마이페이지 독서록
	@Override
	public int selectListCount() {
		return mypageDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Booklist> selectMbList(PageInfo pi) {
		return mypageDao.selectMbList(sqlSession, pi);
	}
	// 스크랩조회
	@Override
	public int selectClippingListCount() {
		return mypageDao.selectClippingListCount(sqlSession);
	}
	
	@Override
	public ArrayList<Booklist> selectClippingList(PageInfo pi) {
		return mypageDao.selectClippingList(sqlSession, pi);
	}
	
	// 스크랩추가

	@Override
	public int insertClippinglist(Booklist bl) {
		return mypageDao.insertClippinglist(sqlSession, bl);
	}

	// 스크랩 삭제
	@Override
	public int deleteClipping(int brno) {
		return mypageDao.deleteClipping(sqlSession, brno);
	}

	

	


}
