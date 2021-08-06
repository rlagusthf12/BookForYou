package com.bookforyou.bk4u.subscription.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.subscription.model.vo.Subscription;

@Repository
public class SubscriptionDao {

	/**
	 * [관리자] 정기구독 목록 개수 조회 (한진)
	 */
	public int selectAllListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("subscriptionMapper.selectAllListCount");
	}

	/**
	 * [관리자] 정기구독 목록 조회 (한진)
	 */
	public ArrayList<Subscription> selectAdminSubscList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> filter) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("subscriptionMapper.selectAdminSubscList", filter, rowBounds);
	}

	/*
	 * [관리자] '베이직' 목록 개수 조회 (한진)
	 */
	public int selectBasicListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("subscriptionMapper.selectBasicListCount");
	}

	/*
	 * [관리자] '프리미엄' 목록 개수 조회 (한진)
	 */
	public int selectPremiumListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("subscriptionMapper.selectPremiumListCount");
	}

	/*
	 * [관리자] '구독중' 목록 개수 조회 (한진)
	 */
	public int selectStatusYListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("subscriptionMapper.selectStatusYListCount");
	}

	/*
	 * [관리자] '구독해지' 목록 개수 조회 (한진)
	 */
	public int selectStatusNListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("subscriptionMapper.selectStatusNListCount");
	}

	/**
	 * [관리자] 검색조건에 일치하는 목록 개수 조회 (한진)
	 */
	public int selectAdminSubscListSearchCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("subscriptionMapper.selectAdminSubscListSearchCount", map);
	}

	/**
	 * [관리자] 검색조건에 일치하는 목록 조회 (한진)
	 */
	public ArrayList<Subscription> selectAdminSubscSearchList(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return (ArrayList)sqlSession.selectList("subscriptionMapper.selectAdminSubscSearchList", map);
	}

}
