package com.kosta.yolo.dao;

import java.io.Serializable;
import java.util.ArrayList;

import org.springframework.web.servlet.ModelAndView;

import com.kosta.yolo.vo.BookMarkVO;
import com.kosta.yolo.vo.TripInfoVO;
import com.kosta.yolo.vo.UserReviewVO;
import com.kosta.yolo.vo.UserVO;

public interface MypageMapper  extends Serializable  {

	//마이페이지 내가쓴 댓글
	public ArrayList<UserReviewVO>reviewMypage(String user_id);
	public ArrayList<TripInfoVO> bookmark_mypage(String user_id);	//mypage북마크 
	public void bookmark_delete(String trip_id);//북마크삭제
}
