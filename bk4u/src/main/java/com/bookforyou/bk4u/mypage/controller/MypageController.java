package com.bookforyou.bk4u.mypage.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Random;
import java.util.SimpleTimeZone;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bookforyou.bk4u.board.model.vo.Board;
import com.bookforyou.bk4u.book.model.vo.Book;
import com.bookforyou.bk4u.book.model.vo.Grade;
import com.bookforyou.bk4u.booklist.model.vo.Booklist;
import com.bookforyou.bk4u.common.model.service.MailSendService;
import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.common.template.Pagination;
import com.bookforyou.bk4u.cs.model.vo.Cancel;
import com.bookforyou.bk4u.cs.model.vo.Refund;
import com.bookforyou.bk4u.cs.model.vo.Return;
import com.bookforyou.bk4u.group.model.vo.GroupBoard;
import com.bookforyou.bk4u.member.model.service.MemberService;
import com.bookforyou.bk4u.member.model.vo.Member;
import com.bookforyou.bk4u.member.model.vo.MemberCategory;
import com.bookforyou.bk4u.member.model.vo.MemberInterest;
import com.bookforyou.bk4u.mypage.model.service.MypageService;
import com.bookforyou.bk4u.mypage.model.vo.MyList;
import com.bookforyou.bk4u.order.model.vo.Order;
import com.bookforyou.bk4u.order.model.vo.OrderDetail;
import com.bookforyou.bk4u.payment.model.vo.Payment;
import com.bookforyou.bk4u.point.model.vo.Point;
import com.bookforyou.bk4u.qa.model.service.QaService;
import com.bookforyou.bk4u.qa.model.vo.Qa;
import com.bookforyou.bk4u.reply.model.vo.Reply;
import com.google.gson.Gson;

@Controller
public class MypageController {
	
	@Autowired
	private MypageService mypageService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MailSendService mss;

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	private QaService qService;
	
	MemberInterest memberInterest;
	
	MemberCategory memberCategory;
	
	private Logger log = LoggerFactory.getLogger(MypageController.class);
	
	
	
	
	
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
		//Member loginUser = (Member) session.getAttribute("loginUser");
		
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
		}
		
		int result = mypageService.updateProfileImg(loginUser);
		if(result > 0) {
			loginUser = memberService.loginMember(loginUser);
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
	public String updatePassword(String memNum, String memPwd,HttpSession session) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		int memNo = Integer.parseInt(memNum);
		String encPwd = bcryptPasswordEncoder.encode(memPwd);
		loginUser.setMemNo(memNo);
		loginUser.setMemPwd(encPwd);
		int result = mypageService.updateMemPassword(loginUser);
		
		if(result > 0) {
			loginUser = memberService.loginMember(loginUser);
			session.setAttribute("loginUser", loginUser);
			return "success";
		}else {
			return "fail";
		}
	}
	
	/**
	 * 기존 패스워드와 사용자가 입력한 패스워드 확인하는 메서드
	 * @param memNum
	 * @param inputLastPwd
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="match-last-pwd.mp")
	public String matchLastPassword(String memNum, String inputLastPwd) {
		int memNo = Integer.parseInt(memNum);
		String encLastPwd = memberService.selectMemberPassword(memNo);
		if(bcryptPasswordEncoder.matches(inputLastPwd, encLastPwd)) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	/**
	 * 마이페이지 닉네임 업데이트하는 메서드
	 * @author 안세아
	 * @param memNum
	 * @param inputNick
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="nick-change.mp")
	public String updateMemNickname(String memNum, String inputNick,HttpSession session) {
		Member member = new Member();
		int memNo =  Integer.parseInt(memNum);
		member.setMemNo(memNo);
		member.setMemNickname(inputNick);
		int result = mypageService.updateMemberNickname(member);
		if(result > 0) {
			Member loginUser = (Member) session.getAttribute("loginUser");
			member = memberService.loginMember(loginUser);
			session.setAttribute("loginUser", member);
			return "success";
		}else {
			return "fail";
		}
	}
	
	/**
	 * 마이페이지 이메일 인증번호 보내기
	 * @author 안세아
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="certificate-send.mp")
	public String sendCertificateNumberByEmail(String email) {
		Random random = new Random();
		String certificateNumber = Integer.toString(random.nextInt(888888) + 111111);
		
		mss.sendCertificateNumber(certificateNumber, email);
		log.info("certificateNum: " + certificateNumber);
		
		return certificateNumber;
		
		
	}
	
	/**
	 * 마이페이지 이메일 수정하는 메서드
	 * @author 안세아
	 * @param email
	 * @param session
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="update-email.mp")
	public String updateMemberEmail(String email,HttpSession session) {
		log.info("email: " + email);
		Member member = (Member) session.getAttribute("loginUser");
		member.setMemEmail(email);
		int result = mypageService.updateMemberEmail(member);
		log.info("result: " + result);
		if(result>0) {
			Member loginUser = memberService.loginMember(member);
			session.setAttribute("loginUser", loginUser);
			return "success";
		}else {
			return "fail";
		}
		
	}
	
	/**
	 * 마이페이지 중복확인 필요없는 부가 정보 수정해주는 메서드
	 * @author 안세아
	 * @param memNum
	 * @param memPostInput
	 * @param memBasicAddressInput
	 * @param memDetailAddressInput
	 * @param memAddressReferInput
	 * @param memNameInput
	 * @param memPhoneInput
	 * @param memGenderInput
	 * @param memAgeInput
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="update-detail-info.mp")
	public String updateMemberDetail(String memNum, String memPostInput, String memBasicAddressInput, String memDetailAddressInput, String memAddressReferInput, String memNameInput, String memPhoneInput, String memGenderInput, String memAgeInput, HttpSession session) {
		Member member = (Member) session.getAttribute("loginUser");
		int memNo = Integer.parseInt(memNum);
		member.setMemNo(memNo);
		member.setMemPost(memPostInput);
		member.setMemBasicAddress(memBasicAddressInput);
		member.setMemDetailAddress(memDetailAddressInput);
		member.setMemAddressRefer(memAddressReferInput);
		member.setMemName(memNameInput);
		member.setMemPhone(memPhoneInput);
		member.setMemGender(memGenderInput);
		member.setMemAge(memAgeInput);
		log.info("수정된 멤버: " + member);
		
		int result = mypageService.updateMemberDetail(member);
		log.info("result값: " +result);
		if(result > 0) {
			Member loginUser = memberService.loginMember(member);
			session.setAttribute("loginUser", loginUser);
			return "success";
		}else {
			return "fail";
		}
	}
	
	/**
	 * 회원 탈퇴 처리하는 메서드
	 * @author 안세아 
	 * @param member
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("disable-member.mp")
	public String disableMember(Member member, HttpSession session, Model model) {
		int result = mypageService.updateMemberStatusDisable(member);
		if(result > 0) {
			session.removeAttribute("loginUser");
			session.setAttribute("byeMsg", "탈퇴가 처리되었습니다. 그동안 이용해주셔서 감사합니다.");
			return "redirect:/";
		}else {
			model.addAttribute("errorMsg","유효하지 않은 접근입니다.");
			return "common/errorPage";
		}
	}
	
	/**
	 *  보관함 리스트 조회하는 메서드
	 * @param currentPage
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("my-list.mp")
	public String selectMyList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model,HttpSession session) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		int listCount = mypageService.selectMyListCount(loginUser);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		HashMap<String,Object> listParam = new HashMap<String,Object>();
		listParam.put("pi", pi);
		listParam.put("member", loginUser);
		
		ArrayList<Book> myList = mypageService.selectMyList(listParam);
		log.info("myList : "+ myList);
		model.addAttribute("pi", pi);
		model.addAttribute("list",myList);
		
		return "mypage/myList";
	}
	
	/**
	 * 리스트 삭제하는 메서드
	 * @author 안세아
	 * @param session
	 * @param bookArray
	 * @param model
	 * @return
	 */
	@RequestMapping("delete-my-list.mp")
	public String deleteMyList(HttpSession session, @RequestParam(value="bookArray")List<String> bookArray, Model model ) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		MyList myList = new MyList();
		myList.setMemNo(loginUser.getMemNo());
		int result = 0;
		for(String bookNo : bookArray) {
			int bkNo = Integer.parseInt(bookNo);
			myList.setBkNo(bkNo);
			result = mypageService.deleteMyList(myList);
		}
		if(result > 0) {
			session.setAttribute("delListResultMsg","선택하신 책들이 보관함에서 삭제되었습니다.");
			return "redirect:my-list.mp";
		}else {
			model.addAttribute("errorMsg", "잘못된 요청입니다.");
			return "common/errorPage";
		}
	
	}
	
	/**
	 * 마이페이지 나의 문의 조회하는 컨트롤러 메서드 
	 * @param currentPage
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("my-qna.mp")
	public String selectMyQaList(@RequestParam(value="currentPage", defaultValue="1") int currentPage,HttpSession session,Model model) {
		Member member = (Member) session.getAttribute("loginUser");
		int memNo = member.getMemNo();
		int listCount = qService.selectMemNoQaListCount(memNo);		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Qa> list = qService.searchMemNoQaList(pi,memNo);
		
		for(int i=0; i<list.size();i++) {
			status(list.get(i));
		}
		
		
		model.addAttribute("pi",pi);
		model.addAttribute("listCount", listCount);
		model.addAttribute("list",list);
		
		return "mypage/myQna";
	}
	
	
	public void status(Qa q) {
		
		switch(q.getAnsStatus()) {
		
		case "Y": q.setAnsStatus("답변완료");
		break;
			
		case "N": q.setAnsStatus("처리중");
		break;		
		
		default:
			q.setAnsStatus("error");
			System.out.println("error");	
			break;			
		}
		
	}
	
	/**
	 * 마이페이지 주문내역 조회하는 메서드 (수정중, 보람쌤께 질문후 수정 예정)
	 * @param currentPage
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("my-order-list.mp")
	public String myOrderList(@RequestParam(value="currentPage", defaultValue="1") int currentPage,HttpSession session,Model model, @RequestParam(value="beginDate", required=false) String beginDate, @RequestParam(value="endDate", required=false) String endDate, @RequestParam(value="orderStatus", defaultValue="전체") String orderStatus) {
		Member member = (Member)session.getAttribute("loginUser");
		int memNo = member.getMemNo();
		log.info("memNo: " + memNo);
		if(beginDate == null) {
			beginDate = getThreeMonthAgoDate();
			// 나중에 데이터 생기면 MonthAgoDate로 바꾸기
			endDate = getCurrentDate();
		}
		log.info("beginDate : " + beginDate);
		log.info("endDate : " + endDate);
		log.info("currentPage: " + currentPage);
		HashMap<String,Object> listParam = new HashMap<String,Object>();
		
		listParam.put("memNo",memNo);
		listParam.put("beginDate",beginDate);
		listParam.put("endDate", endDate);
		listParam.put("orderStatus", orderStatus);
		log.info("orderStautus" + orderStatus);
		
		int listCount = mypageService.selectMyOrderListCount(listParam);
		log.info("listCount: "+ listCount );
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		//listParam.put("pi",pi);
		ArrayList<Order> list = mypageService.selectMyOrderList(listParam , pi);
		
		for(int i=0; i<list.size();i++) {
			changeOrderStatus(list.get(i));
		}
		
		log.info("list:" + list);
		model.addAttribute("pi", pi);
		model.addAttribute("listCount",listCount);
		model.addAttribute("list",list);
		model.addAttribute("orderStatus",orderStatus);
		model.addAttribute("beginDate",beginDate);
		model.addAttribute("endDate",endDate);
		
		return "mypage/myOrderList";
		
	}
	
	// java로 오늘날짜 구하기
	private String getCurrentDate() {
			Date dateNow = Calendar.getInstance(new SimpleTimeZone(0x1ee6280, "KST")).getTime();
	        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd", Locale.getDefault());
	        return formatter.format(dateNow);
	}
	
	// 1달 전
	private String getMonthAgoDate() {
	     Calendar cal = Calendar.getInstance(new SimpleTimeZone(0x1ee6280, "KST"));
	     cal.add(Calendar.MONTH ,-1); // 한달전 날짜 가져오기
	     Date monthago = cal.getTime();
	     SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd", Locale.getDefault());
	     return formatter.format(monthago);
	}
	
	// 3달전
	private String getThreeMonthAgoDate() {
	     Calendar cal = Calendar.getInstance(new SimpleTimeZone(0x1ee6280, "KST"));
	     cal.add(Calendar.MONTH ,-3); // 세달전 날짜 가져오기
	     Date monthago = cal.getTime();
	     SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd", Locale.getDefault());
	     return formatter.format(monthago);
	}
	
	public void changeOrderStatus(Order order) {
		
		switch(order.getOrderStatus()) {
		
		case "주문확인": order.setOrderStatus("결제완료");
		break;

		}
	
	}
	
	/**
	 * 나의 독서모임 조회
	 * @param currentPage
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("my-reading-group.mp")
	public String selectMyReadingGroup(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model,HttpSession session) {
		Member member = (Member)session.getAttribute("loginUser");
		int memNo = member.getMemNo();
		int listCount = mypageService.selectMyReadingGroupListCount(member);
		PageInfo pi = Pagination.getPageInfo(listCount,currentPage,5,3);
		ArrayList<GroupBoard> list = mypageService.selectMyReadingGroupList(pi,memNo);
		
		for(int i=0; i<list.size();i++) {
			int groupBoardNo = list.get(i).getGroupBoardNo();
			int memCount = mypageService.selectMyReadingGroupMemberCount(groupBoardNo);
			list.get(i).setMemCount(memCount);
			log.info(list.get(i).getOriginName());
		}
		
		model.addAttribute("list", list);
		model.addAttribute("listCount",listCount);
		model.addAttribute("pi",pi);
		
		return "mypage/myReadingGroup";
	}
	
	/**
	 * 마이페이지 특정 주문의 상세 페이지로 이동하는 메서드
	 * @param orderNo
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("my-order-detail.mp")
	public String selectMyOrderDetail(int orderNo,HttpSession session,Model model) {
		ArrayList<OrderDetail> list = mypageService.selectOrderDetailList(orderNo);
		int bookCount = mypageService.selectMyOrderDeatilQuantity(orderNo);
		Order order = mypageService.selectOrder(orderNo);
		log.info("order: " + order);
		Payment payment = mypageService.selectOrderedPayment(orderNo);
		Refund refund = mypageService.selectMyRefund(orderNo);
		
		model.addAttribute("list",list);
		model.addAttribute("count",bookCount);
		model.addAttribute("order",order);
		model.addAttribute("payment",payment);
		model.addAttribute("refund",refund);
		log.info("refund : " + refund);
		
		return "mypage/myOrderDetail";
		
	}
	
	/**
	 * 마이페이지 내 주문 취소
	 * @author 안세아
	 * @param orderNo
	 * @param session
	 * @return
	 */
	@RequestMapping("cancel-my-order.mp")
	public String insertMyOrderCancel(int orderNo,String cancelReason,HttpSession session) {
		
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("orderNo",orderNo);
		map.put("cancelReason",cancelReason);
		
		Cancel cancelData = new Cancel();
		cancelData.setOrderNo(orderNo);
		cancelData.setCancelReason(cancelReason);
		cancelData.setStatus("취소신청");
		
		// 이미 접수된 내역인지 확인
		int count = mypageService.selectMyCancelCount(cancelData);
		
		if(count == 0) {
			//주문 취소 테이블에 주문번호, 취소 사유 insert, 취소신청
			int result = mypageService.insertMyOrderCancel(cancelData);
			
			if(result > 0) {
				session.setAttribute("cancelMsg", "주문 취소 접수가 완료되었습니다.");
				return "redirect:my-order-detail.mp?orderNo=" + orderNo;
			}else {
				session.setAttribute("cancelMsg", "주문 취소 접수에 실패하였습니다.Q&A에 문의 부탁드립니다.");
				return "redirect:my-order-detail.mp?orderNo=" + orderNo;
			}
		}else {
			session.setAttribute("cancelMsg", "주문 취소 접수가 이미 진행중입니다.");
			return "redirect:my-order-detail.mp?orderNo=" + orderNo;
		}
		
	}
	
	/**
	 * 마이페이지 내 주문 수취확인 및 구매확정 (주문/주문상세 상태 배송완료로 바뀌고, 포인트 적립됨)
	 * @author 안세아
	 * @param orderNo
	 * @param price
	 * @param session
	 * @return
	 */
	@RequestMapping("update-my-order-delivered.mp")
	public String updateMyOrderDelivered(int orderNo, int price, HttpSession session) {
		log.info("price: " + price);
		
		Member member = (Member) session.getAttribute("loginUser");
		int memNo = member.getMemNo();
		
		int result = mypageService.updateMyOrderDelivered(orderNo);
		log.info("result : " + result);
		int result2 = mypageService.updateMyOrderDetailDelivered(orderNo);
		log.info("result2 : " + result2);
		if(result > 0 && result2 > 0) {
			int pt = (int) Math.round(price / 10);
			Point point = new Point();
			point.setPointPrice(pt);
			point.setMemNo(memNo);
			point.setOrderNo(orderNo);
			point.setPointContent("적립");
			
			int result3 = mypageService.insertOrderPoint(point);
			log.info("result3 : " + result3);
			if(result3 > 0) {
				session.setAttribute("orderDeliveredMsg", "구매가 확정되고 포인트가 적립되었습니다.");
				return "redirect:my-order-detail.mp?orderNo=" + orderNo;
			}else {
				session.setAttribute("orderDeliveredMsg", "구매 확정이 실패하였습니다.");
				return "redirect:my-order-detail.mp?orderNo=" + orderNo;
			}
		}else {
			session.setAttribute("orderDeliveredMsg", "구매 확정이 실패하였습니다.");
			return "redirect:my-order-detail.mp?orderNo=" + orderNo;
		}
	}
	/**
	 * 마이페이지 내 주문 반품 신청
	 * @author 안세아
	 * @param orderNo
	 * @param returnReason
	 * @param etcText
	 * @param session
	 * @return
	 */
	@RequestMapping("return-my-order.mp")
	public String updateMyOrderReturn(int orderNo, String returnReason, String etcText, HttpSession session) {
		Member member = (Member) session.getAttribute("loginUser");
		int memNo = member.getMemNo();
		Return rt = new Return();
		rt.setOrderNo(orderNo);
		rt.setStatus("반품신청");
		if(returnReason.equals("기타")) {
			rt.setReturnReason(etcText);
		}else {
			rt.setReturnReason(returnReason);
		}
		// 이미 접수된 내역인지 확인
		int count = mypageService.selectMyReturnCount(rt);
		
		if(count == 0) {
		
			int result = mypageService.insertMyOrderReturn(rt);
		
			if(result > 0) {
				session.setAttribute("cancelMsg", "반품 처리 접수가 완료되었습니다.");
				return "redirect:my-order-detail.mp?orderNo=" + orderNo;
			}else {
				session.setAttribute("cancelMsg", "반품 접수에 실패하였습니다. Q&A에 문의부탁드립니다.");
				return "redirect:my-order-detail.mp?orderNo=" + orderNo;
			}
		}else {
			session.setAttribute("cancelMsg", "이미 반품 접수된 내역이 있습니다.");
			return "redirect:my-order-detail.mp?orderNo=" + orderNo;
		}
	}
	
	/**
	 * 마이페이지 도서 평점 메서드
	 * @author 안세아
	 * @param orderNo
	 * @param bkNo
	 * @param starGrade
	 * @param session
	 * @return
	 */
	@RequestMapping("insert-grade.mp")
	public String insertGrade(int orderNo,int bkNo,int starGrade,HttpSession session) {
		Member member = (Member)session.getAttribute("loginUser");
		int memNo = member.getMemNo();
		
		Grade grade = new Grade();
		grade.setMemNo(memNo);
		grade.setBkNo(bkNo);
		grade.setGradeStar(starGrade);
		
		int result = mypageService.insertMyBookGrade(grade);
		
		if(result > 0) {
			session.setAttribute("gradeMsg", "도서 평점이 등록되었습니다.");
			return "redirect:my-order-detail.mp?orderNo=" + orderNo;
		}else {
			session.setAttribute("gradeMsg", "도서 평점 등록에 실패하였습니다.");
			return "redirect:my-order-detail.mp?orderNo=" + orderNo;
		}
	}
	
	/**
	 * 마이페이지 나의 자유게시판 글 조회
	 * @author 안세아
	 * @param currentPage
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("my-board.mp")
	public String selectMyBoardList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model,HttpSession session) {
		Member member = (Member)session.getAttribute("loginUser");
		int memNo = member.getMemNo();
		int listCount = mypageService.selectMyBoardListCount(memNo);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Board> list = mypageService.selectMyBoardList(pi,memNo);
		
		model.addAttribute("pi",pi);
		model.addAttribute("listCount", listCount);
		model.addAttribute("list",list);
		
		return "mypage/myBoard";
	}
	
	/**
	 * 마이페이지 내 댓글 리스트 조회
	 * @author 안세아
	 * @param currentPage
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("my-reply.mp")
	public String selectMyReplyList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model,HttpSession session) {
		Member member = (Member)session.getAttribute("loginUser");
		int memNo = member.getMemNo();
		int listCount = mypageService.selectMyReplyListCount(memNo);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Reply> list = mypageService.selectMyReplyList(pi,memNo);
		
		model.addAttribute("pi",pi);
		model.addAttribute("listCount", listCount);
		model.addAttribute("list",list);
		
		return "mypage/myReply";
	}
	/**
	 * 주소록
	 * 김형우
	 */
	@RequestMapping("phoneBook.mp")
	public String phonBook() {
		return "mypage/phonebook";
	}
	
	/**
	 * 작성한 독서록 조회
	 * 김형우
	 */
	@RequestMapping("myBook.mp")
public String selectList(Model model, @RequestParam(value="currentPage", defaultValue="1") int currentPage) {
		
		int listCount = mypageService.selectListCount(); // 독서록 총 게시글 갯수 조회
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Booklist> list = mypageService.selectMbList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "mypage/mybook";
	}
	// 스크랩 독서록 조회
	@RequestMapping("clipping.mp")
	public String selectClippingList(Model model, @RequestParam(value="currentPage", defaultValue="1") int currentPage) {
			
			int listCount = mypageService.selectClippingListCount(); // 독서록 총 게시글 갯수 조회
			
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
			ArrayList<Booklist> list = mypageService.selectClippingList(pi);
			
			model.addAttribute("pi", pi);
			model.addAttribute("list", list);
			
			return "mypage/clipping";
		}
	/**
	 * 스크랩 독서록 추가
	 * 김형우
	 */
	@RequestMapping("inClipping.mp")
	public String clipping() {
		return "mypage/clipping";
	}
	// 스크랩 추가
	@RequestMapping("clipping.bl")
	public String insertBooklist(Booklist bl, Model model, HttpSession session) {
		
		int result = mypageService.insertClippinglist(bl);
			System.out.println(bl);
		if(result > 0) {
			session.setAttribute("alertMsg", "스크랩 되었습니다!");
			return "redirect:clipping.mp";
		}else {
			model.addAttribute("errorMag", "스크랩 실패.");
			return "common/errorPage";
		}
	}
	// 스크랩 삭제
	@RequestMapping("ClippingDelete.me")
	public String DeleteClipping(int blNo, Model model, HttpSession session) {
		
		int result = mypageService.deleteClipping(blNo);
	
		if(result > 0) {
		
					session.setAttribute("alertMsg", "스크랩에서 삭제되었습니다.");
					return "redirect:clipping.mp";
					
				}else {
					model.addAttribute("errorMsg", "스크랩 삭제 실패");
					return "common/errorPage";
				}
		
	}
	// 정기구독
	@RequestMapping("standingOrders.mp")
	public String standingOrders() {
		return "mypage/standingOrders";
	}
}
