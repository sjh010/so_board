package com.so.board.service;

import java.util.List;

import com.so.board.util.PagingUtil;
import com.so.board.vo.Board;

public interface BoardService {

	public List<Board> getBoardList(int offset, int dataPerPage);
	
	public Board getBoard(int board_no);
	
	public int getTotalData();
	
	public PagingUtil getPagingBoardList(int pageNo);
	
	public void wirteBoard(Board board);
}
