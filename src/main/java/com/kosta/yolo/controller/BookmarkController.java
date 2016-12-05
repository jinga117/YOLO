package com.kosta.yolo.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.yolo.service.BookmarkService;
import com.kosta.yolo.vo.BookMarkVO;
import com.kosta.yolo.vo.TripInfoVO;

@Controller
public class BookmarkController {

   @Autowired
   private BookmarkService bookmarkService;

   @RequestMapping("/bookmark_log") // 북마크 추가클릭시.
   public ModelAndView write_view(HttpServletRequest request,TripInfoVO tripinfovo) {
	   HttpSession session = request.getSession();// 로그인값 가져오기위해.
	   ModelAndView mav = new ModelAndView();// 화면에 보내기위해
	   BookMarkVO vo = new BookMarkVO();
	   vo.setUser_id((String) session.getAttribute("user_id"));// vo안에 세션값저장.
	   vo.setTrip_id(tripinfovo.getTrip_id());
	   ArrayList<BookMarkVO> list= bookmarkService.select(vo);	//size = 0일시 북마크성공 (중복되는게없으므로)
	   	   
	   if(session.getAttribute("user_id")==null){//비 로그인시
		   int result =0;
		   mav.addObject("result",result);// 로그인후사용가능하다는 alert창
		   mav.setViewName("bookmark/bookmark_alert");// 로그인후사용가능하다는 alert창
	   }
	   else{	//로그인시
		   if(list.size()==0){ // 북마크된게 없을시(중복안되므로) 북마크성공.
		   bookmarkService.bookmark_write(tripinfovo,vo);
		   int result = 2;
		   mav.addObject("result",result);	//북마크성공 alert창
		   mav.setViewName("bookmark/bookmark_alert");
		   }
		   else{// 로그인은 되있으나, 북마크를 햇었다면 (중복됨)
			   int result =1;
			   mav.addObject("result",result);// 로그인후사용가능하다는 alert창
			   mav.setViewName("bookmark/bookmark_alert");// 북마크했다는 alert창.
		   }
	   }
	   
	return mav;
	
   } // write_view() end

}// class end