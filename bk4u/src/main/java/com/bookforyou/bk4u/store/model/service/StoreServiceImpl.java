package com.bookforyou.bk4u.store.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookforyou.bk4u.store.model.dao.StoreDao;
import com.bookforyou.bk4u.store.model.vo.OffBook;
import com.bookforyou.bk4u.store.model.vo.Store;

@Service
public class StoreServiceImpl implements StoreService {
	
	@Autowired
	private StoreDao storeDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/*
	 * [공통] 오프라인 매장 메인 조회 (연지)
	 */
	@Override
	public Store selectStoreDetail(int storeNo) {
		return storeDao.selectStoreDetail(sqlSession, storeNo);
	}

	/*
	 * [공통] 오프라인 매장 도서 조회 (연지)
	 */
	@Override
	public ArrayList<OffBook> selectStoreOffBookList(int storeNo){
		return storeDao.selectStoreOffBookList(sqlSession, storeNo);
	}

}
