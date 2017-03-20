package com.so.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.so.board.dao.MemberDAO;
import com.so.board.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public Member login(String member_id, String member_password) {
		
		return memberDAO.getMemberInfo(member_id, member_password);
	}

	@Override
	public void joinMember(Member member) {
		
		memberDAO.insertMember(member);
	}

	
}
