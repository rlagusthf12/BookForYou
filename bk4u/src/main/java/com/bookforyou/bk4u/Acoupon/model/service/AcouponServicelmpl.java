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

	


	
	
}
