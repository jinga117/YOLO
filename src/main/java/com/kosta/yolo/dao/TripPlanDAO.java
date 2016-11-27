package com.kosta.yolo.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TripPlanDAO {

	@Autowired
	private SqlSession sqlSession;
	
	public String tripPlan(String trip_id, String trip_day, String trip_nickname) {
		TripPlanMapper plan = sqlSession.getMapper(TripPlanMapper.class);
		plan.tripPlan(trip_id, trip_day, trip_nickname);
		return "ok";
	}
}