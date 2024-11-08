package kr.heartbeat.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.heartbeat.service.MemberServiceImpl;
import kr.heartbeat.vo.UserVO;

@Controller
public class HomeController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() { return "index"; }
	
	@Autowired // 스프링(스프링프레임워크)이 빈을 자동으로 주입한다. 
	private MemberServiceImpl memberService;
	
	@RequestMapping("/login")
	public String login() {
		return "/heartbeat/login";
	}
	
	
	
	
	
	@PostMapping(value = "/loginPro")
	public String loginPro(UserVO uservo,HttpSession session) {
		
		System.out.println("컨트롤러=========="+uservo.getEmail());
		UserVO dbuservo = memberService.login(uservo);
		String url = null;
		System.out.println(dbuservo);
		
		if (dbuservo != null) {
			session.setAttribute("UserVO", dbuservo);
			session.setAttribute("level", dbuservo.getLevel());
			url = "/heartbeat/chart";
		} else {
			url = "/heartbeat/login";
		}
		
		return url;
	}
	
	@RequestMapping(value = "/chart")
	public String chart() {
		return "/heartbeat/chart";
	}
	
	@RequestMapping(value = "/community")
	public String community() {
		return "/heartbeat/community";
	}
	
	
}



















