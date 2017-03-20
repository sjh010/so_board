package com.so.board.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.so.board.dao.BoardDAO;
import com.so.board.util.PagingUtil;
import com.so.board.vo.Board;
import com.so.board.vo.FileInfo;

@Service
public class BoardServiceImpl implements BoardService{
	
	private int DATA_PER_PAGE = 10;
	private int PAGE_COUNT = 1;
	
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
	public PagingUtil getPagingBoardList(int pageNo, int dataPerPage, int pageCount){
		
		return new PagingUtil(boardDAO.getTotalData(),dataPerPage, pageCount, pageNo);
	}

	@Override
	public void wirteBoard(Board board) {
		
		int board_no = boardDAO.writeBoard(board);
		
		uploadFile(board.getBoard_files(), board_no);
	
	}

	private boolean uploadFile(MultipartFile[] fileList, int board_no){
		
		File saveFolder = new File("C://boardFile");
		if(!saveFolder.exists())
			saveFolder.mkdirs();
		
		if(fileList != null && fileList.length > 0){
			for(MultipartFile file : fileList){
				String filename_original = file.getOriginalFilename();
				String filename_custom = System.currentTimeMillis() + file.getOriginalFilename();
				try {
					file.transferTo(new File(saveFolder, filename_custom));
					
					FileInfo fileInfo = new FileInfo(filename_original, filename_custom, board_no);
					
					boardDAO.writeFileInfo(fileInfo);
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return true;
		}
		return false;
	}
	
	
}
