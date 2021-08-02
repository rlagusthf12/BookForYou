package com.bookforyou.bk4u.Acoupon.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AcouponController {

	@RequestMapping("coupon.me")
	public String coupon() {
		return "Acoupon/acoupon";
	}
	
	@RequestMapping("couponList.me")
	public String couponlist() {
		return "Acoupon/couponList";
	}
	
}
