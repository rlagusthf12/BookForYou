package com.bookforyou.bk4u.payment.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bookforyou.bk4u.payment.model.vo.Payment;
import com.google.gson.Gson;
import com.bookforyou.bk4u.payment.model.service.PaymentService;

@Controller
public class PaymentController {
	
	@Autowired
	private PaymentService pService;
	
	@ResponseBody
	@RequestMapping("insertSubsc.pay")
	public String insertSubsc(Payment paySub) {
		int result = pService.insertSubsc(paySub);
		if(result>0) {
			return "success";
		}else{
			return "fail";
		}
	}
	
	@ResponseBody
    @RequestMapping(value = "payNo.pay", produces="application/json; charset=utf-8")
    public String selectPayList() {
        ArrayList<Payment> list = pService.selectPayList();
        return new Gson().toJson(list);
    }

	/*
	 * [사용자] 결제 정보 입력 (연지)
	 */
	@ResponseBody
	@RequestMapping(value="orderBook.pay", produces="text/html; charset=utf-8")
	public String updateCartQty(int price) {

		int result = pService.insertOrderPaymentInfo(price);
		
		return result> 0 ? "success" : "fail";
	}
	
}
