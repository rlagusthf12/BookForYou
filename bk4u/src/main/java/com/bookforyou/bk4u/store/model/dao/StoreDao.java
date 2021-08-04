package com.bookforyou.bk4u.store.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bookforyou.bk4u.store.model.vo.OffBook;
import com.bookforyou.bk4u.store.model.vo.Store;

@Repository
public class StoreDao {

	/*
	 * [공통] 오프라인 매장 상세 조회 (연지)
	 */
	public Store selectStoreDetail(SqlSessionTemplate sqlSession, int storeNo) {
		return sqlSession.selectOne("storeMapper.selectStoreDetail", storeNo);
	}

	/*
	 * [공통] 오프라인 매장 도서 조회 (연지)
	 */
	public ArrayList<OffBook> selectStoreOffBookList(SqlSessionTemplate sqlSession, int storeNo) {
		return (ArrayList)sqlSession.selectList("storeMapper.selectStoreOffBookList", storeNo);
	}

}
