package com.bookforyou.bk4u.Acoupon.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.bookforyou.bk4u.Acoupon.model.vo.Acoupon;
import com.bookforyou.bk4u.Amember.model.vo.Amem;
import com.bookforyou.bk4u.common.model.vo.PageInfo;

public interface AcouponService {
	
	//쿠폰조회
	int selectAcouponListCount();
	ArrayList<Acoupon> selectList(PageInfo pi);
	
	// 쿠폰등록
	int insertAcoupon(Acoupon c) ;

	
	
}
	

