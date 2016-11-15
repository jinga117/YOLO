package com.kosta.yolo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kosta.yolo.service.TripInfoService;
import com.kosta.yolo.service.UserService;
import com.kosta.yolo.vo.UserVO;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	

	@RequestMapping("/userWrite_view") // 회원가입 페이지로 이동
	public String write_view(Model model) {
		System.out.println("write_view() method");
		return "userWrite/user_write"; // /WEB-INF/views/write_view.jsp
	} // write_view() end

	@RequestMapping("/userWrite")
	public String write(UserVO uservo) {//	, Model model

		System.out.println("여기까지.");
		userService.insert(uservo);
		
		return "redirect:list";
	}	
	
	

	   @RequestMapping("/loginPro")//로그인
	   public String loginPro(HttpServletRequest request ) {
	   
	      int result = userService.login(request);
	      if(result==1){      
	         return "login/loginPro";
	      }
	      else{
	         return "login/loginfail";
	      }
	   }

}//class end
