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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.so.board.service.BoardService;
import com.so.board.util.PagingUtil;
import com.so.board.vo.Board;

@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	private BoardService boardService;
	
	// 메인
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String requestMainPage(Model model){
		
		model.addAttribute("menu", "main");
		
		return "index";
	}
	

	// 게시판 페이지
	@RequestMapping(value = "/boardList2", method = RequestMethod.GET)
	public String listBoard2(Model model, @RequestParam(value="pageNo", defaultValue="1") String pageNo,
										  @RequestParam(value="dataPerPage", defaultValue="5") String data_Per_Page,
										  @RequestParam(value="pageCount", defaultValue="5") String page_Count){
		
		logger.info("---------------listBoard---------------");
		
		int page = Integer.parseInt(pageNo);
		int dataPerPage = Integer.parseInt(data_Per_Page);
		int pageCount = Integer.parseInt(page_Count);
		
		PagingUtil pageUtil = boardService.getPagingBoardList(page, dataPerPage, pageCount);
		
		model.addAttribute("paging", pageUtil.paging());
		
		if(page == 1){
			model.addAttribute("boardList", boardService.getBoardList(page-1, dataPerPage));
		}
		else{
			model.addAttribute("boardList", boardService.getBoardList((page-1)*dataPerPage, dataPerPage));
		}
		
		model.addAttribute("menu", "board");
		model.addAttribute("subMenu", "list");
		
		return "index";
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String writeBoardPage(Model model){
		
		model.addAttribute("menu", "board");
		model.addAttribute("subMenu", "write");
		
		return "index";
	}
	
	@RequestMapping(value = "/writeBoard", method = RequestMethod.POST)
	@ResponseBody
	public String writeBoard(HttpServletRequest request, Board board){
	
		logger.info(board.toString());
		
		MultipartFile[] fileList = board.getBoard_files();
		
		if(fileList != null){
			for(MultipartFile file : fileList)
				logger.info("FILE : " + file.getOriginalFilename());
		}
		
		boardService.wirteBoard(board);
		
		return "boardList2";
	}
	
	@RequestMapping(value = "/boardView", method = RequestMethod.GET)
	public String viewBoard(Model model, String board_no){
		
		System.out.println(board_no);
		
		Board board = boardService.getBoard(Integer.parseInt(board_no));
		
		model.addAttribute("board", board);
		model.addAttribute("menu", "board");
		model.addAttribute("subMenu", "view");
		
		return "index";
	}
	


}
