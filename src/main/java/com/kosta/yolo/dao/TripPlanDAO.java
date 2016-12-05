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

	//여행 일정
	public ArrayList<TripPlanVO> myschedule(){
		   TripPlanMapper plan = sqlSession.getMapper(TripPlanMapper.class);
		   ArrayList<TripPlanVO> list = plan.myschedule();
		   return list;

	}
	
	public TripPlanVO tripPlan(TripPlanVO vo) {
		TripPlanMapper plan = sqlSession.getMapper(TripPlanMapper.class);
		TripPlanVO tripPlanVo = plan.tripPlanView(vo.getUser_id());
		if (tripPlanVo==null) {
			plan.insertTripPlan(vo);
		} else {
			plan.updateTripPlan(vo);
		}
		return vo;
	}
		
	// 추천일정 전체 리스트
	public ArrayList<RecommandVO> RecommAll(String re_num) {
	   TripPlanMapper plan = sqlSession.getMapper(TripPlanMapper.class);
	   ArrayList<RecommandVO> recommList = plan.RecommAll(re_num);
	   return recommList;
	}

	// 추천일정 상세보기 리스트
	public ArrayList<RecommandVO> RecommOnum(String re_onum) {
	   TripPlanMapper plan = sqlSession.getMapper(TripPlanMapper.class);
	   ArrayList<RecommandVO> recommList = plan.RecommOnum(re_onum);
	   return recommList;
	}

	public TripPlanVO tripPlanView(TripPlanVO vo) {
		TripPlanMapper plan = sqlSession.getMapper(TripPlanMapper.class);
		TripPlanVO tripPlanVo = plan.tripPlanView(vo.getUser_id());
		return tripPlanVo;
	}
}