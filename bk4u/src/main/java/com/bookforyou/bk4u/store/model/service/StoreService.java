package com.bookforyou.bk4u.store.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.store.model.vo.OffBook;
import com.bookforyou.bk4u.store.model.vo.Store;
import com.bookforyou.bk4u.store.model.vo.StoreBook;

public interface StoreService {

	/*
	 * [공통] 오프라인 매장 메인 조회 (연지)
	 */
	Store selectStoreDetail(int storeNo);

	/*
	 * [공통] 오프라인 매장 도서 조회 (연지)
	 */
	ArrayList<OffBook> selectStoreOffBookList(int storeNo);

	/*
	 * [공통] 오프라인 매장 최근 추가 도서 조회 (연지)
	 */
	ArrayList<OffBook> selectStoreOffBookListRecent(int storeNo);
	
	/*
	 * [공통] 오프라인 매장 도서 상세 조회 (연지)
	 */
	OffBook selectOffBook(HashMap<String, Integer> map);

	/*
	 * [공통] 도서 보유 오프라인 매장 리스트 조회 (연지)
	 */
	ArrayList<Store> selectOffBookStoreList(int bkNo);

	/*
	 * [공통] 오프라인 도서 검색 개수ㄴ 조회 (연지)
	 */
	int selectSearchOffBookCount(HashMap<String, String> map);

	/*
	 * [공통] 오프라인 도서 검색 결과 조회 (연지)
	 */
	ArrayList<OffBook> selectSearchOffBook(PageInfo pi, HashMap<String, String> map);
	
	//관리자(김현솔)
	
	 int selectListCount();
	 
	 int selectBookListCount(int storeNo);
	 
	 ArrayList<Store> selectStoreList(PageInfo pi);
	 
	 ArrayList<StoreBook> selectStoreBookList(PageInfo pi,int storeNo);
	 
	 int addStore(Store st);
	 
	 int updateStore(Store st);
	 
	 int deleteStore(int storeNo);
}
