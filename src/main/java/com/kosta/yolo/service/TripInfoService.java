package com.kosta.yolo.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.yolo.dao.TripInfoDAO;
import com.kosta.yolo.vo.TripInfoVO;

@Service
public class TripInfoService {
	
	@Autowired
	private TripInfoDAO infoDAO;
	
	//리스트
	public ModelAndView list(){
		
		ModelAndView mav = new ModelAndView();
		ArrayList<TripInfoVO> list = infoDAO.selectInfoAll();
		System.out.println("여긴!! 서비스닷!!! " + list);
		mav.addObject("list", list);
		return mav;
	}
	
	public ModelAndView selectListAge(String age_id) {
		ModelAndView mav = new ModelAndView();
		ArrayList<TripInfoVO> avo = infoDAO.selectListAge(age_id);
		mav.addObject("ageList", avo);
		return mav;
	}
	
	
}
