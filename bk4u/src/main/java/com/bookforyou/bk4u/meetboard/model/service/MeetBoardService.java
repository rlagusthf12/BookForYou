package com.bookforyou.bk4u.meetboard.model.service;

import java.util.ArrayList;

import com.bookforyou.bk4u.meetboard.model.vo.MeetBoard;

public interface MeetBoardService {

	ArrayList<MeetBoard> selectGBList();
	
	ArrayList<MeetBoard> selectGBListMore(int page);
}
