package com.kosta.yolo.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.yolo.dao.TripPlanDAO;
import com.kosta.yolo.vo.RecommandVO;
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
	
	
	// list_recommand전체 리스트
	  public ModelAndView list_recommand(String re_num) {
	     ModelAndView mav = new ModelAndView();
	     ArrayList<RecommandVO> recommList = planDAO.RecommAll(re_num);
	     mav.addObject("recommList", recommList);
	     return mav;
	  }
	  // 추천 일정 상세페이지 전체 리스트
	  public ModelAndView detail_view_recommand(String re_onum) {
	     ModelAndView mav = new ModelAndView();
	     ArrayList<RecommandVO> recommList = planDAO.RecommOnum(re_onum); 
	     mav.addObject("recommList", recommList);
	     return mav;
	  }
	
}
