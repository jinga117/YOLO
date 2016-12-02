package com.kosta.yolo.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.yolo.vo.TripPlanVO;

@Repository
public class TripPlanDAO {

	@Autowired
	private SqlSession sqlSession;
	
	public TripPlanVO tripPlan(TripPlanVO vo) {
		TripPlanMapper plan = sqlSession.getMapper(TripPlanMapper.class);
		plan.tripPlan(vo);
		return vo;
	}
}