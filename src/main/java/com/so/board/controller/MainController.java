package com.so.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.so.board.service.BoardService;
import com.so.board.util.PagingUtil;
import com.so.board.vo.Board;

@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	BoardService boardService;
	
	// 메인
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String requestMainPage(Model model){
		
		model.addAttribute("menu", "main");
		
		return "index";
	}
	

	// 게시판 페이지
	@RequestMapping(value = "/boardList2", method = RequestMethod.GET)
	public String listBoard2(HttpServletRequest request, Model model, @RequestParam(defaultValue = "1") String pageNo){
		
		logger.info("---------------listBoard---------------");
		
		int page = Integer.parseInt(pageNo);
		
		PagingUtil pageUtil = boardService.getPagingBoardList(page);
		
		model.addAttribute("paging", pageUtil.paging());
		
		if(page == 1){
			model.addAttribute("boardList", boardService.getBoardList(page-1, pageUtil.getDataPerPage()));
		}
		else{
			model.addAttribute("boardList", boardService.getBoardList((page-1)*pageUtil.getDataPerPage(), pageUtil.getDataPerPage()));
		}
		
		model.addAttribute("menu", "board");
		
		return "index";
		
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String writeBoardPage(){
		
		return "boardWrite";
	}
	
	@RequestMapping(value = "/writeBoard", method = RequestMethod.POST)
	public String writeBoard(HttpServletRequest request, Board board){
		
		HttpSession session = request.getSession();
		
		String board_writer = (String) session.getAttribute("user_id");
		
		board.setBoard_writer(board_writer);
		
		boardService.wirteBoard(board);
		
		return "redirect:/boardList2";
	}
	
	@RequestMapping(value = "/boardView", method = RequestMethod.GET)
	public String viewBoard(Model model, String board_no){
		
		System.out.println(board_no);
		
		Board board = boardService.getBoard(Integer.parseInt(board_no));
		
		model.addAttribute("board", board);
		
		return "boardView";
	}
	


}
