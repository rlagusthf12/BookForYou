package com.bookforyou.bk4u.meetboard.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bookforyou.bk4u.meetboard.model.service.MeetBoardService;
import com.bookforyou.bk4u.meetboard.model.vo.MeetBoard;

public class MeetBoardController {

	@Autowired
	private MeetBoardService bService;
	
	@RequestMapping(value="meetBoard.bo",  method=RequestMethod.GET)
	public String groupboardList(Model model) throws Exception {
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		ArrayList<MeetBoard> groupBoardList = bService.selectGBList();

		model.addAttribute("groupBoardList", groupBoardList);
		model.addAttribute("groupBoard", "../groupboard/groupBoardList.jsp");
		
				
		return "../views/groupboard/groupBoardList";
	}
	
	@RequestMapping("createBoard.gbo")
	public String createBoard() {
		return "../views/groupboard/groupBoardContentEdit";
	}
}
