package com.so.board.dao;

import java.util.List;

import com.so.board.vo.Board;

public interface BoardDAO {
	
	public int getTotalData();
	
	public List<Board> searchAll(int offset, int dataPerPage);
	
	public Board searchBoard(int board_no);
	
	public void boardInsert(Board board);
	
	public void boardUpdate(Board board);
	
	public void boardDelete(int board_no);

	public void writeBoard(Board board);

}
