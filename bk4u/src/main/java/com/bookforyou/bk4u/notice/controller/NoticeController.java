package com.bookforyou.bk4u.notice.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.common.template.Pagination;
import com.bookforyou.bk4u.notice.model.service.NoticeService;
import com.bookforyou.bk4u.notice.model.vo.Notice;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService nService;
	
	@RequestMapping("list.no")
	public ModelAndView selectList(ModelAndView mv, @RequestParam(value="currentPage", defaultValue="1") int currentPage) {
		int listCount = nService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Notice> list = nService.selectList(pi);
		
		mv.addObject("pi",pi)
		   .addObject("list",list)
		   .setViewName("notice/noticeListView");
		
		return mv;
	}
	
	@RequestMapping("detail.no")
	public ModelAndView selectNotice(int noNo, ModelAndView mv) {
		
		int result = nService.increaseCount(noNo);
		
		if(result>0) {
			Notice n = nService.selectNotice(noNo);
			mv.addObject("n",n).setViewName("notice/noticeDetailView");
		}
		return mv;
		
	}
	
	@RequestMapping("updateForm.no")
	public String updateForm(int noNo, Model model) {
		model.addAttribute("n",nService.selectNotice(noNo));
		return "notice/noticeUpdate";
	}
	
	@RequestMapping("update.no")
	public String updateNotice(Notice n,  HttpSession session, Model model) {
		
		int result = nService.updateNotice(n);
		
		if(result>0) {
			session.setAttribute("alertMsg", "성공적으로 수정되었습니다.");
			return "redirect:detail.no?noNo="+n.getNoNo();
		} else {
			session.setAttribute("alertMsg", "수정에 실패하였습니다.");
			return "redirect:detail.no?noNo="+n.getNoNo();
		}
	} 
	
	@RequestMapping("delete.no")
	public String deleteNotice(int noNo, HttpSession session ) {
		int result = nService.deleteNotice(noNo);
		
		if(result>0) {
			session.setAttribute("alertMsg","성공적으로 게시글이 삭제되었습니다.");
			return "redirect:list.no";
		} else {
			session.setAttribute("alertMsg","삭제에 실패하였습니다.");
			return "redirect:list.no";
		}
		
	}
	
	@RequestMapping("writeForm.no")
	public String writeForm() {
		return "notice/noticeWrite";
	}
	
	@RequestMapping("write.no")
	public String writeNotice(Notice n,HttpSession session){
		int result = nService.writeNotice(n);
		
		if(result>0) {
			session.setAttribute("alertMsg", "게시글 등록 성공");
			return "redirect:list.no";
		} else {
			session.setAttribute("alertMsg","삭제에 실패하였습니다.");
			return "redirect:list.no";
		}
		
		
	}
	
	
	
}
