package com.kosta.yolo.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.yolo.vo.TripInfoVO;

@Repository
public class TripInfoDAO {

	@Autowired
	private SqlSession sqlSession;
	
	//리스트
	public ArrayList<TripInfoVO> selectInfoAll() {
		System.out.println("여긴 listDao닷!! ");
		TripInfoMapper info = sqlSession.getMapper(TripInfoMapper.class);
		ArrayList<TripInfoVO> list = info.selectInfoAll();
		return list;
	}
	public ArrayList<TripInfoVO> ageAll(){
		TripInfoMapper info = sqlSession.getMapper(TripInfoMapper.class);
		ArrayList<TripInfoVO> topList = info.ageAll();
		return topList;
	}
	
	public ArrayList<TripInfoVO> selectListAge(String age_id) {
		TripInfoMapper info = sqlSession.getMapper(TripInfoMapper.class);
		ArrayList<TripInfoVO> avo = info.selectListAge(age_id);
		return avo;
	}
	public ArrayList<TripInfoVO> themeAll(){
		TripInfoMapper info = sqlSession.getMapper(TripInfoMapper.class);
		ArrayList<TripInfoVO> seasonList = info.themeAll();
		return seasonList;
	}

}
