package com.kosta.yolo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.yolo.service.ScheduleService;

@Controller
public class ScheduleController {

	@Autowired
	private ScheduleService scheduleservice;
	
	//마이플랜
	@RequestMapping("/yoloplanner") 
	public ModelAndView calen(HttpServletRequest request, HttpSession session) throws Exception {
		 ModelAndView mav = new ModelAndView();
		 
		 //로그인 권한주기
		 scheduleservice.calendar(request, session);
		 if (session.getAttribute("user_id")==null) {
		     mav.setViewName("myplan/planfail");
		  } else {         
		   mav.setViewName("myplan/yoloplanner");
		  }
		 return mav;
 	}
	
}// class end