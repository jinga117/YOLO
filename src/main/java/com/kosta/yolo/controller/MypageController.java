package com.kosta.yolo.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.yolo.service.MypageService;
import com.kosta.yolo.vo.TripInfoVO;
import com.kosta.yolo.vo.UserReviewVO;

@Controller
public class MypageController {

   @Autowired
   private MypageService mypageService;

   @RequestMapping("/my_page") //
   public String mypage(){
      
   return "mypage/mypage_main";
   } 
   
   @RequestMapping("review_delete") //내가쓴 리뷰 삭제
   public String review_delete(UserReviewVO vo){
	   mypageService.review_delete(vo);
	return "mypage/review_delete";
	
	   
   }
   @RequestMapping("/review_view")   //마이페이지에서 내가쓴댓글    미완료///이름앞에 띄어쓰기때문에 안먹히는현상, mypage뷰창에 뿌려줄것!~!~!~!~!~!~!~!~!~!~!~!~!
   public ModelAndView review_view(HttpServletRequest request){
      
      HttpSession session = request.getSession();
      String user_id = (String) session.getAttribute("user_id");
      ArrayList<UserReviewVO> list =mypageService.review_my(user_id);
      ModelAndView mav = new ModelAndView();
      if(list.size()==0){
         mav.setViewName("mypage/myreview_list_fail");
      }else{
         mav.addObject("list", list);
         mav.setViewName("mypage/myreview_list");
      }return mav;
   }
   
  
   @RequestMapping("/bookmark_view")   //마이페이지에서 본인이 북마크한 현황보기~
   public ModelAndView bookmark_view(HttpServletRequest request){
      ArrayList<TripInfoVO> list = mypageService.bookmark_my(request);
      ModelAndView mav = new ModelAndView();
      System.out.println("컨트롤러"+list.size());
      if(list.size()==0){   //북마크한게 없을때!
         mav.setViewName("mypage/bookmark_fail");
      }else{

      /*   System.out.println("리스트갯수"+list.size());
         System.out.println(list.get(0).getTrip_id()+list.get(0).getTrip_content());
      */   mav.addObject("bookmarklist", list);
         mav.setViewName("mypage/bookmark_suc");   
      }

      return mav;
      }

   @RequestMapping("bookmark_delete")   //마이페이지에서 북마크삭제
   public String deleteRe(TripInfoVO vo){
      System.out.println(vo.getTrip_id());
      mypageService.delete(vo);
      
       return "mypage/bookmark_delete";
      }   
}//class end