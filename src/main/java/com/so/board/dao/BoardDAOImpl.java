package com.so.board.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.so.board.vo.Board;
import com.so.board.vo.FileInfo;

@Repository
public class BoardDAOImpl implements BoardDAO{

	@Autowired
	private SqlSession session;
	
	public int getTotalData(){
		
		return session.selectOne("query.getTotalData");
	}
	
	@Override
	public List<Board> searchAll(int offset, int dataPerPage) {
		
		HashMap<String,Integer> params = new HashMap<String,Integer>();
		
		params.put("offset", offset);
		params.put("dataPerPage", dataPerPage);
		
		return session.selectList("query.getBoardList", params);
	}
	
	@Override
	public Board searchBoard(int board_no) {
		
		Board board = session.selectOne("query.getBoard", board_no);
		
		//List<FileInfo> fileInfo = session.selectList("query.getFileInfo", board_no);
		
		return board;
	}
	
	@Override
	public int boardInsert(Board board) {
		
		session.insert("query.insertBoard", board);
		
		int board_no = board.getBoard_no();
				
		return board_no;
	}

	@Override
	public void boardUpdate(Board board) {
		session.update("query.updateBoard", board);
	}

	@Override
	public void boardDelete(int board_no) {
		session.delete("query.deleteBoard", board_no);
	}

	@Override
	public int writeBoard(Board board) {	
		
		session.insert("query.insertBoard", board);
		
		int board_no = board.getBoard_no();
				
		return board_no;
	}

	@Override
	public void writeFileInfo(FileInfo fileInfo) {
		session.insert("query.insertFile", fileInfo);
	}



}
