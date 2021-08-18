package com.bookforyou.bk4u.meet.model.service;

import java.util.ArrayList;

import com.bookforyou.bk4u.group.model.vo.GroupBoard;
import com.bookforyou.bk4u.meet.model.vo.Meet;

public interface MeetService {

	
	int insertMeet(Meet m);
	
	int deleteMeet(int meetNo);
	
	int updateMeet(Meet m); 

	ArrayList<Meet> meetList();
	
	ArrayList<Meet> meetLastList();
}
