package com.kosta.yolo.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.yolo.vo.TripInfoVO;

@Repository
public class TripSearchDAO {

	@Autowired
	private SqlSession sqlSession;
	
	//리스트
	public ArrayList<TripInfoVO> selectInfoAll(TripInfoVO vo) {
		System.out.println("여긴 listDao닷!! ");
		System.out.println(vo.getAge_id());
		TripSearchMapper infoSearch = sqlSession.getMapper(TripSearchMapper.class);
		ArrayList<TripInfoVO> list = infoSearch.selectInfoAll(vo);
		return list;
	}

}
