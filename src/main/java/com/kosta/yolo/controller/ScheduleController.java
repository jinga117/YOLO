package com.kosta.yolo.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.yolo.service.ScheduleService;
import com.kosta.yolo.vo.TripPlanVO;

@Controller
public class ScheduleController {

	@Autowired
	private ScheduleService scheduleservice;

	@RequestMapping("/trip_schedule") //비로그인때 yoloplan 클릭  /     로그인중에 yoloplan클릭. 약간수정해야될듯.(바텀yoloplan클릭시!)

	public ModelAndView schedule_lo(HttpServletRequest request) {

		HttpSession session = request.getSession();
		String user_id = (String) session.getAttribute("user_id");//String user_id 안에 세션값저장.
		int result = scheduleservice.s_login(user_id);//로그인시 리턴1  / 비로그인시 리턴0

		if (result == 1) {//로그인 되있을시.
			ModelAndView mav = scheduleservice.allList();
			mav.setViewName("schedule/schedule_login");
			return mav;
		} else {// 비로그인시.
			ModelAndView mav = new ModelAndView();
			mav.setViewName("schedule/schedule_notlogin");
			return mav;
		}
	}

	 @RequestMapping("/yoloplan")
	   public ModelAndView plan(HttpSession session) {
	      ModelAndView mav = scheduleservice.calendar(session);
	      if (session.getAttribute("user_id")==null) {
	         mav.setViewName("myplan/planfail");
	         System.out.println(11);
	         return mav;
	      } else {         
	         mav.setViewName("myplan/yoloplaner");
	         //mav.setViewName("");
	      }
	         return mav;
	      }
	
	@RequestMapping("/yoloplaner") 
	public ModelAndView calend(HttpServletRequest request) throws Exception {

		 ModelAndView mav = new ModelAndView();
		 scheduleservice.calen(request);
		 mav.setViewName("myplan/yoloplaner"); 
		 return mav;
 	}
}// class end