package com.kosta.yolo.controller;

import java.io.PrintWriter;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kosta.yolo.service.TripInfoService;

@Controller
public class InfoController {
	
	@Autowired
	private TripInfoService infoService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "index";
	}
	
	// 상세보기
	@RequestMapping(value="/detail_view", method=RequestMethod.GET)
	public ModelAndView selectDetail(HttpServletRequest request, @RequestParam String trip_id) {
		System.out.println("상세보기 trip_id : "+ trip_id);
		ModelAndView mav = infoService.detail_view(request, trip_id);
		infoService.view_Count(trip_id);
		mav.setViewName("trip_Info/detail_view");
		return mav;
	}
	
	@RequestMapping(value="/detail_view", method = RequestMethod.POST)
	public ModelAndView writeRe(HttpServletRequest request ){
		ModelAndView mav = infoService.writeRe(request);
		String trip_id = request.getParameter("trip_id");
		mav.setViewName("redirect:/detail_view?trip_id="+trip_id);
		return mav;
	}
	
	// 좋아요
	@RequestMapping("/like")
	public ModelAndView likeCount(HttpServletRequest request, 
	    HttpServletResponse response, @RequestParam String trip_id) throws Exception{ 
		System.out.println("좋아요 trip_id : "+ trip_id);
		int likeCount = infoService.likeCount(trip_id);
		System.out.println("좋아요 결과 : "+ likeCount);
		
		PrintWriter out = response.getWriter();
	    JSONObject obj = new JSONObject();

	    obj.put("result","ok");
	    obj.put("likeCount", likeCount);
	    out.print(obj);
	    out.flush();
	    out.close();    		
		
		return null;
	}
	
/*	//list_attraction전체 리스트
	@RequestMapping("/list_attraction")
	public ModelAndView list_attraction(){
		ModelAndView mav = infoService.list();
		mav.setViewName("trip_Info/list_attraction");
		return mav;
	}
	*/
	//list_restaurant전체 리스트
	@RequestMapping("/list_restaurant")
	public ModelAndView list_restaurant(){
		ModelAndView mav = infoService.list_restaurant();
		mav.setViewName("trip_Info/list_restaurant");
		return mav;
	}
	
	//list_shopping전체 리스트
	@RequestMapping("/list_shopping")
	public ModelAndView list_shopping(@RequestParam String category_id){
		ModelAndView mav = infoService.list_shopping(category_id);
		mav.setViewName("trip_Info/list_shopping");
		return mav;
	}
	
	//list_attraction전체 리스트
	@RequestMapping("/list_attraction")
	public ModelAndView list_travel(@RequestParam String category_id){
		ModelAndView mav = infoService.list_shopping(category_id);
		mav.setViewName("trip_Info/list_attraction");
		return mav;
	}


	// 연령별 
	@RequestMapping("/list_age")
	public ModelAndView age() {
		ModelAndView mav = infoService.age();
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
	
	//인원별ALL 리스트
	@RequestMapping("/list_person")
	public ModelAndView person() {
		ModelAndView mav = infoService.person();
		mav.setViewName("trip_Info/list_person");
		return mav;
	}
	
	//age_id별 리스트
	@RequestMapping("/list_age_search")
	public ModelAndView selectAge(@RequestParam String age_id) {
		ModelAndView mav = infoService.ageId(age_id);
		mav.setViewName("trip_Info/list_age_search");
		return mav;
	}

	//season_id별 리스트
	@RequestMapping("/list_theme_search")
		public ModelAndView selectSeason(@RequestParam String season_id) {
			ModelAndView mav = infoService.seasonId(season_id);
			mav.setViewName("trip_Info/list_theme_search");
			return mav;
		}
	//kpop_id별 리스트
		@RequestMapping("/list_kpop_search")
			public ModelAndView selectKpop(@RequestParam String kpop_id) {
				ModelAndView mav = infoService.kpopId(kpop_id);
				mav.setViewName("trip_Info/list_kpop_search");
				return mav;
		}

		//person_id 키값별 리스트
		@RequestMapping("/list_person_search")
		public ModelAndView selectPerson(@RequestParam String person_id) {
			ModelAndView mav = infoService.personId(person_id);
			mav.setViewName("trip_Info/list_person_search");
			return mav;
		}
		
		//food_id별 리스트
		@RequestMapping("/list_restaurant_search")
			public ModelAndView selectFood(@RequestParam String food_id) {
				ModelAndView mav = infoService.foodId(food_id);
				mav.setViewName("trip_Info/list_restaurant_search");
				return mav;
			}

}
