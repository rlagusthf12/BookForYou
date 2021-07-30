package com.bookforyou.bk4u.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bookforyou.bk4u.member.model.service.MemberService;
import com.bookforyou.bk4u.member.model.vo.Member;

@Controller
public class MemberController {
	// Author : 안세아
	@Autowired
	private MemberService memberService;
	
	
	@RequestMapping("login-form.me")
	public String loginForm() {
		return "member/login";
	}
	
	
	/**
	 * 암호화 적용 안한 버전의 메서드로, 회원가입 기능 완성하고 암호화 기능 추가하는 로그인 메서드를 하나 더 만들 예정입니다.
	 */
	@RequestMapping("login.me")
	public String loginMember(Member member,Model model,HttpSession session) {
		Member loginUser = memberService.loginMember(member);
		
		if(loginUser == null) {
			model.addAttribute("alertMsg", "일치하지 않는 회원정보입니다.");
			System.out.println("로그인 실패" + loginUser);
			return "member/login";
		}else {
			session.setAttribute("loginUser", loginUser);
			// main페이지 업로딩 되면 여기만 수정
			System.out.println("로그인 성공" + loginUser);
			return "redirect:/";
		}
		
	}
	
	/**
	 * logout메서드
	 */
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("enroll-form.me")
	public String enrollForm() {
		
		return "member/signup";
	}
	
	@ResponseBody
	@RequestMapping("id-check.me")
	public String ajaxIdCheck(String checkId){
		int count = memberService.idCheck(checkId);
		System.out.println(count);
		return count > 0 ? "NNNNN" : "NNNNY";
	}
	
	@ResponseBody
	@RequestMapping("nick-check.me")
	public String ajaxNickCheck(String checkNick) {
		int count = memberService.nickCheck(checkNick);
		System.out.println(count);
		return count > 0 ? "NNNNN" : "NNNNY";
	}
	
	@ResponseBody
	@RequestMapping("email-check.me")
	public String emailCheck(String checkEmail) {
		int count = memberService.emailCheck(checkEmail);
		return count > 0 ? "NNNNN" : "NNNNY";
	}
	
	/**
	 * 
	 */
	@RequestMapping("second-enroll.me")
	public String firstEnroll(Member member, Model model) {
		model.addAttribute("memId", member.getMemId());
		model.addAttribute("memPwd", member.getMemPwd());
		model.addAttribute("memName",member.getMemName());
		model.addAttribute("memPost", member.getMemPost());
		model.addAttribute("memBasicAddress",member.getMemBasicAddress());
		model.addAttribute("memDetailAddress",member.getMemDetailAddress());
		model.addAttribute("memAddressRefer",member.getMemAddressRefer());
		model.addAttribute("memGender",member.getMemGender());
		model.addAttribute("memAge",member.getMemAge());
		model.addAttribute("memPhone",member.getMemPhone());
		model.addAttribute("memEmail",member.getMemEmail());
		model.addAttribute("memNickname",member.getMemNickname());
		
		return "member/signup-recommend";
	}
}
