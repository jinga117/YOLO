package com.kosta.yolo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.yolo.service.TripSearchService;
import com.kosta.yolo.vo.TripInfoVO;

@Controller
public class SearchController {
	
	@Autowired
	private TripSearchService infoSearchService;
	
	@RequestMapping("/search_list")
	public ModelAndView search_list(TripInfoVO vo){
		ModelAndView mav =new ModelAndView();
		mav.addObject("list", infoSearchService.search_list(vo));
		mav.addObject("count", infoSearchService.search_listCount(vo));
		mav.setViewName("trip_search/search_list");
		return mav;
	}
	
	@RequestMapping("/searchAll_list")
	public ModelAndView searchAll_list(TripInfoVO vo){
		ModelAndView mav =new ModelAndView();
		mav.addObject("list", infoSearchService.searchAll_list(vo));
		mav.addObject("count", infoSearchService.searchAll_listCount(vo));
		mav.setViewName("trip_search/search_list");
		return mav;
	}
	
}
