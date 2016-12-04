package com.kosta.yolo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.yolo.service.ScheduleService;
import com.kosta.yolo.vo.TripPlanVO;

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
	//마이플랜 상세보기
	@RequestMapping("/myplanDeteil") 
	public ModelAndView planDetail(HttpServletRequest request, HttpServletResponse response, @RequestParam String plan_no) throws Exception{
		 ModelAndView mav = scheduleservice.planInfo(request,response, plan_no);
		 mav.setViewName("myplan/myplanDeteil");
		 return mav;
 	}
	
	//수정폼
	@RequestMapping(value="/planUpdate", method=RequestMethod.GET)
	public ModelAndView planUpdate(HttpServletRequest request, HttpServletResponse response, @RequestParam String plan_no) throws Exception{
		ModelAndView mav = scheduleservice.planInfo(request,response, plan_no);
		mav.setViewName("myplan/myplanUpdate");
		return mav;
	}
	//수정완료
	@RequestMapping("/planUpdatePro")
	public String planUpdatePro(TripPlanVO vo, HttpServletRequest request) {
		String plan_no = String.valueOf(request.getParameter("plan_no")); //파라미터값으로 주소에 던져주기위해 받아옴
		scheduleservice.planUpdate(vo);
		return "redirect:myplanDeteil?plan_no="+plan_no; //다시 보낼땐 redirect사용
	}

	//삭제
	@RequestMapping("/planDelete")
	public String planDelete(TripPlanVO vo) { 
		scheduleservice.planDelete(vo);
		return "redirect:yoloplanner";
	}

}// class end