package com.kosta.yolo.service;

import java.io.InputStreamReader;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.json.simple.parser.JSONParser;
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
	public ModelAndView detail_view(HttpServletRequest request, String trip_id) throws Exception {
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
		//댓글수
		int count = infoDAO.reviewCount(trip_id);
		
		//상세보기리스트
		ArrayList<TripInfoVO> detail = infoDAO.selectDetail(trip_id);
		//리뷰리스트
		ArrayList<TripInfoVO> review = infoDAO.inforeview(trip_id);

		mav.addObject("detailList", detail);
		mav.addObject("count", count);
		mav.addObject("reviewList", review);
		
		
		//-----------------------------------------------날씨 부분-------------------------------------------------
		// 오늘날짜 가져오기 
		Date date = new Date();
		//캘린더객체이용
		Calendar cal = Calendar.getInstance();
		//원하는 날짜타입 지정
		SimpleDateFormat sdf2 = new SimpleDateFormat("MM / dd");
		//원하는 포맷으로 오늘날짜 담기
		String currentDate = sdf2.format(date);
		
		//날짜를 담을 list타입의 변수 생성
		List dList = new ArrayList();	
		//현재 날짜 담기
		dList.add(currentDate);
		//현재부터 +6일 날짜 담기
		for (int i = 0; i < 6; i++ ) {
			for (int j=1;j<2;j++) {
				cal.add(Calendar.DATE, j);
				String today = sdf2.format(cal.getTime());
				
				dList.add(today);
			}
		}
	
		//날씨 api
		String x=Double.toString(detail.get(0).getPos_x()); //위도
		String y=Double.toString(detail.get(0).getPos_y()); //경도
		
		//위치에따른 정보가있는 json주소값
		URL url = new URL("http://api.openweathermap.org/data/2.5/forecast/daily?&APPID=7a9e4cfcb74be8bf1f5a726a03e4d451&lat="+x+"&lon="+y+"&mode=json&cnt=7");
		System.out.println(url);
		
		// 한글 처리를 위해 InputStreamReader를 UTF-8 인코딩으로 감싼다.
		InputStreamReader isr = new InputStreamReader(url.openConnection().getInputStream(), "UTF-8");
		// JSON을 Parsing 한다. 문법오류가 날 경우 Exception 발생, without Exception -> parse 메소드
		JSONObject object = (JSONObject)JSONValue.parseWithException(isr);
		Object obj = null;
		JSONParser parser = new JSONParser();
	    // list 배열
	    JSONArray bodyArray = (JSONArray)(object.get("list"));
		Iterator<String> Iterator = bodyArray.iterator();
		
		//뽑은날씨 아이콘을 담을 배열
		List wList = new ArrayList<>();
		
		while(Iterator.hasNext()){         
		    Object lObj = Iterator.next();
		    
		    JSONObject list = (JSONObject) lObj;
		    obj =  parser.parse(list.get("weather").toString());
		    JSONArray wArray = (JSONArray)obj;
		    
		    for(int i=0;i<wArray.size();i++){
		     JSONObject weather = (JSONObject)wArray.get(i); // Exception happens here.
		     String icon = (String) weather.get("icon");
		     wList.add(icon);
		    }
		}
		
		//뽑은 오늘 온도를 담을 배열
		List tList = new ArrayList<>();
		for(int i = 0 ; i < bodyArray.size(); i++) {
			JSONObject list = (JSONObject) bodyArray.get(i);        
			JSONObject tObject=(JSONObject) list.get("temp");
			//JSONObject wObject=(JSONObject) list.get("weather");
		
			//뽑은 day 저장
			String day = (tObject.get("day")).toString();
			//켈빈->썹씨 변형과정
			Double dayc = Double.parseDouble(day)-279.15;
			
			//int타입으로 변형 (썹씨)
			int dayC = Integer.parseInt(String.valueOf(Math.round(dayc)));
			
			tList.add(dayC);
		}
		
		System.out.println(dList);
		System.out.println(wList);
		System.out.println(tList);
		//오늘날짜 list
		mav.addObject("today", dList.get(0));
		mav.addObject("today2", dList.get(1));
		mav.addObject("today3", dList.get(2));
		mav.addObject("today4", dList.get(3));
		mav.addObject("today5", dList.get(4));
		mav.addObject("today6", dList.get(5));
		mav.addObject("today7", dList.get(6));
		//오늘온도 list
		mav.addObject("day1", tList.get(0));
		mav.addObject("day2", tList.get(1));
		mav.addObject("day3", tList.get(2));
		mav.addObject("day4", tList.get(3));
		mav.addObject("day5", tList.get(4));
		mav.addObject("day6", tList.get(5));
		mav.addObject("day7", tList.get(6));
		//날씨 아이콘list
		mav.addObject("icon1", wList.get(0));
		mav.addObject("icon2", wList.get(1));
		mav.addObject("icon3", wList.get(2));
		mav.addObject("icon4", wList.get(3));
		mav.addObject("icon5", wList.get(4));
		mav.addObject("icon6", wList.get(5));
		mav.addObject("icon7", wList.get(6));
		
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
	
	//리뷰삭제!!
	public void deleteReview(HttpServletRequest request) {
		infoDAO.deleteReview(request.getParameter("review_no"));
	}
	
}