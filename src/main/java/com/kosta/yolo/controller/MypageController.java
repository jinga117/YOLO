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

	@RequestMapping("/my_page")
	public String mypage() {// 로그인후 마이페이지 클릭시 view창으로 이동.

		return "mypage/mypage_main";
	}

	@RequestMapping("review_delete") // 내가쓴 리뷰 삭제
	public String review_delete(UserReviewVO vo) {
		mypageService.review_delete(vo);// 삭제클릭시 키값을 리뷰넘버로잡음.
		return "mypage/review_delete";
	}

	@RequestMapping("/review_view") // 마이페이지에서 내가쓴댓글
	public ModelAndView review_view(HttpServletRequest request) {

		HttpSession session = request.getSession();// 로그인값 가져오기위해 사용
		String user_id = (String) session.getAttribute("user_id"); // string user_id 안에 세션값저장
		ArrayList<UserReviewVO> list = mypageService.review_my(user_id);
		ModelAndView mav = new ModelAndView();
		if (list.size() == 0) {// 리뷰쓴게 없을경우
			mav.setViewName("mypage/myreview_list_fail");// 리뷰쓴게없다는 alert창
		} else {// 리뷰쓴게 있을경우
			mav.addObject("list", list);// list를 객체에담음.
			mav.setViewName("mypage/myreview_list");
		}
		return mav;
	}

	@RequestMapping("/bookmark_view") // 마이페이지에서 본인이 북마크한 현황보기~
	public ModelAndView bookmark_view(HttpServletRequest request) {
		ArrayList<TripInfoVO> list = mypageService.bookmark_my(request);
		ModelAndView mav = new ModelAndView();
		System.out.println("컨트롤러" + list.size());
		if (list.size() == 0) { // 북마크한게 없을때!
			mav.setViewName("mypage/bookmark_fail");
		} else {
			mav.addObject("bookmarklist", list);
			mav.setViewName("mypage/bookmark_suc");
		}

		return mav;
	}

	@RequestMapping("bookmark_delete") // 마이페이지에서 북마크삭제
	public String deleteRe(TripInfoVO vo) {
		System.out.println(vo.getTrip_id());
		mypageService.delete(vo);

		return "mypage/bookmark_delete";
	}
}// class end