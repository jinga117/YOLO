package com.kosta.yolo.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.yolo.service.TripInfoService;
import com.kosta.yolo.service.UserService;
import com.kosta.yolo.vo.UserReviewVO;
import com.kosta.yolo.vo.UserVO;

@Controller
public class InfoController {

	@Autowired
	private TripInfoService infoService;

	@Autowired
	private UserService userService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "index";
	}
	
	// 상세보기
	@RequestMapping(value = "/detail_view", method = RequestMethod.GET)
	public ModelAndView selectDetail(HttpServletRequest request, @RequestParam String trip_id) throws Exception {
		HttpSession session = request.getSession();
		String user_id = (String) session.getAttribute("user_id");
		UserVO vo = userService.userSelect(user_id);
		ModelAndView mav = infoService.detail_view(request, trip_id);
		infoService.view_Count(trip_id); // 조회수

		// admin 널 값일 때 에러페이지가 뜨는데 vo 객체에 if문으로 유무 확인 후 isadmin 처리
		if (vo != null) {
			mav.addObject("isadmin", vo.getIsadmin());
		}

		mav.setViewName("trip_Info/detail_view");
		return mav;
	}

	// 리뷰 쓰기 Ajax
	@RequestMapping(value = "/writeReview", produces = "application/text; charset=utf8")
	public ModelAndView writeRe(HttpServletRequest request, HttpServletResponse response, @RequestParam String trip_id,
			@RequestParam String user_id) throws Exception {
		ArrayList<UserReviewVO> writeRe = infoService.writeRe(request);

		String json = "{\"review_no\":\"" + writeRe.get(0).getReview_no() + "\",\"user_id\":\""
				+ writeRe.get(0).getUser_id() + "\",\"trip_id\":\"" + writeRe.get(0).getTrip_id()
				+ "\",\"review_time\":\"" + writeRe.get(0).getReview_time() + "\",\"review_content\":\""
				+ writeRe.get(0).getReview_content() + "\"}";
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().print(json);
		return null;
	}

	// 리뷰 삭제 Ajax
	@RequestMapping(value = "/deleteReview")
	public ModelAndView deleteReview(HttpServletRequest request, HttpServletResponse response) throws Exception {
		infoService.deleteReview(request);

		String json = "{\"result\":\"" + "ok\"}";
		response.getWriter().print(json);
		return null;
	}

	// 좋아요
	@RequestMapping("/like")
	public ModelAndView likeCount(HttpServletRequest request, HttpServletResponse response,
			@RequestParam String trip_id) throws Exception {
		int likeCount = infoService.likeCount(trip_id);

		PrintWriter out = response.getWriter();
		JSONObject obj = new JSONObject();

		obj.put("result", "ok");
		obj.put("likeCount", likeCount);
		out.print(obj);
		out.flush();
		out.close();

		return null;
	}

	// list_restaurant전체 리스트
	@RequestMapping("/list_restaurant")
	public ModelAndView list_restaurant() {
		ModelAndView mav = infoService.list_restaurant();
		mav.setViewName("trip_Info/list_restaurant");
		return mav;
	}

	// list_shopping전체 리스트
	@RequestMapping("/list_shopping")
	public ModelAndView list_shopping(@RequestParam String category_id) {
		ModelAndView mav = infoService.list_shopping(category_id);
		mav.setViewName("trip_Info/list_shopping");
		return mav;
	}

	// list_attraction전체 리스트
	@RequestMapping("/list_attraction")
	public ModelAndView list_travel(@RequestParam String category_id) {
		ModelAndView mav = infoService.list_shopping(category_id);
		mav.setViewName("trip_Info/list_attraction");
		return mav;
	}

	// 연령별 리스트
	@RequestMapping("/list_age")
	public ModelAndView age() {
		ModelAndView mav = infoService.age();
		mav.setViewName("trip_Info/list_age");
		return mav;
	}

	// 테마별 리스트
	@RequestMapping("/list_theme")
	public ModelAndView theme() {
		ModelAndView mav = infoService.theme();
		mav.setViewName("trip_Info/list_theme");
		return mav;
	}

	// 인원별 전체 리스트
	@RequestMapping("/list_person")
	public ModelAndView person() {
		ModelAndView mav = infoService.person();
		mav.setViewName("trip_Info/list_person");
		return mav;
	}

	// age_id별 리스트
	@RequestMapping("/list_age_search")
	public ModelAndView selectAge(@RequestParam String age_id) {
		ModelAndView mav = infoService.ageId(age_id);
		mav.setViewName("trip_Info/list_age_search");
		return mav;
	}

	// season_id별 리스트
	@RequestMapping("/list_theme_search")
	public ModelAndView selectSeason(@RequestParam String season_id) {
		ModelAndView mav = infoService.seasonId(season_id);
		mav.setViewName("trip_Info/list_theme_search");
		return mav;
	}

	// kpop_id별 리스트
	@RequestMapping("/list_kpop_search")
	public ModelAndView selectKpop(@RequestParam String kpop_id) {
		ModelAndView mav = infoService.kpopId(kpop_id);
		mav.setViewName("trip_Info/list_kpop_search");
		return mav;
	}

	// person_id 키값별 리스트
	@RequestMapping("/list_person_search")
	public ModelAndView selectPerson(@RequestParam String person_id) {
		ModelAndView mav = infoService.personId(person_id);
		mav.setViewName("trip_Info/list_person_search");
		return mav;
	}

	// food_id별 리스트
	@RequestMapping("/list_restaurant_search")
	public ModelAndView selectFood(@RequestParam String food_id) {
		ModelAndView mav = infoService.foodId(food_id);
		mav.setViewName("trip_Info/list_restaurant_search");
		return mav;
	}


	//이용안내
	@RequestMapping("/how_to_use")
	public String How_to_use(){
		return "how_to_use/use";
		
	}
}

