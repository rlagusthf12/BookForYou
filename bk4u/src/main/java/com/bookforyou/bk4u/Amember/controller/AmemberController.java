package com.bookforyou.bk4u.Amember.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bookforyou.bk4u.Amember.model.service.AmemService;
import com.bookforyou.bk4u.Amember.model.vo.Amem;
import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.common.template.Pagination;


// 관리자 메인
@Controller
public class AmemberController {
	
	@Autowired
	private AmemService amService;

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