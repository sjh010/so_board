package com.so.board.dao;

import com.so.board.vo.Member;

public interface MemberDAO {

	public Member getMemberInfo(String member_id, String member_password);

	public void insertMember(Member member);
}
