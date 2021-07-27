package com.bookforyou.bk4u.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	
	@RequestMapping("loginForm.me")
	public String enrollFrom() {
		return "member/login";
	}
}
