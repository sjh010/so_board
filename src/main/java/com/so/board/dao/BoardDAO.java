package com.so.board.dao;

import java.util.List;

import com.so.board.vo.Board;
import com.so.board.vo.FileInfo;

public interface BoardDAO {
	
	public int getTotalData();
	
	public List<Board> searchAll(int offset, int dataPerPage);
	
	public Board searchBoard(int board_no);
	
	public int boardInsert(Board board);
	
	public void boardUpdate(Board board);
	
	public void boardDelete(int board_no);

	public int writeBoard(Board board);

	public void writeFileInfo(FileInfo fileInfo);

}
