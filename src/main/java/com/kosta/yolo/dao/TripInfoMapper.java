package com.kosta.yolo.dao;

import java.io.Serializable;
import java.util.ArrayList;

import com.kosta.yolo.vo.TripInfoVO;

public interface TripInfoMapper  extends Serializable  {
	
	//상세보기
	ArrayList<TripInfoVO> selectDetail(String trip_id);
	//좋아요
	int likeCount(String trip_id);
	int selectLikeCount(String trip_id);
	
	//전체 리스트 뿌리기
	ArrayList<TripInfoVO> selectInfoAll();
	
	//쇼핑별 전체 리스트뿌리기
	ArrayList<TripInfoVO> shopAll(String category_id);
	
	//레스토랑 카테고리별 전체 리스트
	ArrayList<TripInfoVO> foodAll();

	
	//연령별, 계절별, kpop별, 인원별 전체 리스트 뿌리기
	ArrayList<TripInfoVO> ageAll();
	ArrayList<TripInfoVO> seasonAll();
	ArrayList<TripInfoVO> kpopAll();
	ArrayList<TripInfoVO> personAll();

	//age_id 키값에 따른 리스트 뿌리기
	ArrayList<TripInfoVO> selectListAge(String age_id);	
	//season_id 키값에 따른 리스트 뿌리기
	ArrayList<TripInfoVO> selectSeason(String season_id);	
	//kpop_id 키값에 따른 리스트 뿌리기
	ArrayList<TripInfoVO> selectKpop(String kpop_id);	
	//person_id 키값에 따른 리스트 뿌리기
	ArrayList<TripInfoVO> selectPerson(String person_id);	
	
	//food_id 키값에 따른 리스트 뿌리기
	ArrayList<TripInfoVO> selectFood(String food_id);	
	

}
