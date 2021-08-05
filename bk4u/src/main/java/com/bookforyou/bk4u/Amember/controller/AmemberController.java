package com.bookforyou.bk4u.Amember.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bookforyou.bk4u.Amember.model.service.AmemService;
import com.bookforyou.bk4u.Amember.model.vo.Amem;
import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.common.template.Pagination;
import com.bookforyou.bk4u.member.model.vo.Member;


// 관리자 메인
@Controller
public class AmemberController {
	
	@Autowired
	private AmemService amService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

// 관리자 메인
	@RequestMapping("amain.me")
	public String amain() {
		return "adminMain";
	}
	
// 관리자 회원조회	
	@RequestMapping("amemSearch.me")
	public String amemSearch(Model model, @RequestParam(value="currentPage", defaultValue="1") int currentPage) {
		
		//System.out.println(currentPage);
		
		int amemCount = amService.selectAmemListCount();
		
		PageInfo pi = Pagination.getPageInfo(amemCount, currentPage, 10, 5);
		ArrayList<Amem> list = amService.selectList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		System.out.println(amemCount);
		
		return "Amember/memberSearch";
	}
	
	//회원 검색
	@RequestMapping("amSearch.me")
	public ModelAndView selectAmemSearchList(ModelAndView mv, @RequestParam(value="currentPage", defaultValue="1") int currentPage,
										 String condition, String keyword) {
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		int amemCount = amService.selectAmemSearchListCount(map);
		
		PageInfo pi = Pagination.getPageInfo(amemCount, currentPage, 10, 5);
		ArrayList<Amem> list = amService.selectAmemSearchList(pi, map);
		
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
	
// 블랙리스트
	@RequestMapping("blackList.me")
	public String blackList() {
		return "Amember/blacklist";
	}
}