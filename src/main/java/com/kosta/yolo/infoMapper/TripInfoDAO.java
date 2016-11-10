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
	
	public ArrayList<TripInfoVO> selectAll() {
		
		System.out.println("여긴 dao닷!! ");
		TripInfoMapper info = sqlSession.getMapper(TripInfoMapper.class);
		ArrayList<TripInfoVO> list = info.selectAll();
		
		return list;
	}

}
