package com.bookforyou.bk4u.store.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.store.model.dao.StoreDao;
import com.bookforyou.bk4u.store.model.vo.OffBook;
import com.bookforyou.bk4u.store.model.vo.Store;
import com.bookforyou.bk4u.store.model.vo.StoreBook;

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

	/*
	 * [공통] 오프라인 매장 최근 추가 도서 조회 (연지)
	 */
	@Override
	public ArrayList<OffBook> selectStoreOffBookListRecent(int storeNo){
		return storeDao.selectStoreOffBookListRecent(sqlSession, storeNo);
	}
	
	/*
	 * [공통] 오프라인 매장 도서 상세 조회 (연지)
	 */
	@Override
	public OffBook selectOffBook(HashMap<String, Integer> map){
		return storeDao.selectOffBook(sqlSession, map);
	}

	/*
	 * [공통] 도서 보유 오프라인 매장 리스트 조회 (연지)
	 */
	@Override
	public ArrayList<Store> selectOffBookStoreList(int bkNo){
		return storeDao.selectOffBookStoreList(sqlSession, bkNo);
	}

	/*
	 * [공통] 오프라인 도서 검색 개수ㄴ 조회 (연지)
	 */
	@Override
	public int selectSearchOffBookCount(HashMap<String, String> map) {
		return storeDao.selectSearchOffBookCount(sqlSession, map);
	}

	/*
	 * [공통] 오프라인 도서 검색 결과 조회 (연지)
	 */
	@Override
	public ArrayList<OffBook> selectSearchOffBook(PageInfo pi, HashMap<String, String> map){
		return storeDao.selectSearchOffBook(sqlSession, pi, map);
	}
	
	//관리자 (김현솔)
	@Override
	public  int selectListCount() {
		return storeDao.selectListCount(sqlSession);
	}
	
	@Override
	public int selectSearchListCount(HashMap<String,String> map) {
		return storeDao.selectSearchListCount(sqlSession,map);
	}
	
	@Override
	 public int selectBookListCount(int storeNo) {
		return storeDao.selectBookListCount(sqlSession,storeNo);
	}
	
	@Override
	 public ArrayList<Store> selectStoreList(PageInfo pi){
		return storeDao.selectStoreList(sqlSession,pi);
	}
	
	@Override
	 public ArrayList<Store> selectSearchStoreList(PageInfo pi,HashMap<String,String> map){
		return storeDao.selectSearchStoreList(sqlSession,pi,map);
	}
	
	@Override
	 public ArrayList<StoreBook> selectStoreBookList(PageInfo pi,int storeNo){
		return storeDao.selectStoreBookList(sqlSession,pi,storeNo);
	}
	
	@Override
	public int addStore(Store st) {
		return storeDao.addStore(sqlSession,st);
	}
	
	@Override
	public int updateStore(Store st) {
		return storeDao.updateStore(sqlSession,st);
	}
	
	@Override
	public int deleteStore(int storeNo) {
		return storeDao.deleteStore(sqlSession,storeNo);
	}
	

}
