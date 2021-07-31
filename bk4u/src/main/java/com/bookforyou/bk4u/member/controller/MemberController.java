package com.bookforyou.bk4u.member.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bookforyou.bk4u.common.model.service.MailSendService;
import com.bookforyou.bk4u.member.model.service.MemberService;
import com.bookforyou.bk4u.member.model.vo.Member;
import com.bookforyou.bk4u.member.model.vo.MemberCategory;
import com.bookforyou.bk4u.member.model.vo.MemberInterest;


@Controller
public class MemberController {
	// Author : 안세아
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	private MailSendService mss;
	
	MemberInterest memberInterest;
	
	MemberCategory memberCategory;
	
	@RequestMapping("login-form.me")
	public String loginForm() {
		return "member/login";
	}
	
	
	/**
	 * 암호화 적용 안한 버전의 메서드로, 회원가입 기능 완성하고 암호화 기능 추가하는 로그인 메서드를 하나 더 만들 예정입니다.
	 */
	@RequestMapping("login.me")
	public String loginMember(Member member,Model model,HttpSession session) {
		Member loginUser = memberService.loginMember(member);
		
		if(loginUser == null) {
			model.addAttribute("alertMsg", "일치하지 않는 회원정보입니다.");
			System.out.println("로그인 실패" + loginUser);
			return "member/login";
		}else {
			session.setAttribute("loginUser", loginUser);
			// main페이지 업로딩 되면 여기만 수정
			System.out.println("로그인 성공" + loginUser);
			return "redirect:/";
		}
		
	}
	
	/**
	 * logout메서드
	 */
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("enroll-form.me")
	public String enrollForm() {
		
		return "member/signup";
	}
	
	@ResponseBody
	@RequestMapping("id-check.me")
	public String ajaxIdCheck(String checkId){
		int count = memberService.idCheck(checkId);
		System.out.println(count);
		return count > 0 ? "NNNNN" : "NNNNY";
	}
	
	@ResponseBody
	@RequestMapping("nick-check.me")
	public String ajaxNickCheck(String checkNick) {
		int count = memberService.nickCheck(checkNick);
		System.out.println(count);
		return count > 0 ? "NNNNN" : "NNNNY";
	}
	
	@ResponseBody
	@RequestMapping("email-check.me")
	public String emailCheck(String checkEmail) {
		int count = memberService.emailCheck(checkEmail);
		return count > 0 ? "NNNNN" : "NNNNY";
	}
	
	/**
	 * 
	 */
	@RequestMapping("second-enroll.me")
	public String firstEnroll(Member member, Model model) {
		model.addAttribute("memId", member.getMemId());
		model.addAttribute("memPwd", member.getMemPwd());
		model.addAttribute("memName",member.getMemName());
		model.addAttribute("memPost", member.getMemPost());
		model.addAttribute("memBasicAddress",member.getMemBasicAddress());
		model.addAttribute("memDetailAddress",member.getMemDetailAddress());
		model.addAttribute("memAddressRefer",member.getMemAddressRefer());
		model.addAttribute("memGender",member.getMemGender());
		model.addAttribute("memAge",member.getMemAge());
		model.addAttribute("memPhone",member.getMemPhone());
		model.addAttribute("memEmail",member.getMemEmail());
		model.addAttribute("memNickname",member.getMemNickname());
		
		return "member/signupRecommend";
	}
	
	@RequestMapping("insert.me")
	public String insertMember(Member member,@RequestParam(value="interestArray")List<String> interestArray,@RequestParam(value="subCategoryArray")List<String> subCategoryArray, Model model) {
		
		System.out.println(member);
		System.out.println(interestArray);
		System.out.println(subCategoryArray);
		
		
		String encPwd = bcryptPasswordEncoder.encode(member.getMemPwd());
		
		member.setMemPwd(encPwd);
		member.setMemStatus("M");
		member.setEmailStatus("N");
		
		int result = memberService.insertMember(member);
		System.out.println("1차 result : " + result);
		
		if(result > 0) {
			int memNo = memberService.selectByMemId(member);
			memberInterest = new MemberInterest();
			memberInterest.setMemNo(memNo);
			for(String interest : interestArray) {
				int interestNo = Integer.parseInt(interest);
				System.out.println(interest);
				memberInterest.setInterestNo(interestNo);
				int interest_result = memberService.insertMemberInterest(memberInterest);
				System.out.println("2차 result : " + interest_result);
			}
			
			memberCategory = new MemberCategory();
			memberCategory.setMemNo(memNo);
			for(String subcategory : subCategoryArray) {
				int subCategoryNo = Integer.parseInt(subcategory);
				memberCategory.setSubCategoryNo(subCategoryNo);
				int category_result = memberService.insertMemberCategory(memberCategory);
				System.out.println("3차 result : " + category_result);
			}
			
			
			String authKey = mss.sendAuthMail(member.getMemEmail());
	        member.setEmailStatus(authKey);
	        int result2 = memberService.updateEmailStatus(member);
	        System.out.println("4차 result : " + result2);
	        if(result2 > 0) {
	        	return "member/sendMail";
	        }else {
	        	model.addAttribute("alertMsg", "회원가입에 실패하였습니다.");
				return "member/login";
	        }
		}else {
			model.addAttribute("alertMsg", "회원가입에 실패하였습니다.");
			return "member/login";
		}
	}
	
	@RequestMapping("signUpConfirm.me")
	public String signUpConfirm(@RequestParam Map<String,String> map,Model model) {
		// 이메일과 authKey가 일치하면 멤버 상태를 업데이트 해준다.
		String authKey = map.get("authKey");
		String email = map.get("email");
		
		Member member = new Member();
		
		member.setMemEmail(email);
		member.setEmailStatus(authKey);
		
		Member signConfirmMember = memberService.selectEmailAndAuthKey(member);
		
		if(signConfirmMember != null) {
			member.setEmailStatus("Y");
			int result = memberService.updateEmailStatus(member);
			System.out.println(result);
			return "member/authSuccess";
		}else {
			model.addAttribute("alertMsg", "인증에 실패하였습니다.");
			return "member/login";
		}
		
		
	}
}
