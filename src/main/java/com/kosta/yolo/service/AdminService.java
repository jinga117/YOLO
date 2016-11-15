package com.kosta.yolo.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.yolo.dao.AdminDAO;
import com.kosta.yolo.vo.TripInfoVO;

@Service
public class AdminService {
	
		@Autowired
		private AdminDAO adminDAO;
		
		//리스트
		public ModelAndView list(){
			
			ModelAndView mav = new ModelAndView();
			ArrayList<TripInfoVO> list = adminDAO.selectAll();
			System.out.println("여긴!! 서비스닷!!! " + list);
			mav.addObject("list", list);
			
			return mav;
		}
		
		//글쓰기
			public ModelAndView writePro(HttpServletRequest request){
				
				TripInfoVO vo = new TripInfoVO();
				
				//연령별 문자열 담기
				  String[] age = request.getParameterValues("age_id");
			       StringBuffer ages = new StringBuffer();
			        for(String s : age){
			        	ages.append(s).append(", ");
			        }
			    String age_id = ages.substring(0, ages.length()-2);

			    //인원별
			    String[] person = request.getParameterValues("person_id");
			       StringBuffer persons = new StringBuffer();
			        for(String s : person){
			        	persons.append(s).append(", ");
			        }
			   String person_id = persons.substring(0, persons.length()-2);
			   //계절별
			   String[] season = request.getParameterValues("season_id");
				 StringBuffer seasons = new StringBuffer();
				 for(String s : season){
					 seasons.append(s).append(", ");
				 }
				String season_id = seasons.substring(0, seasons.length()-2);	  
 
				vo.setAge_id(age_id);
				vo.setPerson_id(person_id);
				vo.setSeason_id(season_id);
				
				vo.setTrip_id(request.getParameter("trip_id"));
				vo.setCategory_id(request.getParameter("category_id"));
				vo.setTrip_nickname(request.getParameter("trip_nickname"));
				vo.setTrip_address(request.getParameter("trip_address"));
				vo.setKpop_id(request.getParameter("kpop_id"));
				vo.setTrip_add1(request.getParameter("trip_add1"));
				vo.setTrip_add2(request.getParameter("trip_add2"));
				vo.setTrip_add3(request.getParameter("trip_add3"));
				vo.setTrip_image(request.getParameter("trip_image"));
				vo.setTrip_content(request.getParameter("trip_content"));
				vo.setTrip_time(request.getParameter("trip_time"));
				vo.setTrip_site(request.getParameter("trip_site"));
				vo.setTrip_tel(request.getParameter("trip_tel"));
				vo.setTrip_way(request.getParameter("trip_way"));
				vo.setTrip_pay(request.getParameter("trip_pay"));
				vo.setTrip_like(Integer.parseInt(request.getParameter("trip_like")));
				vo.setTrip_view(Integer.parseInt(request.getParameter("trip_view")));
				vo.setTrip_video(request.getParameter("trip_video"));
				
				ModelAndView mav = new ModelAndView();
				adminDAO.infoInsert(vo);
				return mav;
			}
			
			//상세보기
			public ModelAndView info(String trip_category_id){
				System.out.println("여긴!! info 서비스닷!!! ");
				ModelAndView mav = new ModelAndView();
				ArrayList<TripInfoVO> list = adminDAO.selectInfo(trip_category_id);
				mav.addObject("vo", list);

				return mav;
			}
			//정보삭제
			public ModelAndView delete(String trip_id){
				
				ModelAndView mav = new ModelAndView();
				adminDAO.deletePro(trip_id);
				
				return mav;
			}

}
