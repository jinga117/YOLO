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
	
	//index search 리스트
	public ArrayList<TripInfoVO> selectInfoAll(TripInfoVO vo) {
		System.out.println(vo.getAge_id());
		TripSearchMapper infoSearch = sqlSession.getMapper(TripSearchMapper.class);
		ArrayList<TripInfoVO> list = infoSearch.selectInfoAll(vo);
		return list;
	}
	
	//index search count 리스트
	public int selectInfoAllCount(TripInfoVO vo){
		System.out.println(vo.getAge_id());
		TripSearchMapper infoSearch = sqlSession.getMapper(TripSearchMapper.class); 
		return infoSearch.selectInfoAllCount(vo);
	}
	
	//top search 리스트
	public ArrayList<TripInfoVO> selectAll(TripInfoVO vo) {
		TripSearchMapper infoSearch = sqlSession.getMapper(TripSearchMapper.class);
		ArrayList<TripInfoVO> list = infoSearch.selectAll(vo);
		return list;
	}
	
	//top search count 리스트
	public int selectAllCount(TripInfoVO vo){
		TripSearchMapper infoSearch = sqlSession.getMapper(TripSearchMapper.class);
		return infoSearch.selectAllCount(vo);
		}

}
