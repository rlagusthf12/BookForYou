package com.bookforyou.bk4u.mypage.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bookforyou.bk4u.book.model.vo.Book;
import com.bookforyou.bk4u.book.model.vo.Grade;
import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.cs.model.vo.Cancel;
import com.bookforyou.bk4u.cs.model.vo.Refund;
import com.bookforyou.bk4u.cs.model.vo.Return;
import com.bookforyou.bk4u.group.model.vo.GroupBoard;
import com.bookforyou.bk4u.meetboard.model.vo.MeetBoard;
import com.bookforyou.bk4u.member.model.vo.Member;
import com.bookforyou.bk4u.member.model.vo.MemberCategory;
import com.bookforyou.bk4u.member.model.vo.MemberInterest;
import com.bookforyou.bk4u.mypage.model.vo.MyList;
import com.bookforyou.bk4u.order.model.vo.Order;
import com.bookforyou.bk4u.order.model.vo.OrderDetail;
import com.bookforyou.bk4u.payment.model.vo.Payment;
import com.bookforyou.bk4u.point.model.vo.Point;

@Repository
public class MypageDao {

	public int deleteAllMemInterest(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.delete("memberMapper.deleteAllMemInterest",member);
	}

	public int deleteAllMemCategory(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.delete("memberMapper.deleteAllMemCategory",member);
	}

	public ArrayList<MemberInterest> selectMemberInterestList(SqlSessionTemplate sqlSession, int memNo) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectMemberInterestList", memNo);
	}

	public ArrayList<MemberCategory> selectSubCategoryList(SqlSessionTemplate sqlSession, int memNo) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectSubCategoryList",memNo);
	}

	public int updateProfileImg(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.update("memberMapper.updateProfileImg",member);
	}

	public int updateMemPassword(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.update("memberMapper.updateMemberPassword",member);
	}

	public int updateMemberNickname(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.update("memberMapper.updateMemberNickname",member);
	}

	public int updateMemberEmail(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.update("memberMapper.updateMemberEmail",member);
	}

	public int updateMemberDetail(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.update("memberMapper.updateMemberDetail",member);
	}

	public int updateMemberStatusDisable(SqlSessionTemplate sqlSession, Member member) {
		// TODO Auto-generated method stub
		return sqlSession.update("memberMapper.updateMemberStatusDisable",member);
	}

	public int selectMyListCount(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.selectOne("bookMapper.selectMyListCount",member);
	}

	public ArrayList<Book> selectMyList(SqlSessionTemplate sqlSession, HashMap<String, Object> listParam) {
		PageInfo pi = (PageInfo) listParam.get("pi");
		Member member = (Member) listParam.get("member");
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("bookMapper.selectMyList",member, rowBounds);
	}

	public int deleteMyList(SqlSessionTemplate sqlSession, MyList list) {
		return sqlSession.delete("bookMapper.deleteMyList",list);
	}

	public int selectMyOrderListCount(SqlSessionTemplate sqlSession, HashMap<String, Object> listParam) {
		return sqlSession.selectOne("orderMapper.selectMyOrderListCount",listParam);
	}

	public ArrayList<Order> selectMyOrderList(SqlSessionTemplate sqlSession, HashMap<String, Object> listParam,
			PageInfo pi) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("orderMapper.selectMyOrderList",listParam,rowBounds);
	}

	public int selectMyReadingGroupListCount(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.selectOne("groupMapper.selectMyReadingGroupListCount",member);
	}

	public ArrayList<GroupBoard> selectMyReadingGroupList(SqlSessionTemplate sqlSession, PageInfo pi, int memNo) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("groupMapper.selectMyReadingGroupList",memNo,rowBounds);
	}

	public int selectMyReadingGroupMemberCount(SqlSessionTemplate sqlSession, int groupBoardNo) {
		return sqlSession.selectOne("groupMapper.selectMyReadingGroupMemberCount",groupBoardNo);
	}

	public ArrayList<OrderDetail> selectMyOrderDetailList(SqlSessionTemplate sqlSession, int orderNo) {
		return (ArrayList)sqlSession.selectList("orderMapper.selectMyOrderDetailList",orderNo);
	}

	public int selectMyOrderDetailQuantity(SqlSessionTemplate sqlSession, int orderNo) {
		return sqlSession.selectOne("orderMapper.selectMyOrderDeatilQuantity",orderNo);
	}

	public Order selectMyOrder(SqlSessionTemplate sqlSession, int orderNo) {
		return sqlSession.selectOne("orderMapper.selectOrder",orderNo);
	}

	public Payment selectOrderedPayment(SqlSessionTemplate sqlSession, int orderNo) {
		return sqlSession.selectOne("paymentMapper.selectOrderedPayment",orderNo);
	}

	public int insertMyOrderCancel(SqlSessionTemplate sqlSession, Cancel cancelData) {
		return sqlSession.insert("csMapper.insertMyOrderCancel",cancelData);
	}

	public int updateMyOrderDelivered(SqlSessionTemplate sqlSession, int orderNo) {
		return sqlSession.update("orderMapper.updateMyOrderDelivered",orderNo);
	}

	public int updateMyOrderDetailDelivered(SqlSessionTemplate sqlSession, int orderNo) {
		return sqlSession.update("orderMapper.updateMyOrderDetailDelivered",orderNo);
	}

	public int insertOrderPoint(SqlSessionTemplate sqlSession, Point point) {
		return sqlSession.insert("pointMapper.insertMyPoint",point);
	}

	public int insertMyOrderReturn(SqlSessionTemplate sqlSession, Return rt) {
		return sqlSession.insert("csMapper.insertMyOrderReturn",rt);
	}

	public int selectMyReturnCount(SqlSessionTemplate sqlSession, Return rt) {
		return sqlSession.selectOne("csMapper.selectMyReturnCount",rt);
	}

	public int selectMyCancelCount(SqlSessionTemplate sqlSession, Cancel cancelData) {
		return sqlSession.selectOne("csMapper.selectMyCancelCount",cancelData);
	}

	public int insertMyBookGrade(SqlSessionTemplate sqlSession, Grade grade) {
		return sqlSession.insert("bookMapper.insertMyBookGrade",grade);
	}

	public Refund selectMyRefund(SqlSessionTemplate sqlSession, int orderNo) {
		return sqlSession.selectOne("csMapper.selectMyRefund",orderNo);
	}





}
