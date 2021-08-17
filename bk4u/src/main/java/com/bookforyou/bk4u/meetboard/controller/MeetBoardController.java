package com.bookforyou.bk4u.meetboard.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bookforyou.bk4u.meetboard.model.service.MeetBoardService;
import com.bookforyou.bk4u.meetboard.model.vo.MeetBoard;

public class MeetBoardController {

	@Autowired
	private MeetBoardService mbService;
	
	@RequestMapping(value="meetBoard.bo",  method=RequestMethod.GET)
	public String groupboardList(Model model) throws Exception {
		
		ArrayList<MeetBoard> meetBoardList = mbService.selectGBList();

		model.addAttribute("meetBoardList", meetBoardList);
		model.addAttribute("groupBoard", "../groupboard/groupBoardList.jsp");
		
				
		return "../views/groupboard/groupBoardList";
	}
}
