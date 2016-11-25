package com.kosta.yolo.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.yolo.service.MypageService;
import com.kosta.yolo.service.ScheduleService;
import com.kosta.yolo.vo.TripInfoVO;

@Controller
public class MypageController {

   @Autowired
   private MypageService mypageService;

   @RequestMapping("/my_page") //
   public String mypage(){
	   
   return "mypage/mypage_main";
   } 
   @RequestMapping("/bookmark_view")	//마이페이지에서 본인이 북마크한 현황보기~
   public ModelAndView bookmark_view(HttpServletRequest request){
	   ArrayList<TripInfoVO> list = mypageService.bookmark_my(request);
		ModelAndView mav = new ModelAndView();
		System.out.println("컨트롤러"+list.size());
		if(list.size()==0){	//북마크한게 없을때!
			mav.setViewName("mypage/bookmark_fail");
		}else{

		/*	System.out.println("리스트갯수"+list.size());
			System.out.println(list.get(0).getTrip_id()+list.get(0).getTrip_content());
		*/	mav.addObject("bookmarklist", list);
			mav.setViewName("mypage/bookmark_suc");	
		}

	   return mav;
	   
	   
   }
}//class end