package com.kosta.yolo.dao;

import java.io.Serializable;
import java.util.ArrayList;

import com.kosta.yolo.vo.TripInfoVO;
import com.kosta.yolo.vo.TripPlanVO;
import com.kosta.yolo.vo.UserVO;

public interface ScheduleMapper  extends Serializable  {
	
	//yoloPlan(달력) 정보뿌리기
	ArrayList<TripPlanVO> cal(TripPlanVO vo);
	
	//상세보기
	TripPlanVO planInfo(String plan_no);
	
	//수정하기
	 void planUp(TripPlanVO vo);
	
	//삭제
	void planDe(TripPlanVO vo);
	
}
