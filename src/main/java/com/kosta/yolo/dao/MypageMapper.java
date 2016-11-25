package com.kosta.yolo.dao;

import java.io.Serializable;
import java.util.ArrayList;

import com.kosta.yolo.vo.TripInfoVO;
import com.kosta.yolo.vo.UserVO;

public interface MypageMapper  extends Serializable  {
	public ArrayList<TripInfoVO> bookmark_mypage(String user_id);	//북마크현황보기


}
