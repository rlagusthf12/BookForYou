package com.bookforyou.bk4u.Amember.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

// 관리자 메인
@Controller
public class AmemberController {

// 관리자 메인
	@RequestMapping("amain.me")
	public String amain() {
		return "adminMain";
	}
	
// 관리자 회원조회	
	@RequestMapping("amemSearch.me")
	public String amemSearch() {
		return "Amember/memberSearch";
	}
	
// 관리자 회원탈퇴
	@RequestMapping("amemDelete.me")
	public String amemDelete() {
		return "Amember/amemberDelete";
	}
	
// 블랙리스트
	@RequestMapping("blackList.me")
	public String blackList() {
		return "Amember/blacklist";
	}
}