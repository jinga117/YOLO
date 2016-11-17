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
	//list_attraction전체 리스트
	@RequestMapping("/list_attraction")
	public ModelAndView list_attraction(){
		ModelAndView mav = infoService.list();
		mav.setViewName("trip_Info/list_attraction");
		return mav;
	}
	
	//list_restaurant전체 리스트
	@RequestMapping("/list_restaurant")
	public ModelAndView list_restaurant(){
		ModelAndView mav = infoService.list_restaurant();
		mav.setViewName("trip_Info/list_restaurant");
		return mav;
	}
	
	//food_id별 리스트
	@RequestMapping("/list_restaurant_search")
		public ModelAndView selectFood(@RequestParam String food_id) {
			ModelAndView mav = infoService.selectFood(food_id);
			mav.setViewName("trip_Info/list_restaurant_search");
			return mav;
		}
	
	//list_shopping전체 리스트
	@RequestMapping("/list_shopping")
	public ModelAndView list_shopping(@RequestParam String category_id){
		ModelAndView mav = infoService.list_shopping(category_id);
		mav.setViewName("trip_Info/list_shopping");
		return mav;
	}

	// 연령별 Top5 인기순위
	@RequestMapping("/list_age")
	public ModelAndView age_view() {
		ModelAndView mav = infoService.age_view();
		mav.setViewName("trip_Info/list_age");
		return mav;
	}
	
	//age_id별 리스트
	@RequestMapping("/list_age_search")
	public ModelAndView selectAge(@RequestParam String age_id) {
		ModelAndView mav = infoService.selectListAge(age_id);
		mav.setViewName("trip_Info/list_age_search");
		return mav;
	}
	
	
	//테마별ALL 리스트
	@RequestMapping("/list_theme")
	public ModelAndView theme() {
		ModelAndView mav = infoService.theme();
		mav.setViewName("trip_Info/list_theme");
		return mav;
	}
	//season_id별 리스트
	@RequestMapping("/list_theme_search")
		public ModelAndView selectSeason(@RequestParam String season_id) {
			ModelAndView mav = infoService.selectListSeason(season_id);
			mav.setViewName("trip_Info/list_theme_search");
			return mav;
		}
	//kpop_id별 리스트
		@RequestMapping("/list_kpop_search")
			public ModelAndView selectKpop(@RequestParam String kpop_id) {
				ModelAndView mav = infoService.selectListKpop(kpop_id);
				mav.setViewName("trip_Info/list_kpop_search");
				return mav;
		}
		//인원별ALL 리스트
		@RequestMapping("/list_person")
		public ModelAndView person() {
			ModelAndView mav = infoService.person();
			mav.setViewName("trip_Info/list_person");
			return mav;
		}
		//person_id 키값별 리스트
		@RequestMapping("/list_person_search")
		public ModelAndView selectPerson(@RequestParam String person_id) {
			ModelAndView mav = infoService.selectListPerson(person_id);
			mav.setViewName("trip_Info/list_person_search");
			return mav;
		}

}
