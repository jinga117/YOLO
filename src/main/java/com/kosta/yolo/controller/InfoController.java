package com.kosta.yolo.controller;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.yolo.service.TripInfoService;

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
		mav.setViewName("trip_Info/list_attraction");
		return mav;
	}
	
	//Top5 인기순위
	@RequestMapping("/list_age_all")
	public ModelAndView age_view() {
		ModelAndView mav = infoService.age_view();
		mav.setViewName("trip_Info/list_age_all");
		return mav;
	}
	//연령별 리스트
	@RequestMapping("/list_age")
	public ModelAndView selectAge(@RequestParam String age_id) {
		ModelAndView mav = infoService.selectListAge(age_id);
		mav.setViewName("trip_Info/list_age");
		return mav;
	}
	//테마별 리스트
	@RequestMapping("/list_theme")
	public ModelAndView theme() {
		ModelAndView mav = infoService.theme();
		mav.setViewName("trip_Info/list_theme");
		return mav;
	}
}
