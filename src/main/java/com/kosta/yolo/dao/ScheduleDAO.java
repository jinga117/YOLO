package com.kosta.yolo.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.yolo.vo.TripInfoVO;
import com.kosta.yolo.vo.TripPlanVO;


@Repository
public class ScheduleDAO {

	@Autowired
	private SqlSession sqlSession;
	
	//마이플랜 	//yoloPlan(달력) 정보뿌리기
	public ArrayList<TripPlanVO> cal(TripPlanVO vo){
		ScheduleMapper schedule = sqlSession.getMapper(ScheduleMapper.class);
		ArrayList<TripPlanVO> pList = schedule.cal(vo);
		return pList;
	}
	
	//상세보기
	public TripPlanVO planInfo(String plan_no){
		ScheduleMapper schedule = sqlSession.getMapper(ScheduleMapper.class);	
		TripPlanVO vo = schedule.planInfo(plan_no);
		return vo;
	}
	
	//수정하기
	public void planUp(TripPlanVO vo){
		ScheduleMapper schedule = sqlSession.getMapper(ScheduleMapper.class);	
		 schedule.planUp(vo);
		}
		
		//삭제
	public void planDe(TripPlanVO vo){
		ScheduleMapper schedule = sqlSession.getMapper(ScheduleMapper.class);	
		schedule.planDe(vo);
	}
	
	
}
