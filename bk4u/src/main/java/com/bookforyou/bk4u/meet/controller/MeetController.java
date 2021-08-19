package com.bookforyou.bk4u.meet.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bookforyou.bk4u.group.model.service.GroupService;
import com.bookforyou.bk4u.group.model.vo.GroupBoard;
import com.bookforyou.bk4u.group.model.vo.GroupMember;
import com.bookforyou.bk4u.meet.model.service.MeetService;
import com.bookforyou.bk4u.meet.model.vo.Meet;

@Controller
public class MeetController {
	
	@Autowired
	private MeetService mService;

	
	
	@RequestMapping(value="meet.bo",  method=RequestMethod.GET)
	public String meetList(int gno, Model model, Meet m, GroupBoard g) throws Exception {
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

		ArrayList<Meet> meetList = mService.meetList();
		ArrayList<Meet> meetLastList = mService.meetLastList();

		model.addAttribute("meetList", meetList);
		model.addAttribute("meetLastList", meetLastList);
		model.addAttribute("meet", "../meet/meetList.jsp");
		
				
		return "../views/meet/meetList";
	}
	
	/*
	@RequestMapping("meet.bo")
	public ModelAndView meetList( int gno, ModelAndView mv) {
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

		int result = gService.increaseCount(gno);
		
		if(result > 0 ) {
			GroupBoard g = gService.selectGroup(gno);
			
			// 현재 이 그룹에 속한 회원 리스트 조회
			ArrayList<GroupMember> list = gService.groupMemberList(gno);
			ArrayList<Meet> meetList = mService.meetList();
			ArrayList<Meet> meetLastList = mService.meetLastList();

			
			mv.addObject("meetLastList", meetLastList).addObject("meetList", meetList).addObject("groupMemberList", list).addObject("g", g).setViewName("meet/meetList");
		
			
		}else { 
			mv.addObject("errorMsg", "상세조회 실패").setViewName("common/errorPage");
			
		}
		
		return mv;
		
		
	}
	*/
	
	@RequestMapping("createMeet.bo")
	public String createMeet() {
		return"meet/meetCreate";	
	}

	@RequestMapping("insertMeet.bo")
	public String insertMeet(int gno, Meet m ,GroupBoard g, HttpSession session, Model model) {
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
				int result = mService.insertMeet(m);
				
				ArrayList<GroupBoard> groupList = gService.selectList();

				model.addAttribute("groupList", groupList);

				
			
					if(result > 0) {
						session.setAttribute("alertMsg", "독서모임 등록");
						return "redirect:meetList.jsp";
					}else {
						model.addAttribute("errorMsg", "게시글 작성실패");
						return "common/errorPage";
						
					}
				
	}
				
	
	
	
}
