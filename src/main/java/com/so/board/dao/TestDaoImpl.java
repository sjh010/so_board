package com.so.board.dao;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class TestDaoImpl implements TestDao{

	@Autowired
	private SqlSession query;
	
	@Override
	public String test() throws SQLException {
		return query.selectOne("query.test");
	}

}
