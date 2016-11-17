package com.kosta.yolo.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.yolo.dao.TripSearchDAO;
import com.kosta.yolo.vo.TripInfoVO;

@Service
public class TripSearchService {
	
	@Autowired
	private TripSearchDAO infoSearchDAO;
	
	//리스트
	public ArrayList<TripInfoVO> search_list(TripInfoVO vo){
		ModelAndView mav = new ModelAndView();
		
		return infoSearchDAO.selectInfoAll(vo);
		
		
	}
	
}
