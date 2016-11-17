package com.kosta.yolo.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.yolo.vo.TripInfoVO;

@Repository
public class TripInfoDAO {

	@Autowired
	private SqlSession sqlSession;
	
	//전체 리스트 뿌리기
	public ArrayList<TripInfoVO> selectInfoAll() {
		TripInfoMapper info = sqlSession.getMapper(TripInfoMapper.class);
		ArrayList<TripInfoVO> list = info.selectInfoAll();
		return list;
	}
	//쇼핑 카테고리 전체
	public 	ArrayList<TripInfoVO> shopAll(String category_id){
		TripInfoMapper info = sqlSession.getMapper(TripInfoMapper.class);
		ArrayList<TripInfoVO> shopList = info.shopAll(category_id);
		return shopList;
	}
	
	//레스토랑카테고리 전체
	public 	ArrayList<TripInfoVO> foodAll(){
		TripInfoMapper info = sqlSession.getMapper(TripInfoMapper.class);
		ArrayList<TripInfoVO> foodList = info.foodAll();
		return foodList;
	}
	
	//연령별, 계절별, kpop별,인원별 전체 리스트 뿌리기
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
}
