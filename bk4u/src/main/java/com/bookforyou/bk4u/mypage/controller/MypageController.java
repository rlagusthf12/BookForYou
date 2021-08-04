package com.bookforyou.bk4u.mypage.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bookforyou.bk4u.book.model.service.BookService;
import com.bookforyou.bk4u.book.model.vo.Book;
import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.common.template.Pagination;
import com.bookforyou.bk4u.member.model.service.MemberService;
import com.bookforyou.bk4u.member.model.vo.Member;
import com.bookforyou.bk4u.member.model.vo.MemberCategory;
import com.bookforyou.bk4u.member.model.vo.MemberInterest;
import com.bookforyou.bk4u.mypage.model.service.MypageService;
import com.google.gson.Gson;

@Controller
public class MypageController {
	
	@Autowired
	private MypageService mypageService;
	
	@Autowired
	private MemberService memberService;

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	MemberInterest memberInterest;
	
	MemberCategory memberCategory;
	
	/**
	 * 내 정보 페이지로 이동하는 메서드
	 * @author 안세아
	 * @return
	 */
	@RequestMapping("info.mp")
	public String myInfo() {
		return "mypage/myInfo";
	}
	
	/**
	 * 탈퇴 정보 페이지로 이동하는 메서드
	 * @author 안세아
	 * @return
	 */
	@RequestMapping("delete-account-form.mp")
	public String deleteAccountForm() {
		return "mypage/deleteAccount";
	}
	
	/**
	 * 추천 정보 페이지로 이동하는 메서드
	 * @author 안세아
	 * @return
	 */
	@RequestMapping("my-recommend.mp")
	public String updateMyRecommend(HttpSession session, Model model) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		return "mypage/myRecommend";
	}
	
	/**
	 * 추천정보 수정하는 메서드
	 * @author 안세아
	 */
	@RequestMapping("update-recommend.mp")
	public String recommedEnroll(Member member,HttpSession session, @RequestParam(value="interestArray")List<String> interestArray,@RequestParam(value="subCategoryArray")List<String> subCategoryArray, Model model ) {
		
		// 기존의 관심사, subCategory삭제
		int delInterestResult = mypageService.deleteAllMemInterest(member);
		int delSubcategoryResult = mypageService.deleteAllMemCategory(member);
		
		// 기존의 관심사와 subCategory가 삭제되면
		//interestArray와 subCategoryArray에서 하나씩 꺼내서 테이블에 넣어주기
		memberInterest = new MemberInterest();
		memberInterest.setMemNo(member.getMemNo());
		for(String interest : interestArray) {
			int interestNo = Integer.parseInt(interest);
			memberInterest.setInterestNo(interestNo);
			int interestResult = memberService.insertMemberInterest(memberInterest);
		}
		
		memberCategory = new MemberCategory();
		memberCategory.setMemNo(member.getMemNo());
		for(String subcategory : subCategoryArray) {
			int subCategoryNo = Integer.parseInt(subcategory);
			memberCategory.setSubCategoryNo(subCategoryNo);
			int categoryResult = memberService.insertMemberCategory(memberCategory);
		}
		// 멤버 객체 직업, 선호난이도 수정 반영해주기
		int updateMemberResult = memberService.updateMemberWorkAndLevel(member);
		if(updateMemberResult > 0) {
			// 다 성공하면 session에 새로운 loginUser반영
			Member loginUser = (Member) session.getAttribute("loginUser");
			Member updateMem = memberService.loginMember(loginUser);
			session.setAttribute("loginUser", updateMem);
			session.setAttribute("alertMsg", "성공적으로 반영되었습니다.");
			return "redirect:my-recommend.mp";
		}else {
			session.setAttribute("alertMsg", "반영에 실패하였습니다.");
			return "redirect:my-recommend.mp";
		}
		
		
		
	}
	
	/**
	 * 멤버의 추천 관심사 리스트를 가져오는 메서드
	 * @author 안세아
	 * @param memNo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="interest.mp",produces="application/json; charset=utf-8")
	public String selectMyInterestList(String memNum) {
		
		int memNo = Integer.parseInt(memNum);
		ArrayList<MemberInterest> memberInterestList = mypageService.getMemberInterestList(memNo);
		
		return new Gson().toJson(memberInterestList);
	} 
	
	/**
	 * 멤버의 추천 서브 카테고리를 가져오는 메서드
	 * @author 안세아
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="subcategory.mp",produces="application/json; charset=utf-8")
	public String selectMySubCategoryList(String memNum) {
		
		int memNo = Integer.parseInt(memNum);
		ArrayList<MemberCategory> mySubCategoryList = mypageService.getSubCategoryList(memNo);
	
		return new Gson().toJson(mySubCategoryList);
	}
	
	/**
	 * 멤버의 직업과 선호 난이도 가져오는 메서드
	 * @author 안세아
	 */
	@ResponseBody
	@RequestMapping(value="my-work-level.mp",produces="application/json; charset=utf-8")
	public String selectMyWorkAndLevel(HttpSession session) {
		
		Member loginUser = (Member) session.getAttribute("loginUser");
	
		return new Gson().toJson(loginUser);
	}
	
	/**
	 * 프로필 이미지 수정하는 메서드
	 * @author 안세아
	 * @param file
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value="update-my-profile-img.mp")
	public String uploadProfileImage(MultipartFile file, HttpSession session) throws Exception{
		Member loginUser = null;
		if(!file.getOriginalFilename().equals("")) {
			String changeName = saveFile(session,file);
			loginUser = (Member) session.getAttribute("loginUser");
			loginUser.setOriginImgName(file.getOriginalFilename());
			loginUser.setChangeImgName("resources/member/uploadFiles/"+changeName);
			System.out.println(loginUser);
		}
		
		int result = mypageService.updateProfileImg(loginUser);
		System.out.println(result);
		if(result > 0) {
			loginUser = memberService.loginMember(loginUser);
			System.out.println(loginUser);
			session.setAttribute("loginUser", loginUser);
			
			return "success";
		}else {
			
			return "fail";
			
		}
		
	}
	
	public String saveFile(HttpSession session, MultipartFile file) {
		String savePath = session.getServletContext().getRealPath("/resources/member/uploadFiles/");
		
		String originName = file.getOriginalFilename();
		// 20210702170130(년월일시분초) + 23152(랜덤값) + .jpg(원본파일확장자)
		String currentTime = new SimpleDateFormat("yyyyMMddHHMMSS").format(new Date());
		int ranNum = (int)(Math.random() * + 90000 + 10000);
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ranNum + ext;
		
		try {
			file.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return changeName;
	}
	
	/**
	 * 1번부터 12번 샘플 데이터 비암호화 회원의 패스워드 가져오는 메서드
	 * @author 안세아
	 * @param memNum
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="get-pwd.mp")
	public String getDecodePassword(String memNum){
		// 1. 1번부터 12번 회원의 패스워드 가져오는 버전
		int memNo = Integer.parseInt(memNum);
		String pwd = memberService.selectMemberPassword(memNo);
		System.out.println(pwd);
		return pwd;
		
	}
	
	/**
	 * 패스워드 암호화해서 업데이트 하는 메서드
	 * @author 안세아
	 * @param memNum
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="update-pwd.mp")
	public String updatePassword(String memNum, String memPwd) {
		Member member = new Member();
		int memNo = Integer.parseInt(memNum);
		String encPwd = bcryptPasswordEncoder.encode(memPwd);
		member.setMemNo(memNo);
		member.setMemPwd(encPwd);
		int result = mypageService.updateMemPassword(member);
		
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
}
