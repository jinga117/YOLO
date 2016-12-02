package com.kosta.yolo.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.yolo.service.TripPlanService;
import com.kosta.yolo.vo.TripPlanVO;
import com.kosta.yolo.vo.UserVO;

@Controller
public class PlanController {
	
	@Autowired
	private TripPlanService planService;
	
	// 일정짜기
	@RequestMapping(value = "/tripPlan", method = RequestMethod.POST)
	public ModelAndView writeTripPlan(HttpServletRequest request, HttpServletResponse response,  TripPlanVO vo) throws IOException {
		planService.tripPlan(vo);
		PrintWriter out = response.getWriter();
	    JSONObject obj = new JSONObject();
		obj.put("result", "ok");
	    out.print(obj);
	    out.flush();
	    out.close();    		

	    return null;
	}
	

	// 추천일정 상세보기
   @RequestMapping(value = "/detail_view_recommand", method = RequestMethod.GET)
   public ModelAndView RecommOnum(@RequestParam String trip_id, @RequestParam String re_onum) throws Exception {
      ModelAndView mav = planService.detail_view_recommand(re_onum);
      mav.setViewName("myplan/detail_view_recommand");
      return mav;
   }
   
   // 추천 전체 리스트
   @RequestMapping("/list_recommand")
   public ModelAndView list_recommand(@RequestParam String re_num) {
      ModelAndView mav = planService.list_recommand(re_num);
      mav.setViewName("myplan/list_recommand");
      return mav;
   }
}
