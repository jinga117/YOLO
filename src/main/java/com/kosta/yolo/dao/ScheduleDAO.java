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
	
	public ArrayList<TripPlanVO> cal(TripPlanVO vo){
		ScheduleMapper schedule = sqlSession.getMapper(ScheduleMapper.class);
		ArrayList<TripPlanVO> pList = schedule.cal(vo);
		return pList;
	}
}
