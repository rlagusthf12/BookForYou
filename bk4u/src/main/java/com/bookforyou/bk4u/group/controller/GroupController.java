package com.bookforyou.bk4u.group.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bookforyou.bk4u.group.model.service.GroupService;
import com.bookforyou.bk4u.group.model.vo.GroupBoard;

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
	
	@RequestMapping("createGroup.bo")
	public String createGroup() {
		return"group/groupCreate";	
	}
	
	@RequestMapping("insertGroup.bo")
	public String insertGroup() {
		return "redirect";
	}
	
	@RequestMapping("insertMem.me")
	public String insertMem (GroupBoard g) {
		return"redirect";
	}
	
	
	
}
