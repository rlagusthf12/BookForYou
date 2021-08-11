package com.bookforyou.bk4u.Acoupon.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bookforyou.bk4u.Acoupon.model.service.AcouponService;
import com.bookforyou.bk4u.Acoupon.model.vo.Acoupon;

import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.common.template.Pagination;

@Controller
public class AcouponController {

	@Autowired
	private AcouponService acService;
	
	@RequestMapping("coupon.me")
	public String Acoupon() {
		return "Acoupon/acoupon";
	}
	
	@RequestMapping("incoupon.me")
	public String insertAcoupon(Acoupon c, HttpSession session, Model model) {
		
		int result = acService.insertAcoupon(c);
		
		if(result > 0) { //성공
			session.setAttribute("alertMsg", "쿠폰이 생성되었습니다.");
			return "redirect:couponList.me";
		}else { // 실패 
			model.addAttribute("errorMsg", "게시글 등록 실패");
			return "common/errorPage";
		}
	}
	
	
	
	

}	
	
