package com.kosta.yolo.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.yolo.infoMapper.TripInfoDAO;
import com.kosta.yolo.vo.TripInfoVO;

@Service
public class TripInfoService {
	
	@Autowired
	private TripInfoDAO infoDAO;
	
	//리스트
	public ModelAndView list(){
		
		ModelAndView mav = new ModelAndView();
		ArrayList<TripInfoVO> list = infoDAO.selectAll();
		System.out.println("여긴!! 서비스닷!!! " + list);
		mav.addObject("list", list);
		
		return mav;
	}
	//글쓰기
	public ModelAndView writePro(HttpServletRequest request){
		
		ModelAndView mav = new ModelAndView();
		
		TripInfoVO vo = new TripInfoVO();
		
		vo.setTrip_id(request.getParameter("trip_id"));
		vo.setTrip_category_id(request.getParameter("trip_category_id"));
		vo.setTrip_nickname(request.getParameter("trip_nickname"));
		vo.setTrip_address(request.getParameter("trip_address"));
		vo.setTrip_image(request.getParameter("trip_image"));
		vo.setTrip_content(request.getParameter("trip_content"));
		vo.setTrip_pay(request.getParameter("trip_pay"));
		vo.setTrip_time(request.getParameter("trip_time"));
		vo.setTrip_pay(request.getParameter("trip_pay"));
		
		infoDAO.infoInsert(vo);
		
		return mav;
	}
	
	
}
