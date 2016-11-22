package com.kosta.yolo.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.yolo.vo.TripInfoVO;


@Repository
public class ScheduleDAO {

	@Autowired
	private SqlSession sqlSession;
	
	public ArrayList<TripInfoVO> all(){
		ScheduleMapper schedule = sqlSession.getMapper(ScheduleMapper.class);
		ArrayList<TripInfoVO> list = schedule.all();
		return list;
	}
	
}
