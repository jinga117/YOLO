package com.kosta.yolo.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.yolo.service.TripInfoService;
import com.kosta.yolo.vo.TripInfoVO;

@Controller
public class InfoController {
	
	@Autowired
	private TripInfoService infoService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "index";
	}
	
	@RequestMapping("/list_attraction")
	public ModelAndView list_attraction(){
		System.out.println("여긴 컨트롤러!!! ");
		ModelAndView mav = infoService.list();
		//mav.setViewName("trip_Info/list");
		mav.setViewName("trip_Info/list_attraction");
		return mav;
	}
	
	@RequestMapping("/age/list")
	public ModelAndView selectAge() {
		ModelAndView mav = infoService.selectListAge();
		mav.setViewName("trip_Info/list_age");
		return mav;
	}

}
