package com.kosta.yolo.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.yolo.dao.MypageDAO;
import com.kosta.yolo.vo.TripInfoVO;
import com.kosta.yolo.vo.UserReviewVO;


@Service
public class MypageService {

   @Autowired
   private MypageDAO mypageDAO;

   public int s_login(String user_id) {/////////////////계정설정
      int result;
      if (user_id != null) {   // 로그인시 
         result = 1;
         return result;
      } else {
         result = 0;
         return result;
      }

   }
   
   //마이페이지에서 내가 쓴 리뷰
   public ArrayList<UserReviewVO> review_my(String user_id){
      ModelAndView mav = new ModelAndView();
      ArrayList<UserReviewVO> list = mypageDAO.reviewMypage(user_id);
      
      return list;
      
   }

   //북마크 현황보기
   public ArrayList<TripInfoVO> bookmark_my(HttpServletRequest request){
      HttpSession session = request.getSession();
      String user_id = (String)session.getAttribute("user_id");//String user_id 안에 세션값저장.
      ArrayList<TripInfoVO> list = mypageDAO.bookmark_mypage(user_id);//매개변수로 user_id보내줌.(북마크테이블에서 아이디에맞는 정보가져오려구)
      return list;
      
   }
   //북마크 삭제하기.
   public void delete(TripInfoVO vo){
      String trip_id = vo.getTrip_id();
      mypageDAO.bookmark_delete(trip_id);
   }
   
	
	//리뷰 삭제하기
	public void review_delete(UserReviewVO vo){
		mypageDAO.review_delete(vo);
	}
}//class end