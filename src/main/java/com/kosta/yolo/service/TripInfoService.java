package com.kosta.yolo.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.yolo.dao.TripInfoDAO;
import com.kosta.yolo.vo.TripInfoVO;
import com.kosta.yolo.vo.UserReviewVO;

@Service
public class TripInfoService {
	
	@Autowired
	private TripInfoDAO infoDAO;
	
	// 상세보기
	public ModelAndView detail_view(HttpServletRequest request, String trip_id) {
		ModelAndView mav = new ModelAndView();
		
		//로그인 되었을 때 세션에 저장된 user_id 가져오기
		HttpSession session = request.getSession(false);
		String user = (String) session.getAttribute("user_id");
		if(user == null){
			mav.addObject("user", user);
					
		}else{ //로그인 되어있을시
			mav.addObject("user", user);
			mav.addObject("trip_id", trip_id);
		}
		int count = infoDAO.reviewCount(trip_id);
		ArrayList<TripInfoVO> detail = infoDAO.selectDetail(trip_id);
		ArrayList<TripInfoVO> review = infoDAO.inforeview(trip_id);
		mav.addObject("detailList", detail);
		mav.addObject("count", count);
		mav.addObject("reviewList", review);
		
		return mav;
	}
	
	//리뷰 쓰기
	 public ArrayList<UserReviewVO> writeRe(HttpServletRequest request){
		UserReviewVO vo = new UserReviewVO();
		
		vo.setUser_id(request.getParameter("user_id"));
		vo.setTrip_id(request.getParameter("trip_id"));
		vo.setReview_content(request.getParameter("review_content"));
		
		infoDAO.writeReview(vo);		// 리뷰 쓰기
		infoDAO.reviewCount(vo.getTrip_id());		// 댓글수
		
		ArrayList<UserReviewVO> review = infoDAO.recentReview(vo.getTrip_id());
		return review;
	}
	
	// 조회수
	public int view_Count(String trip_id) {
		int count =  infoDAO.viewCount(trip_id);
		return count;
	}

	// 좋아요
	public int likeCount(String trip_id) {
		return infoDAO.likeCount(trip_id);
	}
	
	//전체리스트
	public ModelAndView list(){
		ModelAndView mav = new ModelAndView();
		ArrayList<TripInfoVO> list = infoDAO.InfoAll(); //연령별
		ArrayList<TripInfoVO> seasonList = infoDAO.seasonAll(); //계절별전체
		ArrayList<TripInfoVO> kpopList = infoDAO.kpopAll(); //한류별
		ArrayList<TripInfoVO> personList = infoDAO.personAll(); //인원별
		mav.addObject("list", list);
		mav.addObject("seasonList", seasonList);
		mav.addObject("kpopList", kpopList);
		mav.addObject("personList", personList);
		return mav;
	}
	
	//list_restaurant전체 리스트
	public ModelAndView list_restaurant(){
		ModelAndView mav = new ModelAndView();
		ArrayList<TripInfoVO> foodList = infoDAO.foodAll();
		ArrayList<TripInfoVO> foodTop = infoDAO.foodAllTop();
		mav.addObject("foodList", foodList);
		mav.addObject("foodTop", foodTop);
		return mav;
	}

	//list_shopping전체 리스트
	public ModelAndView list_shopping(String category_id){
		ModelAndView mav = new ModelAndView();
		ArrayList<TripInfoVO> shopList = infoDAO.categoryAll(category_id);
		ArrayList<TripInfoVO> shopTop = infoDAO.categoryTop(category_id);
		mav.addObject("cateList", shopList);
		mav.addObject("cateTop", shopTop);
		return mav;
	}
	
	//연령별 Top 리스트, 전체 리스트
	public ModelAndView age(){
		ModelAndView mav = new ModelAndView();
		ArrayList<TripInfoVO> topList = infoDAO.ageAllTop();
		ArrayList<TripInfoVO> allList = infoDAO.ageAll();
		mav.addObject("topList", topList);
		mav.addObject("allList", allList);
		return mav;
	}

	//테마별 Top 리스트,전체 리스트
	public ModelAndView theme(){
		ModelAndView mav = new ModelAndView();
		ArrayList<TripInfoVO> seasonTop = infoDAO.seasonAllTop();
		ArrayList<TripInfoVO> kpopTop = infoDAO.kpopAllTop();
		ArrayList<TripInfoVO> seasonList = infoDAO.seasonAll();
		ArrayList<TripInfoVO> kpopList = infoDAO.kpopAll();
		mav.addObject("seasonList", seasonList);
		mav.addObject("kpopList", kpopList);
		mav.addObject("seasonTop", seasonTop);
		mav.addObject("kpopTop", kpopTop);
		return mav;
	}
	
	//인원별Top 리스트
	public ModelAndView person() {
		ModelAndView mav = new ModelAndView();
		ArrayList<TripInfoVO> personTop = infoDAO.personAllTop();
		ArrayList<TripInfoVO> personList = infoDAO.personAll();
		mav.addObject("personTop", personTop);
		mav.addObject("personList", personList);
		return mav;
	}

	//age_id 키값에 따른 리스트
	public ModelAndView ageId(String age_id) {
		ModelAndView mav = new ModelAndView();
		ArrayList<TripInfoVO> avo = infoDAO.selectListAge(age_id);
		ArrayList<TripInfoVO> atop = infoDAO.ageTop(age_id);
		mav.addObject("age_id", age_id);
		mav.addObject("ageList", avo);
		mav.addObject("ageTop", atop);
		return mav;
	}
	
	//season_id 키값에 따른 리스트
	public ModelAndView seasonId(String season_id) {
		ModelAndView mav = new ModelAndView();
		ArrayList<TripInfoVO> svo = infoDAO.selectSeason(season_id);
		ArrayList<TripInfoVO> stop = infoDAO.seasonTop(season_id);
		mav.addObject("season_id", season_id);
		mav.addObject("seasonList", svo);
		mav.addObject("seasonTop", stop);
		return mav;
	}
	
	//kpop_id 키값에 따른 리스트
	public ModelAndView kpopId(String kpop_id) {
		ModelAndView mav = new ModelAndView();
		ArrayList<TripInfoVO> kvo = infoDAO.selectKpop(kpop_id);
		ArrayList<TripInfoVO> ktop = infoDAO.kpopTop(kpop_id);
		mav.addObject("kpop_id", kpop_id);
		mav.addObject("kpopList", kvo);
		mav.addObject("kpopTop", ktop);
		return mav;
	}

	//person_id 키값별 리스트
	public ModelAndView personId(String person_id) {
		ModelAndView mav = new ModelAndView();
		ArrayList<TripInfoVO> pvo = infoDAO.selectPerson(person_id);
		ArrayList<TripInfoVO> ptop = infoDAO.personTop(person_id);
		mav.addObject("person_id", person_id);
		mav.addObject("personList", pvo);
		mav.addObject("personTop", ptop);
		return mav;
	}
	
	//food_id 키값별 리스트
	public ModelAndView foodId(String food_id) {
		ModelAndView mav = new ModelAndView();
		ArrayList<TripInfoVO> fvo = infoDAO.selectFood(food_id);
		ArrayList<TripInfoVO> ftop = infoDAO.foodTop(food_id);
		mav.addObject("food_id", food_id);
		mav.addObject("foodList", fvo);
		mav.addObject("foodTop", ftop);
		return mav;
	}

	public void deleteReview(HttpServletRequest request) {
		infoDAO.deleteReview(request.getParameter("review_no"));
	}
	
}