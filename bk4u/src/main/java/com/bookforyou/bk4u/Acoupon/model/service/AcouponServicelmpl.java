package com.bookforyou.bk4u.Acoupon.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookforyou.bk4u.Acoupon.model.dao.AcouponDao;
import com.bookforyou.bk4u.Acoupon.model.vo.Acoupon;
import com.bookforyou.bk4u.Amember.model.vo.Amem;
import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.member.model.vo.Coupon;

@Service
public class AcouponServicelmpl implements AcouponService{
	
	@Autowired
	private AcouponDao acDao;
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertAcoupon(Acoupon c) {
		return acDao.insertAcoupon(sqlSession, c);
	}

	@Override
	public int selectAcouponListCount() {
		return acDao.selectAcouponList(sqlSession);
	}

	@Override
	public ArrayList<Acoupon> selectList(PageInfo pi) {
		return acDao.selectAcouponList(sqlSession, pi);
	}

	//쿠폰 삭제
	@Override
	public int deleteCoupon(String cno) {
		return acDao.deleteCoupon(sqlSession, cno);
	}

	
	



	
	
}
