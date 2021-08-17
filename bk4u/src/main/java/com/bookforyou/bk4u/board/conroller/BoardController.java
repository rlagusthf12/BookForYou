package com.bookforyou.bk4u.board.conroller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bookforyou.bk4u.board.model.service.BoardService;
import com.bookforyou.bk4u.board.model.vo.Board;
import com.bookforyou.bk4u.booklist.model.vo.Booklist;
import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.common.template.Pagination;
import com.bookforyou.bk4u.reply.model.vo.Reply;
import com.google.gson.Gson;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boService;
	
	
	/** 게시판 리스트 조회용 + 페이징
	 * @author daeunlee
	 */
	@RequestMapping("list.bo")
    public String selectList(Model model, @RequestParam(value="currentPage", defaultValue="1") int currentPage) {

        int listCount = boService.selectListCount(); // 총게시글 갯수 조회용
        PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
        ArrayList<Board> list = boService.selectList(pi);
        model.addAttribute("pi", pi);
        model.addAttribute("list", list);
        return "board/boardListView";
    }
	
	/** 게시글 상세조회용
	 * @author daeunlee
	 */
	@RequestMapping("detail.bo")
    public ModelAndView selectBoard(int boNo, ModelAndView mv) {

        int result = boService.increaseCount(boNo);

        if (result > 0) {
            Board b = boService.selectBoard(boNo);
            mv.addObject("b", b).setViewName("board/boardDetailView");
        } else {
            mv.addObject("errorMsg", "상세조회 실패").setViewName("common/errorPage");
        }
        return mv;
    }
	
	/** 게시글 작성 호출용
	 * @author daeunlee
	 */
	@RequestMapping("enrollForm.bo")
	public String enrollForm() {
		return "board/boardEnrollForm";
	}
	
	/** 게시글 작성용
	 * @author daeunlee
	 */
	@RequestMapping("insert.bo")
    public String insertBoard(Board b, HttpSession session, Model model) {
        int result = boService.insertBoard(b);
        if (result > 0) { // 성공
            session.setAttribute("alertMsg", "게시글 작성에 성공했슴당");
            return "redirect:list.bo";
        } else {
            model.addAttribute("errorMsg", "게시글 등록 실패");
            return "common/errorPage";
        }
    }
	
	/** 수정 페이지 요청
	 * @author daeunlee
	 */
    @RequestMapping("updateForm.bo")
    public String updateForm(int boNo, Model model) {
        model.addAttribute("b", boService.selectBoard(boNo));
        return "board/boardUpdateForm";
    }
    
    /** 수정용
	 * @author daeunlee
	 */
    @RequestMapping("update.bo")
    public String updateBoard(Board b, HttpSession session, Model model) {
        int result = boService.updateBoard(b);
        System.out.println(b);
        if (result > 0) { // 성공 => 상세페이지 조회
            session.setAttribute("alertMsg", "성공적으로 게시글이 수정되었습니다");
            return "redirect:detail.bo?boNo=" + b.getBoNo();
        } else {
            model.addAttribute("errorMsg", "게시글 수정 실패");
            return "common/errorPage";
        }

    }
    
    /** 삭제용
	 * @author daeunlee
	 */
    @RequestMapping("delete.bo")
    public String deleteBoard(int boNo, Model model, HttpSession session) {
        int result = boService.deleteBoard(boNo);
        if (result > 0) { // 성공 =>
            session.setAttribute("alertMsg", "성공적으로 게시글이 삭제되었습니다.");
            return "redirect:list.bo";
        } else { // 실패
            model.addAttribute("errorMsg", "게시글 삭제 실패");
            return "common/errorPage";
        }

    }
    
    /** 게시글 검색용
	 * @author daeunlee
	 */
	@RequestMapping("search.bo")
	public ModelAndView selectBoardSearchList(ModelAndView mv, @RequestParam(value="currentPage", defaultValue="1") int currentPage,
			                                     String condition, String keyword) {
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		int listCount = boService.selectSearchListCount(map);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Board> list = boService.selectBoardSearchList(map, pi);
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .addObject("condition", condition)
		  .addObject("keyword", keyword)
		  .setViewName("board/boardListView");
		
		return mv;
	}
	
	/** 카테고리별 게시글 조회용
	 * @author daeunlee
	 */
	@RequestMapping("category.bo")
	public ModelAndView selectBoardCategory(ModelAndView mv, @RequestParam(value="currentPage", defaultValue="1") int currentPage,
			                                     String category) {
		int listCount = boService.selectBoardCategoryCount(category);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Board> list = boService.selectBoardCategory(category, pi);
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .addObject("category", category)
		  .setViewName("board/boardListView");
		
		return mv;
	}
	
	/** 댓글 리스트 조회
	 * @author daeunlee
	 */
	@ResponseBody
	@RequestMapping(value="rlistAjax.bo", produces="application/json; charset=utf-8")
	public String selectReplyList(int boNo) {
		ArrayList<Reply> list = boService.selectReplyList(boNo);
		return new Gson().toJson(list);
	}
	
	/** 댓글 작성
	 * @author daeunlee
	 */
	@ResponseBody
	@RequestMapping(value="rinsertAjax.bo", produces="application/json; charset=utf-8")
	public String insertReply(Reply r) {
		int result = boService.insertReply(r);
		if(result>0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	/** 대댓글 작성
	 * @author daeunlee
	 */
	@ResponseBody
	@RequestMapping(value="recoinsertAjax.bo", produces="application/json; charset=utf-8")
	public String insertReco(Reply r) {
		int result = boService.insertReco(r);
		System.out.println(r);
		if(result>0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	
	
}
