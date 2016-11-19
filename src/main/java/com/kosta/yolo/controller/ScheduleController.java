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

   @RequestMapping("/trip_schedule") //
   public String schedule_lo(HttpServletRequest request){
	   
	   HttpSession session = request.getSession();
	   String user_id = (String)session.getAttribute("user_id");
	   System.out.println("스케줄 클래스내부입니다."+user_id);
	   int result = scheduleservice.s_login(user_id);
	   
	   if(result==1){
		   
		   return "schedule/schedule_login";
	   }
	   else{
		   return "schedule/schedule_notlogin";
		   
	   }
   }
}//class end