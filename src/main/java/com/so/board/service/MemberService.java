package com.so.board.service;

import com.so.board.vo.Member;

public interface MemberService {

	public Member login(String member_id, String member_password);
	
	public void joinMember(Member member);
}
