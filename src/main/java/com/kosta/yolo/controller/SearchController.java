package com.kosta.yolo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.yolo.service.TripSearchService;
import com.kosta.yolo.vo.TripInfoVO;

@Controller
public class SearchController {
	
	@Autowired
	private TripSearchService infoSearchService;
	
	@RequestMapping("/search_list")
	public ModelAndView search_list(TripInfoVO vo, Model model){
		System.out.println("여긴 컨트롤러!!! "+vo);
		ModelAndView mav =new ModelAndView();
		mav.addObject("list", infoSearchService.search_list(vo));
		mav.setViewName("trip_search/search_list");
		return mav;
	}
	
}
