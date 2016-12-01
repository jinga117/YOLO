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

	@RequestMapping("/trip_schedule") //
	public ModelAndView schedule_lo(HttpServletRequest request) {

		HttpSession session = request.getSession();
		String user_id = (String) session.getAttribute("user_id");
		System.out.println("스케줄 클래스내부입니다." + user_id);
		int result = scheduleservice.s_login(user_id);

		if (result == 1) {
			ModelAndView mav = scheduleservice.allList();
			mav.setViewName("schedule/schedule_login");
			return mav;
		} else {
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
	         System.out.println(1000000);
	         
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