package com.so.board.vo;

public class FileInfo {

	private int file_no;
	private String filename_original;
	private String filename_custom;
	private int board_no;
	
	
	
	public FileInfo() {
		super();
	}

	public FileInfo(int file_no, String filename_original, String filename_custom, int board_no) {
		super();
		this.file_no = file_no;
		this.filename_original = filename_original;
		this.filename_custom = filename_custom;
		this.board_no = board_no;
	}
	
	public FileInfo(String filename_original, String filename_custom, int board_no) {
		super();
		this.filename_original = filename_original;
		this.filename_custom = filename_custom;
		this.board_no = board_no;
	}

	public int getFile_no() {
		return file_no;
	}
	public void setFile_no(int file_no) {
		this.file_no = file_no;
	}
	public String getFilename_original() {
		return filename_original;
	}
	public void setFilename_original(String filename_original) {
		this.filename_original = filename_original;
	}
	public String getFilename_custom() {
		return filename_custom;
	}
	public void setFilename_custom(String filename_custom) {
		this.filename_custom = filename_custom;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	@Override
	public String toString() {
		return "FileInfo [file_no=" + file_no + ", filename_original=" + filename_original + ", filename_custom="
				+ filename_custom + ", board_no=" + board_no + "]";
	}
}
