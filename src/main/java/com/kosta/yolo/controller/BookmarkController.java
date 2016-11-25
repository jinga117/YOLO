package com.kosta.yolo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.yolo.service.BookmarkService;
import com.kosta.yolo.vo.BookMarkVO;
import com.kosta.yolo.vo.TripInfoVO;

@Controller
public class BookmarkController {

   @Autowired
   private BookmarkService bookmarkService;

   @RequestMapping("/bookmark_log") // 북마크
   public ModelAndView write_view(HttpServletRequest request,TripInfoVO tripinfovo) {
	   HttpSession session = request.getSession();
	   ModelAndView mav = new ModelAndView();
	   BookMarkVO vo = new BookMarkVO();
	   vo.setUser_id((String) session.getAttribute("user_id"));
	   vo.setTrip_id(tripinfovo.getTrip_id());
	
	   
	   
	   System.out.println("아이디:"+vo.getUser_id()+"여행지아이디"+tripinfovo.getTrip_id());
	   
	   if(session.getAttribute("user_id")==null){//비 로그인시
		   int result =0;
		   mav.addObject("result",result);
		   mav.setViewName("bookmark/bookmark_alert");
	   }
	   else{
		   System.out.println("컨트롤러 트립아이디:"+tripinfovo.getTrip_id());
		   bookmarkService.bookmark_write(tripinfovo,vo);
		   mav.setViewName("index");
	   }
	return mav;
		   
   } // write_view() end

}// class end