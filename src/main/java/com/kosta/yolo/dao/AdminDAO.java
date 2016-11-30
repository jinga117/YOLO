package com.kosta.yolo.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.yolo.vo.TripInfoVO;
import com.kosta.yolo.vo.UserReviewVO;
import com.kosta.yolo.vo.UserVO;

@Repository
public class AdminDAO {

	@Autowired
	private SqlSession sqlSession;
	
	// 여행지 리스트
	public ArrayList<TripInfoVO> selectAll() {
		AdminMapper admin = sqlSession.getMapper(AdminMapper.class);
		ArrayList<TripInfoVO> list = admin.selectAll();
		return list;
	}
	
	// 여행지 입력
	public void infoInsert(TripInfoVO vo){
		AdminMapper admin = sqlSession.getMapper(AdminMapper.class);
		admin.infoInsert(vo);
	}
	
	// 여행지 수정
	public ArrayList<TripInfoVO> selectInfo(String trip_id){
		AdminMapper admin = sqlSession.getMapper(AdminMapper.class);
		ArrayList<TripInfoVO> list = admin.selectInfo(trip_id);
		return list;
	}

	// 여행지 한 곳 보여주기
	public TripInfoVO selectTrip(String trip_id) {
		AdminMapper admin = sqlSession.getMapper(AdminMapper.class);
		return admin.selectTrip(trip_id);
	}
	
	public UserVO userSelect(String user_id){
		UserMapper user = sqlSession.getMapper(UserMapper.class);
		UserVO vo = user.userSelect(user_id);
		return vo;
	}
	
	// 여행지 삭제
	public void deleteTrip(String trip_id) {
		AdminMapper admin = sqlSession.getMapper(AdminMapper.class);
		admin.deleteTrip(trip_id);
	}

	// 여행지 수정
	public void updateTrip(TripInfoVO vo) {
		AdminMapper admin = sqlSession.getMapper(AdminMapper.class);
		admin.updateTrip(vo);
	}

	// 전체 리뷰 보기
	public ArrayList<UserReviewVO> reviewList() {
		AdminMapper admin = sqlSession.getMapper(AdminMapper.class);
		ArrayList<UserReviewVO> list = admin.reviewList();
		return list;
	}
	
	// 리뷰 삭제
	public void reviewDelete(int review_no){
		AdminMapper admin = sqlSession.getMapper(AdminMapper.class);
		admin.reviewDelete(review_no);
	}

}
