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
}
