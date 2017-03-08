package com.so.board.vo;

public class Member {

	private String member_id;
	private String member_password;
	private String member_name;
	private char member_admin;
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_password() {
		return member_password;
	}
	public void setMember_password(String member_password) {
		this.member_password = member_password;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public char getMember_admin() {
		return member_admin;
	}
	public void setMember_admin(char member_admin) {
		this.member_admin = member_admin;
	}
	
	@Override
	public String toString() {
		return "Member [member_id=" + member_id + ", member_password=" + member_password + ", member_name="
				+ member_name + ", member_admin=" + member_admin + "]";
	}
	
	
}
