package com.kosta.yolo.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.yolo.vo.RecommandVO;
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
		
	// 추천일정 전체 리스트
	   public ArrayList<RecommandVO> RecommAll(String re_num) {
	      TripPlanMapper plan = sqlSession.getMapper(TripPlanMapper.class);
	      ArrayList<RecommandVO> recommList = plan.RecommAll(re_num);
	      return recommList;
	   }

	   // 추천일정 상세보기 전체 리스트
	   public ArrayList<RecommandVO> RecommOnum(String re_onum) {
		   TripPlanMapper plan = sqlSession.getMapper(TripPlanMapper.class);
	      ArrayList<RecommandVO> recommList = plan.RecommOnum(re_onum);
	      return recommList;
	   }
}