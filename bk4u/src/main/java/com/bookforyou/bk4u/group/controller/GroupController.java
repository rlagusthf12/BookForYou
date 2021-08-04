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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bookforyou.bk4u.group.model.service.GroupService;
import com.bookforyou.bk4u.group.model.vo.GroupBoard;
import com.bookforyou.bk4u.member.model.vo.Member;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

@Controller
public class GroupController {

	@Autowired
	private GroupService gService;
	
	@RequestMapping(value="group.bo",  method=RequestMethod.GET)
	public String groupListView(Model model) {
		
		ArrayList<GroupBoard> groupList = gService.selectList();
		
		model.addAttribute("groupList", groupList);
		
		return "group/groupList";

		
	}
	
	@ResponseBody
	@RequestMapping(value="group.bo", method=RequestMethod.POST)
	public String groupListMore(String more , Model model) throws Exception{
		
		
		int page = Integer.parseInt(more);
		
		List<GroupBoard> selectListMore = gService.selectList();
		
		JsonObject sendJson = new JsonObject();
		
		JsonArray jarr = new JsonArray();

		return sendJson.toString();
		
	}
	
	@RequestMapping("createGroup.bo")
	public String createGroup() {
		return"group/groupCreate";	
	}
	
	@RequestMapping("insertGroup.bo")
	public String insertGroup( GroupBoard g , MultipartFile upfile, HttpSession session) {
		

			   if(!upfile.getOriginalFilename().equals("")) {
				 String groupImg = saveFile(session, upfile);
				 g.setGroupImg("/resources/groupFiles/");
				}
				
				int result = gService.insertGBoard(g);
				
				if(result > 0) {
					session.setAttribute("alertMsg", "독서모임 등록");
					return "redirect:group.bo";
				} else {
					return "redirect:group.bo";
				}
	
	
		
	}
	
	@RequestMapping("insertGMem.me")
	public void insertGMem (Member m ,Model model, HttpSession session) {
		
		int result = gService.insertGMem(m);
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "가입되었습니다.");
			return ;
			
		} 
	}
	
	public String saveFile(HttpSession session, MultipartFile upfile) {
		String savePath = session.getServletContext().getRealPath("/resources/groupFiles/");
		
		String originName = upfile.getOriginalFilename();
		// 20210702170130 ( 년월일시분초에 랜덤숫자 다섯개를 붙힘) + 21365 + (원본파일의확장자) .jps
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int)(Math.random() * 90000 + 10000);
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String groupImg = currentTime + ranNum + ext;
		
		try {
			upfile.transferTo(new File(savePath + groupImg));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return groupImg;
		
	}
	
	@RequestMapping("placeSelect.do")
	public void selectAjax(HttpServletRequest req, HttpServletResponse res, String param) {
		try {
			String province = param;
			
			List<String> cityList = new ArrayList();
			
			if(province.equals("seoul")) {
				cityList.add("강남구");
				cityList.add("강서구");
				cityList.add("강북구");
				cityList.add("강동구");
				cityList.add("노원구");
			} else if (province.equals("busan")){
				cityList.add("해운대구");
				cityList.add("경포대구");
				cityList.add("강북구");
				cityList.add("강동구");
				cityList.add("노원구");
			}
			
			JsonArray jsonArray = new JsonArray();
			for( int i = 0;  i < cityList.size(); i++) {
				jsonArray.add(cityList.get(i));
			}
			
			PrintWriter pw = res.getWriter();
			pw.print(jsonArray.toString());
			pw.flush();
			pw.close();
			
		 
	} catch (Exception e) {
		System.out.println("Controller error");
	}
	
	
	}
	
}
