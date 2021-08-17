package com.bookforyou.bk4u.Acoupon.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bookforyou.bk4u.Acoupon.model.service.AcouponService;
import com.bookforyou.bk4u.Acoupon.model.vo.Acoupon;
import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.common.template.Pagination;
import com.bookforyou.bk4u.member.model.vo.Coupon;
import com.bookforyou.bk4u.member.model.vo.Member;


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
	
	@RequestMapping("couponList.me")
	public String AcouponList(Model model, @RequestParam(value="currentPage", defaultValue="1") int currentPage) {
		
		//System.out.println(currentPage);
		
		int acouponCount = acService.selectAcouponListCount();
		
		PageInfo pi = Pagination.getPageInfo(acouponCount, currentPage, 10, 5);
		ArrayList<Acoupon> list = acService.selectList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		System.out.println(acouponCount);
		
		return "Acoupon/couponList";
	}
	/*
	
	//쿠폰삭제 (형우)
	@RequestMapping("couponDelete.me")
	public String couponDelete(ModelAndView mv, String cno) {
					
			int result = acService.deleteCoupon(cno);
		
		for(String cn : cNoArr) {		
			int CouponDelete = acService.deleteCoupon(cn); 
		}
		
		mv.addObject("alertMsg", "도서가 삭제되었습니다.");
		
		return "redirect:/CouponList.me";
	}*/
		return "redirect:/couponList.me";
	}
}
	
