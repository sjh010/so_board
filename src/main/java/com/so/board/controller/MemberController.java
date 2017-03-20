package com.so.board.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.so.board.service.MemberService;
import com.so.board.vo.Member;

@Controller
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public String login(HttpServletRequest request, @RequestParam("member_id") String member_id,
													@RequestParam("member_password") String member_password){
		
		logger.info("===========Login=============");
		logger.info("member_id : " + member_id);
		logger.info("member_password : " +  member_password);
		
		Member member = memberService.login(member_id, member_password);
		
		if(member != null){
			request.getSession().setAttribute("member_id", member.getMember_id());
			request.getSession().setAttribute("member_name", member.getMember_name());
			
			return "success";
		}
		
		return "fail";
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	@ResponseBody
	public String logout(HttpServletRequest request){
		
		logger.info("===========Logout===============");
		
		request.getSession().invalidate();
		
		return "success";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	@ResponseBody
	public String join(@RequestParam("member")Member member){
		
		logger.info("===========member=============");
		logger.info(member.toString());
		
		 memberService.joinMember(member);
		 
		 return "success";
	}
	
	
	
}
