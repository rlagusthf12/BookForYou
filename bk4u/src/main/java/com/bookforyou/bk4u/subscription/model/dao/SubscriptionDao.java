package com.bookforyou.bk4u.subscription.model.dao;

import java.util.ArrayList;

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

	public ArrayList<Subscription> selectAdminSubscList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("subscriptionMapper.selectAdminSubscList", null, rowBounds);
	}

}
