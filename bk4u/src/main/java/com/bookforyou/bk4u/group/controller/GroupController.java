package com.bookforyou.bk4u.group.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bookforyou.bk4u.group.model.service.GroupService;
import com.bookforyou.bk4u.group.model.vo.GroupBoard;
import com.bookforyou.bk4u.member.model.vo.Member;

@Controller
public class GroupController {

	@Autowired
	private GroupService gService;
	
	@RequestMapping("group.bo")
	public String selectList(Model model) {
		
		ArrayList<GroupBoard> groupList = gService.selectList();
		
		model.addAttribute("groupList", groupList);
		
		return "group/groupList";
		
	}
	
	@RequestMapping("gListMore.bo")
	public String selectListMore(Model model) {
		
		ArrayList<GroupBoard> groupListMore = gService.selectList();
		
		model.addAttribute("groupListMore", groupListMore);
		
		return "group/groupList";
		
	}
	
	@RequestMapping("createGroup.bo")
	public String createGroup() {
		return"group/groupCreate";	
	}
	
	@RequestMapping("insertGroup.bo")
	public String insertGroup() {
		return "redirect";
	}
	
	@RequestMapping("insertGMem.me")
	public void insertGMem (Member m ,Model model, HttpSession session) {
		
		int result = gService.insertGMem(m);
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "가입되었습니다.");
			return ;
			
		} 
	}
	
	
	
}
