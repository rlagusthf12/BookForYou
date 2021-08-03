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
	
	/**
	 * 로그인 폼으로 이동하는 메서드
	 * @author 안세아
	 */
	@RequestMapping("login-form.me")
	public String loginForm() {
		return "member/login";
	}
	
	
	/**
	 * 암호화 적용 안한 버전의 메서드로, 회원가입 기능 완성하고 암호화 기능 추가하는 로그인 메서드를 하나 더 만들 예정입니다.
	 * @author 안세아
	 */
	@RequestMapping("login.me")
	public String loginMember(Member member,Model model,HttpSession session) {
		Member loginUser = memberService.loginMember(member);
		
		if(loginUser == null) {
			model.addAttribute("alertMsg", "일치하지 않는 회원정보입니다.");
			return "member/login";
		}else {
			session.setAttribute("loginUser", loginUser);
			// main페이지 업로딩 되면 여기만 수정
			return "redirect:/";
		}
		
	}
	
	/**
	 * logout메서드
	 * @author 안세아
	 */
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	/**
	 * 회원가입 창으로 이동하는 메서드
	 * @author 안세아
	 * @return
	 */
	@RequestMapping("enroll-form.me")
	public String enrollForm() {
		
		return "member/signup";
	}
	
	/**
	 * 아이디 중복 체크 메서드
	 * @author 안세아
	 * @param checkId
	 * @return
	 */
	@ResponseBody
	@RequestMapping("id-check.me")
	public String ajaxIdCheck(String checkId){
		int count = memberService.idCheck(checkId);
		return count > 0 ? "NNNNN" : "NNNNY";
	}
	
	/**
	 * 닉네임 중복 체크 메서드
	 * @author 안세아
	 * @param checkNick
	 * @return
	 */
	@ResponseBody
	@RequestMapping("nick-check.me")
	public String ajaxNickCheck(String checkNick) {
		int count = memberService.nickCheck(checkNick);
		return count > 0 ? "NNNNN" : "NNNNY";
	}
	
	/**
	 * 이메일 중복 체크 메서드
	 * @author 안세아
	 * @param checkEmail
	 * @return
	 */
	@ResponseBody
	@RequestMapping("email-check.me")
	public String emailCheck(String checkEmail) {
		int count = memberService.emailCheck(checkEmail);
		return count > 0 ? "NNNNN" : "NNNNY";
	}
	
	/**
	 * 추천 정보 회원가입 폼으로 이동하는 메서드
	 * @author 안세아
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
	
	/**
	 * 회원가입을 진행하는 메서드, 인증 메일 송신함 
	 * @author 안세아
	 */
	@RequestMapping("insert.me")
	public String insertMember(Member member,@RequestParam(value="interestArray")List<String> interestArray,@RequestParam(value="subCategoryArray")List<String> subCategoryArray, Model model) {
		
		
		String encPwd = bcryptPasswordEncoder.encode(member.getMemPwd());
		
		member.setMemPwd(encPwd);
		member.setMemStatus("M");
		member.setEmailStatus("N");
		
		int result = memberService.insertMember(member);
		
		if(result > 0) {
			int memNo = memberService.selectByMemId(member);
			memberInterest = new MemberInterest();
			memberInterest.setMemNo(memNo);
			for(String interest : interestArray) {
				int interestNo = Integer.parseInt(interest);
				memberInterest.setInterestNo(interestNo);
				int interestResult = memberService.insertMemberInterest(memberInterest);
			}
			
			memberCategory = new MemberCategory();
			memberCategory.setMemNo(memNo);
			for(String subcategory : subCategoryArray) {
				int subCategoryNo = Integer.parseInt(subcategory);
				memberCategory.setSubCategoryNo(subCategoryNo);
				int categoryResult = memberService.insertMemberCategory(memberCategory);
			}
			
			
			String authKey = mss.sendAuthMail(member.getMemEmail());
	        member.setEmailStatus(authKey);
	        int result2 = memberService.updateEmailStatus(member);
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
	
	/**
	 * 인증 메일 클릭시 나타나는 메서드
	 * @author 안세아
	 */
	@RequestMapping("sign-up-confirm.me")
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
			return "member/authSuccess";
		}else {
			model.addAttribute("alertMsg", "인증에 실패하였습니다.");
			return "member/login";
		}
		
		
	}
	
	/**
	 * 아이디 찾는 폼으로 이동하는 메서드
	 * @author 안세아
	 * @return
	 */
	@RequestMapping("id-find.me")
	public String idFindForm() {
		return "member/idFind";
	}
	
	/**
	 * 아이디 찾기 메일 폼으로 이동하는 메서드
	 * 1. 해당 메일로 가입한 회원 존재하면, 이메일로 아이디를 보내주고 idFind.jsp로 이동
	 * 2. 해당 메일로 가입한 회원이 존재하지 않다면, idFindWarn.jsp로 이동
	 * @author 안세아
	 * @return
	 */
	@RequestMapping("send-id-find-mail.me")
	public String sendIdFindMail(Member member) {
		Member findMember = memberService.findMemberByEmail(member);
		if(findMember != null) {
			mss.sendIdFindMail(findMember.getMemId(), findMember.getMemEmail());
			return "member/idFindMail";
		}else {
			return "member/idFindWarn";
		}
	}
	
	/**
	 * 비밀번호 찾기 폼으로 이동하는 메서드
	 * 1. 해당  아이디, 이메일과 일치하는 회원이 있다면, 패스워드 랜덤값으로 변경후 이메일로 해당 패스워드를 보내준다. 
	 * 2. 해당 아이디, 이메일과 일치하는 회원이 없다면, passwordFindWarn으로 포워딩
	 * @author 안세아
	 */
	@RequestMapping("send-password-find-mail.me")
	public String sendPasswordFindMail(Member member) {
		Member findMember = memberService.findMemberByEmailAndId(member);
		if(findMember != null) {
			String tempPassword = memberService.createTempPassword();
			String encPwd = bcryptPasswordEncoder.encode(tempPassword);
			member.setMemPwd(encPwd);
			int result = memberService.updatePassword(member);

			if(result > 0) {
				mss.sendNewPasswordMail(tempPassword,member.getMemEmail());
				return "member/passwordFindEmail";
			}else {
				//여기 나중에 수정
				return "member/passwordFindWarn";
			}
		}else {
			return "member/passwordFindWarn";
		}
		
	}
	
	
	
}
