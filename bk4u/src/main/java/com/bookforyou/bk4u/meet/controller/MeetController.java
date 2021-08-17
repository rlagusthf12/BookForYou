package com.bookforyou.bk4u.meet.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bookforyou.bk4u.group.model.vo.GroupBoard;
import com.bookforyou.bk4u.meet.model.service.MeetService;
import com.bookforyou.bk4u.meet.model.vo.Meet;

@Controller
public class MeetController {
	
	@Autowired
	private MeetService mService;

	
	@RequestMapping(value="meet.bo",  method=RequestMethod.GET)
	public String meetList(Model model) throws Exception {
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

		ArrayList<Meet> meetList = mService.selectMList();

		model.addAttribute("meetList", meetList);
		model.addAttribute("meet", "../meet/meetList.jsp");
		
				
		return "../views/meet/meetList";
	}
	
	
	@RequestMapping("createMeet.bo")
	public String createMeet() {
		return"meet/meetCreate";	
	}

	@RequestMapping("insertMeet.bo")
	public String insertMeet(Meet m ,GroupBoard g, HttpSession session, Model model) {
		
		System.out.println(m);
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
				int result = mService.insertMeet(m);
				
			
					
					if(result > 0) {
						return "redirect:meetList.jsp";
					}else {
						model.addAttribute("errorMsg", "게시글 작성실패");
						return "common/errorPage";
						
					}
				
	}
				
	
	
	
}
