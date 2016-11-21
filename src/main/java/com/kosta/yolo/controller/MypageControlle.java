package com.kosta.yolo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.yolo.service.MypageService;
import com.kosta.yolo.service.ScheduleService;

@Controller
public class MypageControlle {

   @Autowired
   private MypageService mypageService;

   @RequestMapping("/my_page") //
   public String mypage(){
	   
   return "mypage/mypage_main";
   }
}//class end