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

import com.bookforyou.bk4u.group.model.vo.GroupBoard;
import com.bookforyou.bk4u.meet.model.service.MeetService;
import com.bookforyou.bk4u.meet.model.vo.Meet;
import com.bookforyou.bk4u.meet.model.vo.MeetMember;
import com.bookforyou.bk4u.member.model.vo.Member;

@Controller
public class MeetController {
	
	@Autowired
	private MeetService mService;

	
	
	@RequestMapping(value="meet.bo",  method=RequestMethod.GET)
	public String meetList(int gno, Model model, Meet m, GroupBoard g, MeetMember ma) throws Exception {
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

		ArrayList<Meet> meetList = mService.meetList(gno);
		ArrayList<Meet> meetLastList = mService.meetLastList(gno);
		ArrayList<MeetMember> meetMemberList = mService.meetMemberList(gno);
		
		model.addAttribute("meetList", meetList);
		model.addAttribute("meetLastList", meetLastList);
		model.addAttribute("meetMemberList", meetMemberList);
		model.addAttribute("meet", "../meet/meetList.jsp");
		
				
		return "../views/meet/meetList";
	}
	
	/*
	@RequestMapping("meet.bo")
	public ModelAndView selectGroup( int gno, ModelAndView mv) {
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

		
			ArrayList<Meet> meetList = mService.meetList(gno);
			ArrayList<Meet> meetLastList = mService.meetLastList(gno);

			// 현재 이 그룹에 속한 회원 리스트 조회
			ArrayList<MeetMember> meetMemberlist = mService.meetMemberList(gno);
			
			mv.addObject("meetMemberList", meetMemberlist).addObject("meetList", meetList).addObject("meetLastList", meetLastList).setViewName("meet/meetList");
		
		
		return mv;
		
		
	}
	*/
	
	@RequestMapping("createMeet.bo")
	public String createMeet(GroupBoard g) {
		return"meet/meetCreate";	
	}

	@RequestMapping("insertMeet.bo")
	public String insertMeet(Meet m ,GroupBoard g, HttpSession session, Model model) {
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
				int result = mService.insertMeet(m);
				
				
					if(result > 0) {
						session.setAttribute("alertMsg", "독서모임 등록");
						return "redirect:meet.bo?gno=" + g.getGroupBoardNo();
					}else {
						model.addAttribute("errorMsg", "게시글 작성실패");
						return "common/errorPage";
						
					}
				
	}
			
	@RequestMapping("insertMeet.me")
	public String insertGMem (GroupBoard g, MeetMember mb ,HttpSession session, Member m) {

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

		int result = mService.insertMeetMem(mb);
		
		if(result > 0) {
		
			session.setAttribute("alertMsg", "가입되었습니다.");
		} 
		
		return"redirect:meet.bo?gno="+g.getGroupBoardNo();
	}
	
	
	
	
}
