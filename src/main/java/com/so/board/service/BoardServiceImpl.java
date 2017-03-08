package com.so.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.so.board.dao.BoardDAO;
import com.so.board.util.PagingUtil;
import com.so.board.vo.Board;

@Service
public class BoardServiceImpl implements BoardService{
	
	private int DATA_PER_PAGE = 5;
	private int PAGE_COUNT = 7;
	
	@Autowired
	private BoardDAO boardDAO;
	
	@Override
	public List<Board> getBoardList(int offset, int dataPerPage) {
		
		return boardDAO.searchAll(offset, dataPerPage); 
	}

	@Override
	public Board getBoard(int board_no) {
			
		return boardDAO.searchBoard(board_no);
	}
	
	@Override
	public int getTotalData() {
		
		return boardDAO.getTotalData();
	}

	@Override
	public PagingUtil getPagingBoardList(int pageNo){
		
		return new PagingUtil(boardDAO.getTotalData(), DATA_PER_PAGE, PAGE_COUNT, pageNo);
	}

	@Override
	public void wirteBoard(Board board) {
		
		boardDAO.writeBoard(board);
	}

	
	
	
}
