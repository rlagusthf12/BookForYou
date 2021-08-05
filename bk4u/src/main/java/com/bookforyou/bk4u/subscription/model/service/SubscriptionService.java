package com.bookforyou.bk4u.subscription.model.service;

import java.util.ArrayList;

import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.subscription.model.vo.Subscription;

public interface SubscriptionService {

	
	/**
	 * [관리자] 정기구독 목록 개수 조회 (한진)
	 */
	int selectAllListCount();

	/**
	 * [관리자] 정기구독 목록 조회 (한진)
	 */
	ArrayList<Subscription> selectAdminSubscList(PageInfo pi);

}
