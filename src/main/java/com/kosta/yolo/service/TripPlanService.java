package com.kosta.yolo.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.yolo.dao.TripPlanDAO;
import com.kosta.yolo.vo.RecommandVO;
import com.kosta.yolo.vo.TripPlanVO;

@Service
public class TripPlanService {
   
   @Autowired
   private TripPlanDAO planDAO;
   
   //여행 일정
   public ArrayList<TripPlanVO> my_schedule(){
	ArrayList<TripPlanVO> list = planDAO.myschedule();
	  return list;
   }
   // 일정 짜기
   public ModelAndView tripPlan(TripPlanVO vo) {
      ModelAndView mav = new ModelAndView();
      planDAO.tripPlan(vo);
      return mav;
   }
   
   // 추천일정 전체 리스트
     public ModelAndView list_recommand(String re_num) {
        ModelAndView mav = new ModelAndView();
        ArrayList<RecommandVO> recommList = planDAO.RecommAll(re_num);
        mav.addObject("recommList", recommList);
        return mav;
     }
     
     // 추천일정 상세보기 리스트
     public ModelAndView detail_view_recommand(String re_onum) {
        ModelAndView mav = new ModelAndView();
        ArrayList<RecommandVO> recommList = planDAO.RecommOnum(re_onum);
        mav.addObject("recommList", recommList);
        return mav;
     }

	public TripPlanVO tripPlanView(TripPlanVO vo) {
	      return planDAO.tripPlanView(vo);
	}
   
}