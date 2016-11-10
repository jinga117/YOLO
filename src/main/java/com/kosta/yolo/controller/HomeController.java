package com.kosta.yolo.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.yolo.service.TripInfoService;

@Controller
public class HomeController {
	
	@Autowired
	private TripInfoService infoService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "home";
	}
	
	@RequestMapping("/list")
	public ModelAndView list(){
		System.out.println("여긴 컨트롤러!!! ");
		ModelAndView mav = infoService.list();
		mav.setViewName("trip_Info/list");
		return mav;
	}
	@RequestMapping("/write")
	public String write(){
		
		return "trip_Info/write";
	}

	@RequestMapping(value="/writePro", method = RequestMethod.POST)
	public ModelAndView writePro(HttpServletRequest request){
		System.out.println("여긴 write 컨트롤러!!! ");
		ModelAndView mav = infoService.writePro(request);
		mav.setViewName("redirect:list");
		return mav;
	}
	
}
