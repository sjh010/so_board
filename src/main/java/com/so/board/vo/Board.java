package com.so.board.vo;

import java.sql.Date;
import java.util.Arrays;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Board {

	private int board_no;
	private String board_title;
	private String board_content;
	private String board_writer;
	private Date board_regdate;
	private MultipartFile[] board_files;
	private List<FileInfo> fileInfo;
	
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int no) {
		this.board_no = no;
	}
	public String getBoard_title() {
		return this.board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public String getBoard_writer() {
		return board_writer;
	}
	public void setBoard_writer(String board_writer) {
		this.board_writer = board_writer;
	}
	public Date getBoard_regdate() {
		return board_regdate;
	}
	public void setBoard_regdate(Date board_regdate) {
		this.board_regdate = board_regdate;
	}
	public MultipartFile[] getBoard_files() {
		return board_files;
	}
	public void setBoard_files(MultipartFile[] board_files) {
		this.board_files = board_files;
	}
	public List<FileInfo> getFileInfo() {
		return fileInfo;
	}
	public void setFileInfo(List<FileInfo> fileInfo) {
		this.fileInfo = fileInfo;
	}
	@Override
	public String toString() {
		return "Board [board_no=" + board_no + ", board_title=" + board_title + ", board_content=" + board_content
				+ ", board_writer=" + board_writer + ", board_regdate=" + board_regdate + ", board_files="
				+ Arrays.toString(board_files) + ", fileInfo=" + fileInfo + "]";
	}
	
	
	
	
	
	
}
