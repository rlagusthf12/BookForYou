package com.bookforyou.bk4u.subscription.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.subscription.model.dao.SubscriptionDao;
import com.bookforyou.bk4u.subscription.model.vo.Subscription;

@Service
public class SubscriptionImpl implements SubscriptionService{

	@Autowired
	private SubscriptionDao sDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
	 * [관리자] 정기구독 목록 개수 조회 (한진)
	 */
	@Override
	public int selectAllListCount() {
		return sDao.selectAllListCount(sqlSession);
	}

	/**
	 * [관리자] 정기구독 목록 조회 (한진)
	 */
	@Override
	public ArrayList<Subscription> selectAdminSubscList(PageInfo pi) {
		return sDao.selectAdminSubscList(sqlSession, pi);
	}
	
	
}
