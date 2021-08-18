package com.bookforyou.bk4u.Amember.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bookforyou.bk4u.Amember.model.service.AmemService;
import com.bookforyou.bk4u.Amember.model.vo.Amem;
import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.common.template.Pagination;
import com.bookforyou.bk4u.couponDetail.model.vo.CouponDetail;
import com.bookforyou.bk4u.member.model.vo.Member;
import com.bookforyou.bk4u.order.model.vo.Order;
import com.bookforyou.bk4u.order.model.vo.OrderDetail;
import com.bookforyou.bk4u.payment.model.vo.Payment;
import com.google.gson.Gson;



// 관리자 메인
@Controller
public class AmemberController {
	
	@Autowired
	private AmemService amService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
// 메인
	@RequestMapping("main.me")
	public String main() {
		return "main";
	}

// 관리자 메인
	@RequestMapping("amain.me")
	public String amain() {
		return "adminMain";
	}
	
// 관리자 회원조회	
	@RequestMapping("amemSearch.me")
	public ModelAndView selectList(ModelAndView mv, @RequestParam(value="currentPage", defaultValue="1") int currentPage) {
		
		//System.out.println(currentPage);
		int listCount = amService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Member> list = amService.selectList(pi);
		
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .setViewName("Amember/memberSearch");
		
		return mv;
		
	}
	
	// 회원 상세조회
		
	@ResponseBody
	@RequestMapping("amDetail.me")
	public String selectAmemDetail(int memNo) {
		
		Member m = amService.selectAmemDetail(memNo);
		
		JSONObject jObj = new JSONObject();
		jObj.put("memId", m.getMemId());
		jObj.put("memName", m.getMemName());
		jObj.put("memAge", m.getMemId());
		jObj.put("memBasicAddress", m.getMemBasicAddress());
		jObj.put("memDetailAddress", m.getMemDetailAddress());
		jObj.put("memEmail", m.getMemEmail());
		jObj.put("memPhone", m.getMemPhone());
		jObj.put("memStatus", m.getMemStatus());
		jObj.put("memEnrolldate", m.getMemEnrolldate());
		
		
		
		
		return jObj.toString();
		
	}
			
	//회원 검색
	@RequestMapping("amSearch.me")
	public ModelAndView selectSearchList(ModelAndView mv, @RequestParam(value="currentPage", defaultValue="1") int currentPage,
										 String condition, String keyword) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		int listCount = amService.selectSearchListCount(map);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Member> list = amService.selectSearchAmemList(pi, map);
		
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .addObject("condition", condition)
		  .addObject("keyword", keyword)
		  .setViewName("Amember/memberSearch");
		
		return mv;
		
	}
	
// 관리자 회원탈퇴
	@RequestMapping("amDelete.me")
	public String amDelete(String memPwd, String memId, HttpSession session, Model model) {
		
		
		String encPwd = ((Member)session.getAttribute("loginUser")).getMemPwd();
		if(bcryptPasswordEncoder.matches(memPwd, encPwd)) { // 비번맞음 => 탈퇴처리
			int result = amService.amDelete(memId);
			
			if(result > 0) { // 성공
				session.removeAttribute("loginUser");
				session.setAttribute("alertMsg", "회원탈퇴되었습니다. 그동안 이용해주셔서 감사합니다.");
				return "redirect:/";
				
			}else { // 실패
				model.addAttribute("errorMsg", "회원탈퇴 실패");
				return "common/errorPage";
				
			}
			
		}else { // 비번틀림 => 비밀번호가 틀림을 알리고 마이페이지 보여지게
			session.setAttribute("alertMsg", "비밀번호가 틀렸습니다 다시입력해주세요.");
			return "redirect:amSearch.me";
		}
	}
	
	// 블랙리스트 추가
	@RequestMapping("black.me")
	public String memberBlack(int mno, Model model, HttpSession session) {
		
		int result = amService.blackMember(mno); // service, dao, sql문
	
		if(result > 0) { // 성공 => 리스트페이지
		
					session.setAttribute("alertMsg", "블랙리스트 등록 성공.");
					return "redirect:blackList.me";
					
				}else { // 실패
					model.addAttribute("errorMsg", "블랙리스트 삭제 실패");
					return "common/errorPage";
				}
		
	}
	
	//블랙리스트 조회
	@RequestMapping("blackList.me")
	public ModelAndView selectBlackList(ModelAndView mv, @RequestParam(value="currentPage", defaultValue="1") int currentPage) {
		
		//System.out.println(currentPage);
		int listCount = amService.selectBlackListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Member> blist = amService.selectBlackList(pi);
		
		
		mv.addObject("pi", pi)
		  .addObject("blist", blist)
		  .setViewName("Amember/blacklist");
		//System.out.println(blist);
		return mv;
		
	}
	// 블랙리스트 검색
	@RequestMapping("blackSearch.me")
	public ModelAndView selectBlackSearchList(ModelAndView mv, @RequestParam(value="currentPage", defaultValue="1") int currentPage,
										 String condition, String keyword) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		int listCount = amService.selectBlackSearchListCount(map);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Member> blist = amService.selectBlackSearchList(pi, map);
		
		
		mv.addObject("pi", pi)
		  .addObject("blist", blist)
		  .addObject("condition", condition)
		  .addObject("keyword", keyword)
		  .setViewName("Amember/blacklist");
		
		return mv;
		
	}
	// 블랙리스트 삭제
	@RequestMapping("blackDelete.me")
	public String DeleteBlack(int mno, String filePath, Model model, HttpSession session) {
		
		int result = amService.deleteBlack(mno); // service, dao, sql문
	
		if(result > 0) { // 성공 => 리스트페이지
		
					session.setAttribute("alertMsg", "블랙리스트에서 삭제되었습니다.");
					return "redirect:blackList.me";
					
				}else { // 실패
					model.addAttribute("errorMsg", "블랙리스트 삭제 실패");
					return "common/errorPage";
				}
		
	}
	
}