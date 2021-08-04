package com.bookforyou.bk4u.cs.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bookforyou.bk4u.common.model.vo.PageInfo;

@Repository
public class CsDao {

	/**
	 * [관리자] '주문취소' 목록 개수 조회 (한진)
	 */
	public int selectAdminCancelCount(SqlSessionTemplate sqlSession, HashMap<String, String> filter) {
		return sqlSession.selectOne("csMapper.selectAdminCancelCount", filter);
	}

	/**
	 * [관리자] '반품' 목록 개수 조회 (한진)
	 */
	public int selectAdminReturnCount(SqlSessionTemplate sqlSession, HashMap<String, String> filter) {
		return sqlSession.selectOne("csMapper.selectAdminReturnCount", filter);
	}

	/**
	 * [관리자] '환불' 목록 개수 조회 (한진)
	 */
	public int selectAdminRefundCount(SqlSessionTemplate sqlSession, HashMap<String, String> filter) {
		return sqlSession.selectOne("csMapper.selectAdminRefundCount", filter);
	}

	/**
	 * [관리자] '주문취소' 목록 조회 (한진)
	 */
	public ArrayList selectAdminCancelList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> filter) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("csMapper.selectAdminCancelList", filter, rowBounds);
	}

	/**
	 * [관리자] '반품' 목록 조회 (한진)
	 */
	public ArrayList selectAdminReturnList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> filter) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("csMapper.selectAdminReturnList", filter, rowBounds);
	}

	/**
	 * [관리자] '환불' 목록 조회 (한진)
	 */
	public ArrayList selectAdminRefundList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> filter) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("csMapper.selectAdminRefundList", filter, rowBounds);
	}

	

}
