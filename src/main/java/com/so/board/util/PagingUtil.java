package com.so.board.util;

public class PagingUtil {

	private int totalData=0;		// 총 데이터 수
	private int dataPerPage=0;		// 한 페이지당 데이터 수
	private int pageCount=0;		// 화면당 페이지 개수(ex. < 1 2 3 >)
	private int currentPage=0;		// 나타낼 페이지
	
	public PagingUtil(int totalData, int dataPerPage, int pageCount) {
		super();
		this.totalData = totalData;
		this.dataPerPage = dataPerPage;
		this.pageCount = pageCount;
		this.currentPage = 1;
	}

	public PagingUtil(int totalData, int dataPerPage, int pageCount, int currentPage) {
		super();
		this.totalData = totalData;
		this.dataPerPage = dataPerPage;
		this.pageCount = pageCount;
		this.currentPage = currentPage;
	}
	
	public int getTotalData() {
		return totalData;
	}

	public void setTotalData(int totalData) {
		this.totalData = totalData;
	}

	public int getDataPerPage() {
		return dataPerPage;
	}

	public void setDataPerPage(int dataPerPage) {
		this.dataPerPage = dataPerPage;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public String paging(){
		
		int totalPage = (int) Math.ceil((double) this.totalData / (double) this.dataPerPage);	// 총 페이지 수
		int totalPageGroup = (int) Math.ceil((double) totalPage / (double) this.pageCount);		// 총 페이지 그룹
		int currentPageGroup = (int) Math.ceil((double) this.currentPage / (double) this.pageCount);	// 페이지 그룹
		
		int last = currentPageGroup * pageCount;	// 화면에 보여질 마지막 페이지 번호
		
		if(last >= totalPage)	
			last = totalPage;
		
		int first = (pageCount*(currentPageGroup-1)) + 1;	// 화면에 보여질 첫 페이지 번호
		
//		if(totalPageGroup > 1 && totalPageGroup == currentPageGroup){
//			if(pageCount==1)
//				first = last;
//			else
//				first = (pageCount*(currentPageGroup-1)) + 1;
//		}
		
		int next = last+1;	// >
		int prev = first-1; // <
		
//		System.out.println("first = " + first);
//		System.out.println("last = " + last);
//		System.out.println("next = " + next);
//		System.out.println("prev = " + prev);
		
		StringBuilder sb = new StringBuilder();
		
		if(prev > 0){
			sb.append("<li><a href='boardList2?pageNo=" + 
	    						prev + 
	    					"' aria-label='Previous' <span aria-hidden='true'>&laquo;</span></a></li>");
		}
		
		for(int i=first; i<=last; i++){
			
			if(i==currentPage)
				sb.append("<li class='active'> <a href='boardList2?pageNo=" + i + "'>" + i + "</a></li>");
			else
				sb.append("<li><a href='boardList2?pageNo=" + i + "'>" + i + "</a></li>");
		}
		
		if(last < totalPage){
			sb.append("<li><a href='boardList2?pageNo=" + 
					next + 
				"' aria-label='Next' <span aria-hidden='true'>&raquo;</span></a></li>");
		}
		
		return sb.toString();
	}
}
