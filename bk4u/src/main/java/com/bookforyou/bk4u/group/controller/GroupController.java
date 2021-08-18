package com.bookforyou.bk4u.group.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.common.template.Pagination;
import com.bookforyou.bk4u.group.model.service.GroupService;
import com.bookforyou.bk4u.group.model.vo.GroupBoard;
import com.bookforyou.bk4u.group.model.vo.GroupMember;
import com.bookforyou.bk4u.member.model.vo.Member;


@Controller
public class GroupController {

	@Autowired
	private GroupService gService;
	
	@RequestMapping(value="group.bo",  method=RequestMethod.GET)
	public String groupListView(Model model) throws Exception {

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

		ArrayList<GroupBoard> groupList = gService.selectList();
		GroupBoard activeGroup = gService.activeGroup(0);

		model.addAttribute("activeGroup", activeGroup);
		model.addAttribute("groupList", groupList);
		model.addAttribute("groupBoard", "../group/groupList.jsp");
		
				
		return "group/groupList";
	}
	
	@ResponseBody
	@RequestMapping(value="group.bo", method=RequestMethod.POST)
	public String groupListMore(String more, Model model) throws Exception{
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

		int page = Integer.parseInt(more);
		
		List<GroupBoard> selectListMore = gService.selectListMore(page);
		
		JSONObject sendJson = new JSONObject();
		
		JSONArray jarr = new JSONArray();
		
		
		for (GroupBoard groupBoard :selectListMore) {
			JSONObject jboard = new JSONObject();
			
			jboard.put("groupBoardNo", groupBoard.getGroupBoardNo());
			jboard.put("groupType", groupBoard.getGroupType());
			jboard.put("groupDate", groupBoard.getGroupDate());	
			jboard.put("groupTitle", groupBoard.getGroupTitle());
			jboard.put("groupScript", groupBoard.getGroupScript());
			jboard.put("groupPlace", groupBoard.getGroupPlace());
			jboard.put("groupImg", groupBoard.getChangeName());

			jarr.add(jboard);

		}
		
		sendJson.put("list", jarr);
		return sendJson.toJSONString();
		
	}

	
	
	@RequestMapping("createGroup.bo")
	public String createGroup() {
		return"group/groupCreate";	
	}
	
	@RequestMapping("insertGroup.bo")
	public String insertGroup( GroupBoard g , MultipartFile upfile, HttpSession session, Model model) {
		
				
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

				if(!upfile.getOriginalFilename().equals("")) {

					
					String changeName = saveFile(session, upfile);
					g.setOriginName(upfile.getOriginalFilename());
					g.setChangeName("resources/groupFiles/" + changeName);
				}
				
				int result = gService.insertGroup(g);
				
				if(result > 0) {
					
					session.setAttribute("alertMsg", "독서모임 등록");
					return "redirect:group.bo";
				} else {
					return "redirect:group.bo";
				}
	
	
		
	}
	
	
	
	@RequestMapping("insertGMem.me")
	public String insertGMem (GroupMember gm ,HttpSession session, Member m) {

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

		int result = gService.insertGMem(gm);
		
		if(result > 0) {
		
			session.setAttribute("alertMsg", "가입되었습니다.");
		} 
		
		return"redirect:detail.gbo?gno="+gm.getGroupBoardNo();
	}
	
	/*
	@RequestMapping("gorupMemberList")
	public ModelAndView home(Model model) throws Exception {
		
		GroupMember gm = new GroupMember();
		
		ModelAndView mv = new ModelAndView();
		
		ArrayList<GroupMember> groupMemberList = gService.groupMemberList();
		
		mv.setViewName("groupMemberList");
		mv.addObject("groupMemberList", groupMemberList);
		
		return mv;
	}
	*/
	
	
	public String saveFile(HttpSession session, MultipartFile upfile) {
		String savePath = session.getServletContext().getRealPath("/resources/groupFiles/");
		
		String originName = upfile.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int)(Math.random() * 90000 + 10000);
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ranNum + ext;
		
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
		
	}
		
	
	
	
	@RequestMapping("detail.gbo")
	public ModelAndView selectGroup( int gno, ModelAndView mv) {
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

		int result = gService.increaseCount(gno);
		
		if(result > 0 ) {
			GroupBoard g = gService.selectGroup(gno);
			
			// 현재 이 그룹에 속한 회원 리스트 조회
			ArrayList<GroupMember> list = gService.groupMemberList(gno);
			
			mv.addObject("groupMemberList", list).addObject("g", g).setViewName("group/groupDetailview");
		
			
		}else { 
			mv.addObject("errorMsg", "상세조회 실패").setViewName("common/errorPage");
			
		}
		
		return mv;
		
		
	}
	
	@RequestMapping("delete.gbo")
	public String deleteGroup(int gno, String filePath, HttpSession session, Model model) {
		int result = gService.deleteGroup(gno);
		 
		if(result > 0 ) {
			
			if(!filePath.equals("")) { //첨부파일이 있었다 = > 삭제한다
				String removeFilePath = session.getServletContext().getRealPath(filePath);
				new File(removeFilePath).delete();
			}
			
			session.setAttribute("alertMsg", "성공적으로 게시글이 삭제되었습니다.");
			return "redirect:group.bo";
			
		}else {
			model.addAttribute("errorMsg", "게시글 삭제 실패");
			return "common/errorPage";
		}
	}
	
	
	@RequestMapping("updateForm.gbo")
	public String updateForm(int gno, Model model) {
		model.addAttribute("g", gService.selectGroup(gno));
		return "group/groupChange";
		
	}

	
	
	@RequestMapping("update.gbo")
	public String updateGroup(GroupBoard g, MultipartFile reupfile, HttpSession session, Model model) {
		
		if(!reupfile.getOriginalFilename().equals("")) {
			if(g.getOriginName() != null) {
				new File(session.getServletContext().getRealPath(g.getChangeName())).delete();				
			}
			
			String changeName = saveFile(session, reupfile);
			g.setOriginName(reupfile.getOriginalFilename());
			g.setChangeName("resources/groupFiles/" + changeName);				
			
		}
		
				int result = gService.updateGroup(g);
						
						if(result > 0) {
							session.setAttribute("alertMsg", "수정되었습니다.");
							return "redirect:detail.gbo?gno=" + g.getGroupBoardNo();
						}else {
							model.addAttribute("errorMsg", "게시글 수정 실패");
							return "common/errorPage";
							
						}
		
		
	}
	
	
}
