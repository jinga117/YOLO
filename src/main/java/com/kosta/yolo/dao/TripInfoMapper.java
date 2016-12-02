package com.kosta.yolo.dao;

import java.io.Serializable;
import java.util.ArrayList;

import com.kosta.yolo.vo.RecommandVO;
import com.kosta.yolo.vo.TripInfoVO;
import com.kosta.yolo.vo.UserReviewVO;

public interface TripInfoMapper  extends Serializable  {
	
	//상세 보기
	ArrayList<TripInfoVO> selectDetail(String trip_id);
	
	//리뷰 보기
	ArrayList<TripInfoVO> inforeview(String trip_id);
		
	//리뷰 쓰기
	void writeReview(UserReviewVO vo);
	
	//리뷰 삭제
    void deleteReview(String string);
	
	//조회수
	int viewCount(String trip_id);
	
	//댓글수
	int reviewCount(String trip_id);

	//좋아요
	int likeCount(String trip_id);
	int selectLikeCount(String trip_id);
	
	//전체 리스트 뿌리기
	ArrayList<TripInfoVO> InfoAll();
	
	//레스토랑 카테고리별 / 쇼핑별 전체 리스트뿌리기
	ArrayList<TripInfoVO> foodAll();
	ArrayList<TripInfoVO> categoryAll(String category_id);
	
	//레스토랑 카테고리별 top 리스트
	ArrayList<TripInfoVO> foodAllTop();
	ArrayList<TripInfoVO> categoryTop(String category_id);

	//연령별, 계절별, kpop별, 인원별 Top5 리스트 뿌리기
	ArrayList<TripInfoVO> ageAllTop();
	ArrayList<TripInfoVO> seasonAllTop();
	ArrayList<TripInfoVO> kpopAllTop();
	ArrayList<TripInfoVO> personAllTop();	
	
	//연령별, 계절별, kpop별, 인원별 전체 리스트 뿌리기
	ArrayList<TripInfoVO> ageAll();
	ArrayList<TripInfoVO> seasonAll();
	ArrayList<TripInfoVO> kpopAll();
	ArrayList<TripInfoVO> personAll();

	//age_id 키값에 따른 top5리스트 뿌리기
	ArrayList<TripInfoVO> ageTop(String age_id);	
	//season_id 키값에 따른  top5리스트 뿌리기
	ArrayList<TripInfoVO> seasonTop(String season_id);	
	//kpop_id 키값에 따른  top5리스트 뿌리기
	ArrayList<TripInfoVO> kpopTop(String kpop_id);	
	//person_id 키값에 따른 top5 리스트 뿌리기
	ArrayList<TripInfoVO> personTop(String person_id);	
	//food_id 키값에 따른 top5 리스트 뿌리기
	ArrayList<TripInfoVO> foodTop(String food_id);	
	
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

	ArrayList<UserReviewVO> recentReview(String trip_id);

}
