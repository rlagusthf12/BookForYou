package com.bookforyou.bk4u.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bookforyou.bk4u.member.model.service.MemberService;
import com.bookforyou.bk4u.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	
	@RequestMapping("loginForm.me")
	public String enrollFrom() {
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
			return "main";
		}
		
	}
	
	
}
