package com.bookforyou.bk4u.meet.model.service;

import java.util.ArrayList;

import com.bookforyou.bk4u.group.model.vo.GroupBoard;
import com.bookforyou.bk4u.group.model.vo.GroupMember;
import com.bookforyou.bk4u.meet.model.vo.Meet;
import com.bookforyou.bk4u.meet.model.vo.MeetMember;
import com.bookforyou.bk4u.member.model.vo.Member;

public interface MeetService {

	
	int insertMeet(Meet m);
	
	int deleteMeet(int meetNo);
	
	int updateMeet(Meet m); 

	ArrayList<Meet> meetList(int groupBoardNo);
	
	ArrayList<Meet> meetLastList(int groupBoardNo);
	
	
	ArrayList<MeetMember> meetMemberList(int gno);

	int insertMeetMem(MeetMember mb);

	ArrayList<Member> memberInfo(Member m);
	

}
