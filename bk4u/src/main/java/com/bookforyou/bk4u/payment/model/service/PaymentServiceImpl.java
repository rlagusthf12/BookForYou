package com.bookforyou.bk4u.payment.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookforyou.bk4u.book.model.vo.Book;
import com.bookforyou.bk4u.payment.model.dao.PaymentDao;
import com.bookforyou.bk4u.payment.model.vo.Payment;

@Service
public class PaymentServiceImpl implements PaymentService{
	
	@Autowired
    private PaymentDao pDao;
    @Autowired
    private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertSubsc(Payment paySub) {
		return pDao.insertSubsc(sqlSession, paySub);
	}

	@Override
	public ArrayList<Payment> selectPayList() {
		return pDao.selectPayList(sqlSession);
	}

	/*
	 * [사용자] 결제 정보 입력 (연지)
	 */
	@Override
	public int insertOrderPaymentInfo(int price) {
		return pDao.insertOrderPaymentInfo(sqlSession, price);
	}

}
