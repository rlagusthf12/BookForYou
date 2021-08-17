package com.bookforyou.bk4u.payment.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.bookforyou.bk4u.payment.model.vo.Payment;

@Service
public interface PaymentService {
	
	int insertSubsc(Payment paySub);
	
	ArrayList<Payment> selectPayList();

	/*
	 * [사용자] 결제 정보 입력 (연지)
	 */
	int insertOrderPaymentInfo(int price);

}
