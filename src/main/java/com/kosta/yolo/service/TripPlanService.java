package com.kosta.yolo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.yolo.dao.TripPlanDAO;
import com.kosta.yolo.vo.TripInfoVO;
import com.kosta.yolo.vo.TripPlanVO;

@Service
public class TripPlanService {
	
	@Autowired
	private TripPlanDAO planDAO;
	
	// 일정짜기
	public ModelAndView tripPlan(TripPlanVO vo) {
		ModelAndView mav = new ModelAndView();
		planDAO.tripPlan(vo);
		return mav;
	}
}
