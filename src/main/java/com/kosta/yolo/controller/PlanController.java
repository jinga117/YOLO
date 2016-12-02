package com.kosta.yolo.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.yolo.service.TripPlanService;
import com.kosta.yolo.vo.TripPlanVO;

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
   
   // 추천일정 전체보기 리스트
   @RequestMapping("/list_recommand")
   public ModelAndView list_recommand(@RequestParam String re_num) {
      ModelAndView mav = planService.list_recommand(re_num); // re_num LIKE 로 "re"만 가져와  메인 데이터를 가져오기위함
      mav.setViewName("myplan/list_recommand");
      return mav;
   }
   
   // 추천일정 상세보기 리스트
   @RequestMapping(value = "/detail_view_recommand", method = RequestMethod.GET)
   public ModelAndView RecommOnum(@RequestParam String re_onum) throws Exception {
      ModelAndView mav = planService.detail_view_recommand(re_onum); // get방식으로 re_num값을 re_onum에 가져옴
      mav.setViewName("myplan/detail_view_recommand");
      return mav;
   }    // re_num 과 re_onum의 차이는 re_num은 전체리스트에 메인 값을 뿌려주기 위함
      // re_onum 은 전체리스트에서 메인값 클릭시 상세보기에서 대표와 일치하는 값을 가져오기 위함
}