package com.kosta.yolo.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.yolo.dao.AdminDAO;
import com.kosta.yolo.vo.TripInfoVO;
import com.kosta.yolo.vo.UserReviewVO;

@Service
public class AdminService {
	
		@Autowired
		private AdminDAO adminDAO;
		
		//리스트
		public ModelAndView list(){
			ModelAndView mav = new ModelAndView();
			ArrayList<TripInfoVO> list = adminDAO.selectAll();
			mav.addObject("list", list);
			return mav;
		}
		
		// 여행지 추가
		public ModelAndView writePro(HttpServletRequest request){
			TripInfoVO vo = new TripInfoVO();
				
			//연령별 문자열 담기
			String age_id = request.getParameter("age_id");
			if(age_id != "" && age_id != null){
				String[] age = request.getParameterValues("age_id");
			    StringBuffer ages = new StringBuffer();
			       
			    for(String s : age){
			        ages.append(s).append(", ");
			    }
			        age_id = ages.substring(0, ages.length()-2);
			}
			
			//인원별
			String person_id = request.getParameter("person_id");
			if(person_id != "" && person_id != null){
			    String[] person = request.getParameterValues("person_id");
			    StringBuffer persons = new StringBuffer();
			    
			    for(String s : person){
			        persons.append(s).append(", ");
			    }
			    person_id = persons.substring(0, persons.length()-2);
			}
				
			//계절별
			String season_id = request.getParameter("season_id");
			if(season_id != "" && season_id != null){
			   String[] season = request.getParameterValues("season_id");
			   StringBuffer seasons = new StringBuffer();
			   
			   for(String s : season){
				   seasons.append(s).append(", ");
			   }
			   season_id = seasons.substring(0, seasons.length()-2);
			}
				
			//레스토랑 카테고리별
			String food_id = request.getParameter("food_id");
			if(food_id != "" && food_id != null){
				String[] food = request.getParameterValues("food_id");
				StringBuffer foods = new StringBuffer();
				
				for(String s : food){
					foods.append(s).append(", ");
				}
				food_id = foods.substring(0, foods.length()-2);	  
			}
			
			vo.setAge_id(age_id);
			vo.setPerson_id(person_id);
			vo.setSeason_id(season_id);
			vo.setFood_id(food_id);
			vo.setTrip_id(request.getParameter("trip_id"));
			vo.setCategory_id(request.getParameter("category_id"));
			vo.setKpop_id(request.getParameter("kpop_id"));
			vo.setTrip_nickname(request.getParameter("trip_nickname"));
			vo.setTrip_address(request.getParameter("trip_address"));
			vo.setTrip_add1(request.getParameter("trip_add1"));
			vo.setTrip_add2(request.getParameter("trip_add2"));
			vo.setTrip_add3(request.getParameter("trip_add3"));
			vo.setTrip_content(request.getParameter("trip_content"));
			vo.setTrip_time(request.getParameter("trip_time"));
			vo.setTrip_site(request.getParameter("trip_site"));
			vo.setTrip_tel(request.getParameter("trip_tel"));
			vo.setTrip_way(request.getParameter("trip_way"));
			vo.setTrip_pay(request.getParameter("trip_pay"));
			vo.setPos_x(Double.parseDouble(request.getParameter("pos_x")));
			vo.setPos_y(Double.parseDouble(request.getParameter("pos_y")));
			
			ModelAndView mav = new ModelAndView();
			adminDAO.infoInsert(vo);
			return mav;
		}
			
		// 상세보기
		public ModelAndView info(String trip_category_id){
			ModelAndView mav = new ModelAndView();
			ArrayList<TripInfoVO> list = adminDAO.selectInfo(trip_category_id);
			mav.addObject("vo", list);
			return mav;
		}
		
		// info
		public ArrayList<TripInfoVO> selectInfo(String trip_id) {
			return adminDAO.selectInfo(trip_id);
		}
		
		// 여행지 한 곳 보여주기
		public TripInfoVO selectTrip(String trip_id) {
			TripInfoVO vo = adminDAO.selectTrip(trip_id);
			return vo;
		}

		// 여행지 삭제
		public void deleteTrip(String trip_id) {
			adminDAO.deleteTrip(trip_id);
		}
		
		// 여행지 수정
		public ModelAndView updatePro(TripInfoVO vo) {
			ModelAndView mav = new ModelAndView();
			adminDAO.updateTrip(vo);
			return mav;
		}
		
	   // 전체 리뷰 보기
	   public ModelAndView reviewAll() {
	      ModelAndView mav = new ModelAndView();
	      ArrayList<UserReviewVO> list = adminDAO.reviewList();
	      mav.addObject("list", list);
	      return mav;
	   }
	   
	   // 리뷰 삭제
	   public void reviewDelete(int review_no){
		   adminDAO.reviewDelete(review_no);
	   }
}
