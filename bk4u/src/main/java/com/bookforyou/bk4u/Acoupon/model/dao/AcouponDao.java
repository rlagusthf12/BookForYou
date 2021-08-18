package com.bookforyou.bk4u.Acoupon.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bookforyou.bk4u.Acoupon.model.vo.Acoupon;
import com.bookforyou.bk4u.Amember.model.vo.Amem;
import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.member.model.vo.Coupon;

@Repository
public class AcouponDao {

	//쿠폰등록
	public int insertAcoupon(SqlSessionTemplate sqlSession, Acoupon c) {
		return sqlSession.insert("couponDetailMapper.insertAcoupon", c);
	}
	
	// 쿠폰조회
	
	public int selectAcouponList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("couponDetailMapper.selectAcoupon");
	}
	
	public ArrayList<Acoupon> selectAcouponList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("couponDetailMapper.selectAcouponList", null, rowBounds);
	}
	//쿠폰삭제
	public int deleteCoupon(SqlSessionTemplate sqlSession, String cno) {
		return sqlSession.delete("couponDetailMapper.deleteCoupon", cno);
	}
}