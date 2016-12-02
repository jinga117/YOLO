package com.kosta.yolo.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.yolo.vo.RecommandVO;
import com.kosta.yolo.vo.TripInfoVO;
import com.kosta.yolo.vo.UserReviewVO;

@Repository
public class TripInfoDAO {

	@Autowired
	private SqlSession sqlSession;
	
	// 상세보기
	public ArrayList<TripInfoVO> selectDetail(String trip_id) {
		TripInfoMapper info = sqlSession.getMapper(TripInfoMapper.class);
		ArrayList<TripInfoVO> avo = info.selectDetail(trip_id);
		return avo;
	}
	
	// 리뷰보기
	public ArrayList<TripInfoVO> inforeview(String trip_id) {
		TripInfoMapper info = sqlSession.getMapper(TripInfoMapper.class);
		ArrayList<TripInfoVO> reList = info.inforeview(trip_id);
		return reList;
	}
	
	// 리뷰 쓰기
	public void writeReview(UserReviewVO vo){
		TripInfoMapper info = sqlSession.getMapper(TripInfoMapper.class);
		info.writeReview(vo);
	}
	
	// 리뷰 삭제
	public void deleteReview(String string){
	   TripInfoMapper info = sqlSession.getMapper(TripInfoMapper.class);
	   info.deleteReview(string);
	}
	
	// 조회수
	public int viewCount(String trip_id) {
		TripInfoMapper info = sqlSession.getMapper(TripInfoMapper.class);
		int view_count = info.viewCount(trip_id);
		return view_count;
	}
	
	// 댓글수
	public int reviewCount(String trip_id) {
		TripInfoMapper info = sqlSession.getMapper(TripInfoMapper.class);
		int review_count = info.reviewCount(trip_id);
		System.out.println("review_count" + review_count);
		return review_count;
	}
	
	// 좋아요
	public int likeCount(String trip_id) {
		TripInfoMapper info = sqlSession.getMapper(TripInfoMapper.class);
		info.likeCount(trip_id);
		return info.selectLikeCount(trip_id);
	}
	
	//전체 리스트 뿌리기
	public ArrayList<TripInfoVO> InfoAll() {
		TripInfoMapper info = sqlSession.getMapper(TripInfoMapper.class);
		ArrayList<TripInfoVO> list = info.InfoAll();
		return list;
	}
	
	//쇼핑 카테고리 전체 리스트
	public 	ArrayList<TripInfoVO> categoryAll(String category_id){
		TripInfoMapper info = sqlSession.getMapper(TripInfoMapper.class);
		ArrayList<TripInfoVO> shopList = info.categoryAll(category_id);
		return shopList;
	}
	
	//레스토랑 카테고리 전체 리스트
	public 	ArrayList<TripInfoVO> foodAll(){
		TripInfoMapper info = sqlSession.getMapper(TripInfoMapper.class);
		ArrayList<TripInfoVO> foodList = info.foodAll();
		return foodList;
	}
	
	//쇼핑 카테고리 Top5
	public 	ArrayList<TripInfoVO> categoryTop(String category_id){
		TripInfoMapper info = sqlSession.getMapper(TripInfoMapper.class);
		ArrayList<TripInfoVO> shopList = info.categoryTop(category_id);
		return shopList;
	}
	
	//레스토랑 카테고리 Top5
	public 	ArrayList<TripInfoVO> foodAllTop(){
		TripInfoMapper info = sqlSession.getMapper(TripInfoMapper.class);
		ArrayList<TripInfoVO> foodList = info.foodAllTop();
		return foodList;
	}
	
	//연령별, 계절별, kpop별, 인원별 TOP5 리스트 뿌리기
	public ArrayList<TripInfoVO> ageAllTop(){
		TripInfoMapper info = sqlSession.getMapper(TripInfoMapper.class);
		ArrayList<TripInfoVO> aTopList = info.ageAllTop();
		return aTopList;
	}	
	
	public ArrayList<TripInfoVO> seasonAllTop(){
		TripInfoMapper info = sqlSession.getMapper(TripInfoMapper.class);
		ArrayList<TripInfoVO> sTopList = info.seasonAllTop();
		return sTopList;
	}
	
	public ArrayList<TripInfoVO> kpopAllTop(){
		TripInfoMapper info = sqlSession.getMapper(TripInfoMapper.class);
		ArrayList<TripInfoVO> kTopList = info.kpopAllTop();
		return kTopList;
	}
	
	public ArrayList<TripInfoVO> personAllTop(){
		TripInfoMapper info = sqlSession.getMapper(TripInfoMapper.class);
		ArrayList<TripInfoVO> pTopList = info.personAllTop();
		return pTopList;
	}
	
	//연령별, 계절별, kpop별, 인원별 전체 리스트 뿌리기
	public ArrayList<TripInfoVO> ageAll(){
		TripInfoMapper info = sqlSession.getMapper(TripInfoMapper.class);
		ArrayList<TripInfoVO> topList = info.ageAll();
		return topList;
	}	
	
	public ArrayList<TripInfoVO> seasonAll(){
		TripInfoMapper info = sqlSession.getMapper(TripInfoMapper.class);
		ArrayList<TripInfoVO> seasonList = info.seasonAll();
		return seasonList;
	}
	
	public ArrayList<TripInfoVO> kpopAll(){
		TripInfoMapper info = sqlSession.getMapper(TripInfoMapper.class);
		ArrayList<TripInfoVO> seasonList = info.kpopAll();
		return seasonList;
	}
	
	public ArrayList<TripInfoVO> personAll(){
		TripInfoMapper info = sqlSession.getMapper(TripInfoMapper.class);
		ArrayList<TripInfoVO> personList = info.personAll();
		return personList;
	}
	
	//age_id 키값에 따른 top리스트 뿌리기
	public ArrayList<TripInfoVO> ageTop(String age_id) {
		TripInfoMapper info = sqlSession.getMapper(TripInfoMapper.class);
		ArrayList<TripInfoVO> avo = info.ageTop(age_id);
		return avo;
	}
	
	//season_id 키값에 따른 top리스트 뿌리기
	public ArrayList<TripInfoVO> seasonTop(String season_id){
		TripInfoMapper info = sqlSession.getMapper(TripInfoMapper.class);
		ArrayList<TripInfoVO> svo = info.seasonTop(season_id);
		return svo;
	}
	
	//kpop_id 키값에 따른 top리스트 뿌리기
	public ArrayList<TripInfoVO>  kpopTop(String kpop_id){
		TripInfoMapper info = sqlSession.getMapper(TripInfoMapper.class);
		ArrayList<TripInfoVO> kvo = info.kpopTop(kpop_id);
		return kvo;
	}
	//person_id 키값에 따른 top리스트 뿌리기
	public ArrayList<TripInfoVO> personTop(String person_id){
		TripInfoMapper info = sqlSession.getMapper(TripInfoMapper.class);
		ArrayList<TripInfoVO> pvo = info.personTop(person_id);
		return pvo;
	}
	//food_id 키값에 따른 top리스트 뿌리기
	public ArrayList<TripInfoVO> foodTop(String food_id){
		TripInfoMapper info = sqlSession.getMapper(TripInfoMapper.class);
		ArrayList<TripInfoVO> fvo = info.foodTop(food_id);
		return fvo;
	}
	
	//age_id 키값에 따른 리스트 뿌리기
	public ArrayList<TripInfoVO> selectListAge(String age_id) {
		TripInfoMapper info = sqlSession.getMapper(TripInfoMapper.class);
		ArrayList<TripInfoVO> avo = info.selectListAge(age_id);
		return avo;
	}
	
	//season_id 키값에 따른 리스트 뿌리기
	public ArrayList<TripInfoVO> selectSeason(String season_id){
		TripInfoMapper info = sqlSession.getMapper(TripInfoMapper.class);
		ArrayList<TripInfoVO> svo = info.selectSeason(season_id);
		return svo;
	}
	
	//kpop_id 키값에 따른 리스트 뿌리기
	public ArrayList<TripInfoVO>  selectKpop(String kpop_id){
		TripInfoMapper info = sqlSession.getMapper(TripInfoMapper.class);
		ArrayList<TripInfoVO> kvo = info.selectKpop(kpop_id);
		return kvo;
	}
	
	//person_id 키값에 따른 리스트 뿌리기
	public ArrayList<TripInfoVO> selectPerson(String person_id){
		TripInfoMapper info = sqlSession.getMapper(TripInfoMapper.class);
		ArrayList<TripInfoVO> pvo = info.selectPerson(person_id);
		return pvo;
	}
	
	//food_id 키값에 따른 리스트 뿌리기
	public ArrayList<TripInfoVO> selectFood(String food_id){
		TripInfoMapper info = sqlSession.getMapper(TripInfoMapper.class);
		ArrayList<TripInfoVO> fvo = info.selectFood(food_id);
		return fvo;
	}

	public ArrayList<UserReviewVO> recentReview(String trip_id) {
		TripInfoMapper info = sqlSession.getMapper(TripInfoMapper.class);
		ArrayList<UserReviewVO> reList = info.recentReview(trip_id);
		return reList;
	}

}