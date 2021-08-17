package com.bookforyou.bk4u.cs.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.common.template.Pagination;
import com.bookforyou.bk4u.couponDetail.model.vo.CouponDetail;
import com.bookforyou.bk4u.cs.model.service.CsService;
import com.bookforyou.bk4u.cs.model.vo.Cancel;
import com.bookforyou.bk4u.cs.model.vo.Refund;
import com.bookforyou.bk4u.cs.model.vo.Return;
import com.bookforyou.bk4u.member.model.vo.Member;
import com.bookforyou.bk4u.order.model.service.OrderService;
import com.bookforyou.bk4u.order.model.vo.Order;
import com.bookforyou.bk4u.order.model.vo.OrderDetail;
import com.bookforyou.bk4u.payment.model.vo.Payment;

@Controller
public class CsController {

	@Autowired
	private CsService cService;
	
	@Autowired
	private OrderService odService;
	
	/**
	 * [관리자] '주문취소', '반품', '환불' 목록 조회 (한진)
	 */
	@RequestMapping("adminCSList.cs")
	public ModelAndView selectAdminCsList(ModelAndView mv, @RequestParam(value="currentPage", defaultValue="1") int currentPage,
											@RequestParam(value="cStatus") String cStatus,
											@RequestParam(value="array", defaultValue="0") String array) {
		
		HashMap<String, String> filter = new HashMap<>();
		filter.put("array", array);
		
		int cancelCount = cService.selectAdminCancelCount();
		int returnCount = cService.selectAdminReturnCount();
		int refundCount = cService.selectAdminRefundCount();
		
		PageInfo pi = null;
		
		if(cStatus.equals("1")) {
			pi = Pagination.getPageInfo(cancelCount, currentPage, 10, 5);
			ArrayList<Cancel> cList = (ArrayList)cService.selectAdminCancelList(pi, filter);
			mv.addObject("cList", cList)
			  .setViewName("cs/adminCancel");
		}else if(cStatus.equals("2")) {
			pi = Pagination.getPageInfo(returnCount, currentPage, 10, 5);
			ArrayList<Return> rtList = (ArrayList)cService.selectAdminReturnList(pi, filter);
			mv.addObject("rtList", rtList)
			  .setViewName("cs/adminReturn");
		}else if(cStatus.equals("3")) {
			pi = Pagination.getPageInfo(refundCount, currentPage, 10, 5);
			ArrayList<Refund> rfList = (ArrayList)cService.selectAdminRefundList(pi, filter);
			mv.addObject("rfList", rfList)
			  .setViewName("cs/adminRefund");
		}
		
		mv.addObject("pi", pi)
		  .addObject("ar", array)
		  .addObject("cStatus", cStatus)
		  .addObject("cancelCount", cancelCount)
		  .addObject("returnCount", returnCount)
		  .addObject("refundCount", refundCount);
		
		return mv;
		
	}
	
	/**
	 * [관리자] 검색조건에 일치하는 CS목록 조회 (한진)
	 */
	@RequestMapping("adminCsListSearch.cs")
	public ModelAndView adminCsSearch(ModelAndView mv, String condition, String keyword,
										@RequestParam(value="currentPage", defaultValue="1") int currentPage,
										@RequestParam(value="array", defaultValue="0") String array,
										@RequestParam(value="cStatus") String cStatus) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("cStatus", cStatus);
		map.put("array", array);
		
		int conListCount = cService.selectAdminSearchCount(map);
		
		PageInfo pi = null;
		
		int cancelCount = cService.selectAdminCancelCount();
		int returnCount = cService.selectAdminReturnCount();
		int refundCount = cService.selectAdminRefundCount();
		
		if(cStatus.equals("1")) {
			pi = Pagination.getPageInfo(conListCount, currentPage, 10, 5);
			ArrayList<Cancel> cList = (ArrayList)cService.selectAdminSearchCancelList(pi, map);
			mv.addObject("cList", cList)
			  .setViewName("cs/adminCancel");
		}else if(cStatus.equals("2")) {
			pi = Pagination.getPageInfo(conListCount, currentPage, 10, 5);
			ArrayList<Return> rtList = (ArrayList)cService.selectAdminSearchReturnList(pi, map);
			mv.addObject("rtList", rtList)
			  .setViewName("cs/adminReturn");
		}else if(cStatus.equals("3")) {
			pi = Pagination.getPageInfo(conListCount, currentPage, 10, 5);
			ArrayList<Refund> rfList = (ArrayList)cService.selectAdminSearchRefundList(pi, map);
			mv.addObject("rfList", rfList)
			  .setViewName("cs/adminRefund");
		}
		
		mv.addObject("pi", pi)
		  .addObject("ar", array)
		  .addObject("cStatus", cStatus)
		  .addObject("conListCount", conListCount)
		  .addObject("cancelCount", cancelCount)
		  .addObject("returnCount", returnCount)
		  .addObject("refundCount", refundCount);
		
		return mv;
	}
	
	/**
	 * [관리자] 주문취소 상세 조회 (한진)
	 */
	@RequestMapping("adminCancelDatail.cs")
	public ModelAndView selectAdminCancelDetail(ModelAndView mv, int cancelNo, int orderNo, int no) {
		
		
		Cancel c = cService.selectAdminCancelDetail(cancelNo);
		Order o = odService.selectAdminOrderDetail(orderNo);
		ArrayList<OrderDetail> od = odService.selectAdminOrderedBook(orderNo);
		Payment p = odService.selectAdminOrderedPayment(orderNo);
		Member m = odService.selectAdminOrderedMem(orderNo);
		CouponDetail cd = odService.selectAdminOrderedUsedCoupon(orderNo);
		
		mv.addObject("c", c)
		  .addObject("o", o)
		  .addObject("od", od)
		  .addObject("p", p)
		  .addObject("m", m)
		  .addObject("cd", cd);
		
		if(no == 1) {
			mv.setViewName("cs/adminCancelDetail");
		}else if(no == 2) {
			mv.setViewName("cs/adminCancelProcess");
		}
		
		return mv;
		
	}
	
	/**
	 * [관리자] 주문 취소/반품 처리 (한진)
	*/
	@RequestMapping("adminProcess.cs")
	public String updateAdminProcess(ModelAndView mv, Refund r, RedirectAttributes ra) {
		
		Order o = new Order();
		o.setOrderNo(r.getOrderNo());
		int cancelResult = 0;
		int returnResult = 0;
		
		if(r.getRefundKind().equals("취소")) {
			o.setOrderStatus("주문취소");
			o.setCsStatus("취소처리중");
			// 취소 상태 변경
			cancelResult = cService.updateAdminCancelStatus(o);
			// 환불테이블에 insert
			cService.insertAdminRefundStatus(r);
		}else if(r.getRefundKind().equals("반품")) {
			o.setOrderStatus("반품");
			o.setCsStatus("반품처리중");
			// 반품 상태 변경
			returnResult = cService.updateAdminReturnStatus(o);
			// 환불테이블에 insert
			cService.insertAdminRefundStatus(r);
		}
		
		// 주문 상태 변경
		cService.updateAdminCsOrderStatus(o);
		
		if(cancelResult > 0) {
			ra.addFlashAttribute("alertMsg", "'취소처리중'으로 변경되었습니다.");
			return "redirect:/adminCancelDetail.cs?canlcelNo=" + r.getKindNo() + "&orderNo=" + r.getOrderNo() + "&no=1";
		}else if(returnResult > 0) {
			ra.addFlashAttribute("alertMsg", "'반품처리중'으로 변경되었습니다.");
			return "redirect:/adminReturnDetail.cs?returnNo=" + r.getKindNo() + "&orderNo=" + r.getOrderNo() + "&no=1";
		}
		
		return "error";
	}
	 
	/**
	 * [관리자] 반품 상세 조회 (한진)
	 */
	@RequestMapping("adminReturnDetail.cs")
	public ModelAndView selectAdminReturnDetail(ModelAndView mv, int returnNo, int orderNo, int no) {
		
		Return r = cService.selectAdminReturnDetail(returnNo);
		Order o = odService.selectAdminOrderDetail(orderNo);
		ArrayList<OrderDetail> od = odService.selectAdminOrderedBook(orderNo);
		Payment p = odService.selectAdminOrderedPayment(orderNo);
		Member m = odService.selectAdminOrderedMem(orderNo);
		CouponDetail cd = odService.selectAdminOrderedUsedCoupon(orderNo);
		
		mv.addObject("r", r)
		  .addObject("o", o)
		  .addObject("od", od)
		  .addObject("p", p)
		  .addObject("m", m)
		  .addObject("cd", cd);
		
		if(no == 1) {
			mv.setViewName("cs/adminReturnDetail");
		}else if(no == 2) {
			mv.setViewName("cs/adminReturnProcess");
		}
		
		return mv;
	}
	
	/**
	 * [관리자] 환불 상세 조회 (한진)
	 */
	@RequestMapping("adminRefundDetail.cs")
	public ModelAndView selectAdminRefundDetail(ModelAndView mv, int refundNo, int orderNo, int no) {
		
		Refund r = cService.selectAdminRefundDetail(refundNo);
		Order o = odService.selectAdminOrderDetail(orderNo);
		ArrayList<OrderDetail> od = odService.selectAdminOrderedBook(orderNo);
		Payment p = odService.selectAdminOrderedPayment(orderNo);
		Member m = odService.selectAdminOrderedMem(orderNo);
		CouponDetail cd = odService.selectAdminOrderedUsedCoupon(orderNo);
		
		mv.addObject("r", r)
		  .addObject("o", o)
		  .addObject("od", od)
		  .addObject("p", p)
		  .addObject("m", m)
		  .addObject("cd", cd);
		
		if(no == 1) {
			mv.setViewName("cs/adminRefundDetail");
		}else if(no == 2) {
			mv.setViewName("cs/adminRefundProcess");
		}
		
		return mv;
	}
	
	/**
	 * [관리자] 환불 처리 (한진)
	*/
	@RequestMapping("adminRefund.cs")
	public String updateAdminRefund(ModelAndView mv, Refund r, RedirectAttributes ra) {
		
		Order o = new Order();
		o.setOrderNo(r.getOrderNo());
		
		if(r.getRefundCoupon() != 0) {
			// 쿠폰 반환 (mem_coupon에 status 변경)
			int result = cService.updateAdminRefundCoupon(r);
		}
		if(r.getRefundPoint() != 0) {
			// 포인트 반환 (point에 내역 '적립'이름으로 insert
			cService.insertAdminRefundPoint(r);
		}
		
		// 취소&반품 상태 변경
		if(r.getRefundKind().equals("취소")) {
			o.setCsStatus("취소완료");
			cService.updateAdminCancelStatus(o);
		}else if(r.getRefundKind().equals("반품")) {
			o.setCsStatus("반품완료");
			cService.updateAdminReturnStatus(o);
		}
		
		// 환불 상태 변경
		int refundResult = cService.updateAdminRefundStatus(r.getOrderNo());
		
		// 주문 상태 변경
		o.setCsStatus("환불완료");
		cService.updateAdminCsOrderStatus(o);
		
		if(refundResult > 0) {
			ra.addFlashAttribute("alertMsg", "'환불'이 완료되었습니다.");
			return "redirect:/adminRefundDetail.cs?refundNo=" + r.getKindNo() + "&orderNo=" + r.getOrderNo() + "&no=1";
		}
		
		return "error";
		
	}
	
	/**
	 * [관리자] 관리자 메모 등록/수정 (한진)
	 */
	@RequestMapping("updateAdminMemo.cs")
	public String updateAdminMemo(RedirectAttributes ra, String cStatus, String orderNo, String adminMemoContent) {
		HashMap<String, String> map = new HashMap<>();
		map.put("cStatus", cStatus);
		map.put("orderNo", orderNo);
		map.put("adminMemo", adminMemoContent);
		
		int result = cService.updateAdminMemo(map);
		
		if(cStatus.equals("cancel")) {
			ra.addAttribute("cStatus", "1");
		}else if(cStatus.equals("return")) {
			ra.addAttribute("cStatus", "2");
		}else if(cStatus.equals("refund")) {
			ra.addAttribute("cStatus", "3");
		}
		
		return "redirect:/adminCSList.cs";
	}
	
	/**
	 * [관리자] 메모 삭제 (한진)
	 */
	@RequestMapping("deleteAdminMemo.cs")
	public String deleteAdminMemo(RedirectAttributes ra, String cStatus, String orderNo) {
		HashMap<String, String> map = new HashMap<>();
		map.put("cStatus", cStatus);
		map.put("orderNo", orderNo);
		
		int result = cService.deleteAdminMemo(map);
		
		if(cStatus.equals("cancel")) {
			ra.addAttribute("cStatus", "1");
		}else if(cStatus.equals("return")) {
			ra.addAttribute("cStatus", "2");
		}else if(cStatus.equals("refund")) {
			ra.addAttribute("cStatus", "3");
		}
		
		return "redirect:/adminCSList.cs";
	}
}
