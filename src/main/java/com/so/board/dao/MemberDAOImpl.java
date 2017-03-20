package com.so.board.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.so.board.vo.Member;

@Repository
public class MemberDAOImpl implements MemberDAO{

	@Autowired
	private SqlSession session;
	
	@Override
	public Member getMemberInfo(String member_id, String member_password) {
		
		HashMap<String, String> params = new HashMap<>();
		
		params.put("member_id", member_id);
		params.put("member_password", member_password);
		
		return session.selectOne("member.getMember", params);
	}

	@Override
	public void insertMember(Member member) {
		
		session.insert("member.insertMember", member);
	}

}
