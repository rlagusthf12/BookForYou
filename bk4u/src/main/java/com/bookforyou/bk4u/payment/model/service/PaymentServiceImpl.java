package com.bookforyou.bk4u.payment.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
