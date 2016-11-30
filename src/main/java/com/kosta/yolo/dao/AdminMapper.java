package com.kosta.yolo.dao;

import java.io.Serializable;
import java.util.ArrayList;

import com.kosta.yolo.vo.TripInfoVO;
import com.kosta.yolo.vo.UserReviewVO;

public interface AdminMapper  extends Serializable  {
	
	// 여행지 리스트
	ArrayList<TripInfoVO> selectAll();
	
	// 여행지 정보
	ArrayList<TripInfoVO> selectInfo(String trip_id);
	
	// 여행지 입력
	public void infoInsert(TripInfoVO vo);
	
	// 여행지 한 곳 보여주기
	public TripInfoVO selectTrip(String trip_id);
	
	// 여행지 삭제
	public void deleteTrip(String trip_id);
	
	//여행지 수정
	public void updateTrip(TripInfoVO vo);
	
	// 전체 리뷰 보기
	ArrayList<UserReviewVO> reviewList();
	
	// 리뷰 삭제
	public void reviewDelete(int review_no);
	
}
