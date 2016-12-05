package com.kosta.yolo.dao;

import java.io.Serializable;
import java.util.ArrayList;

import com.kosta.yolo.vo.RecommandVO;
import com.kosta.yolo.vo.TripPlanVO;

public interface TripPlanMapper extends Serializable {
	//여행 일정
	ArrayList<TripPlanVO> myschedule();
	
	// 추천일정 전체 리스트
	ArrayList<RecommandVO> RecommAll(String re_num);
	
	// 추천일정 상세보기 리스트
	ArrayList<RecommandVO> RecommOnum(String re_onum);

	// 일정
	public void insertTripPlan(TripPlanVO vo);
	void updateTripPlan(TripPlanVO vo);
	TripPlanVO tripPlanView(String user_id);
}
