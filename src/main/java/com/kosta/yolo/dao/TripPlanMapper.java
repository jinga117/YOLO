package com.kosta.yolo.dao;

import java.io.Serializable;
import java.util.ArrayList;

import com.kosta.yolo.vo.RecommandVO;
import com.kosta.yolo.vo.TripPlanVO;

public interface TripPlanMapper extends Serializable {
	// 일정
	public void tripPlan(TripPlanVO vo);
	
	//추천일정 전체 리스트 뿌리기
	ArrayList<RecommandVO> RecommAll(String re_num);
	
	//추천일정 상세보기 리스트 뿌리기
	ArrayList<RecommandVO> RecommOnum(String re_onum);
	
}
