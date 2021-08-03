package com.bookforyou.bk4u.mypage.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
		
		System.out.println(delInterestResult);
		System.out.println(delSubcategoryResult);
		
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
			Member updateMem = memberService.loginMember(member);
			session.setAttribute("loginUser", updateMem);
			
			session.setAttribute("alertMsg", "성공적으로 반영되었습니다.");
			return "redirect:update-recommend.mp";
		}else {
			session.setAttribute("alertMsg", "반영에 실패하였습니다.");
			return "redirect:update-recommend.mp";
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
		System.out.println(memberInterestList);
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
}
