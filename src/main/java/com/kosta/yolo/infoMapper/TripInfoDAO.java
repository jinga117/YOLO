package com.kosta.yolo.infoMapper;

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
	public ArrayList<TripInfoVO> selectAll() {
		System.out.println("여긴 listDao닷!! ");
		TripInfoMapper info = sqlSession.getMapper(TripInfoMapper.class);
		ArrayList<TripInfoVO> list = info.selectAll();
		return list;
	}
	
	//정보입력
	public void infoInsert(TripInfoVO vo){
		System.out.println("여긴 insert Dao닷!! ");
		TripInfoMapper info = sqlSession.getMapper(TripInfoMapper.class);
		info.infoInsert(vo);
	}
	
	//정보수정
	public ArrayList<TripInfoVO> selectInfo(String trip_category_id){
		System.out.println("여긴 info Dao닷!! ");
		
		TripInfoMapper info = sqlSession.getMapper(TripInfoMapper.class);
		ArrayList<TripInfoVO> list = info.selectInfo(trip_category_id);
		
		return list;
	}
	//정보삭제
	public void deletePro(String trip_id){
		TripInfoMapper info = sqlSession.getMapper(TripInfoMapper.class);
		info.deletePro(trip_id);
	}
	
	

}
