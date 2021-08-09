package com.bookforyou.bk4u.board.conroller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bookforyou.bk4u.board.model.service.BoardService;
import com.bookforyou.bk4u.board.model.vo.Board;
import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.common.template.Pagination;

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
	
	/** 게시글 작성용
	 * @author daeunlee
	 */
	
	
	
}
