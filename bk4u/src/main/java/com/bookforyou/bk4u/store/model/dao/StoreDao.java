package com.bookforyou.bk4u.store.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

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

	/*
	 * [공통] 오프라인 매장 최근 추가 도서 조회 (연지)
	 */
	public ArrayList<OffBook> selectStoreOffBookListRecent(SqlSessionTemplate sqlSession, int storeNo) {
		return (ArrayList)sqlSession.selectList("storeMapper.selectStoreOffBookListRecent", storeNo);
	}
	
	/*
	 * [공통] 오프라인 매장 도서 상세 조회 (연지)
	 */
	public OffBook selectOffBook(SqlSessionTemplate sqlSession, HashMap<String, Integer> map) {
		return sqlSession.selectOne("storeMapper.selectOffBook", map);
	}

	/*
	 * [공통] 도서 보유 오프라인 매장 리스트 조회 (연지)
	 */
	public ArrayList<Store> selectOffBookStoreList(SqlSessionTemplate sqlSession, int bkNo) {
		return (ArrayList)sqlSession.selectList("storeMapper.selectOffBookStoreList", bkNo);
	}

}
