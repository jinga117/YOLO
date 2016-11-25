package com.kosta.yolo.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.yolo.vo.TripInfoVO;
import com.kosta.yolo.vo.UserVO;

@Repository
public class MypageDAO {

	@Autowired
	private SqlSession sqlSession;
	//북마크
	public ArrayList<TripInfoVO> bookmark_mypage(String user_id) {
		System.out.println("DAO측 유저아이디 넘어오는지:"+user_id);
		MypageMapper mypageMapper = sqlSession.getMapper(MypageMapper.class);
		ArrayList<TripInfoVO> list =mypageMapper.bookmark_mypage(user_id);
		return list;
		
		
	}//함수 end
}
