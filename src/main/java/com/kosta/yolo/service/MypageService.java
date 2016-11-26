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
		System.out.println("서비스단 세션로그인아이디" + user_id);
		int result;
		if (user_id != null) {	// 로그인시 
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
		String user_id = (String)session.getAttribute("user_id");
		ArrayList<TripInfoVO> list = mypageDAO.bookmark_mypage(user_id);
		/*
		System.out.println("리스트갯수"+list.size());
		System.out.println(list.get(0).getTrip_id()+list.get(0).getTrip_nickname());
	*/	return list;
		
	}
}