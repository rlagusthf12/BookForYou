package com.bookforyou.bk4u.payment.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bookforyou.bk4u.payment.model.vo.Payment;

@Repository
public class PaymentDao {
	
	public int insertSubsc(SqlSessionTemplate sqlSession, Payment paySub) {
		return sqlSession.insert("paymentMapper.insertSubsc", paySub);
	}
	
	public ArrayList<Payment> selectPayList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("paymentMapper.selectPayList");
	}

}
