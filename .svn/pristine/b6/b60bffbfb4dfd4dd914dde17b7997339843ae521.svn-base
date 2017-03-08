package com.so.board;


import java.sql.Connection;
import java.util.List;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.so.board.dao.BoardDAO;
import com.so.board.dao.TestDao;
import com.so.board.vo.Board;


@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring" + "/**/*-context.xml")
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/**/*-context.xml")

public class JDBCConnectionTest {

	private static final Logger logger = LoggerFactory.getLogger(JDBCConnectionTest.class);
	
	@Inject
	DataSource ds;
	
	@Inject
	SqlSession session;
	
	@Inject
	TestDao dao;
	
	@Inject
	BoardDAO boardDAO;
	
	@Test
	public void test() throws Exception{
		System.out.println("=========JUnit Test==========");
	
		List<Board> board = boardDAO.searchAll(0, 10);
		
		for(Board b : board){
			System.out.println(b.getBoard_no());
		}
		
	}
	
	@Test
	public void insertTest() throws Exception{
		Board board = new Board();
		
		board.setBoard_title("title");
		board.setBoard_content("content");
		board.setBoard_writer("writer");
		
		boardDAO.boardInsert(board);
	}
	
	@Test
	public void updateBoard() throws Exception{
		Board board = new Board();
		
		board.setBoard_no(16);
		board.setBoard_title("title update");
		board.setBoard_content("content update");
		board.setBoard_writer("writer");
		
		boardDAO.boardUpdate(board);
	}
	
	@Test
	public void deleteBoard() throws Exception{
		boardDAO.boardDelete(16);
	}

	
}