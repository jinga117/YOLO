package com.kosta.yolo.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.yolo.dao.TripInfoDAO;
import com.kosta.yolo.vo.TripInfoVO;

@Service
public class TripInfoService {
	
	@Autowired
	private TripInfoDAO infoDAO;
	
	//전체리스트
	public ModelAndView list(){
		ModelAndView mav = new ModelAndView();
		ArrayList<TripInfoVO> ageList = infoDAO.ageAll(); //연령별
		ArrayList<TripInfoVO> seasonList = infoDAO.seasonAll(); //계절별전체
		ArrayList<TripInfoVO> kpopList = infoDAO.kpopAll(); //한류별
		ArrayList<TripInfoVO> personList = infoDAO.personAll(); //인원별
		mav.addObject("ageList", ageList);
		mav.addObject("seasonList", seasonList);
		mav.addObject("kpopList", kpopList);
		mav.addObject("personList", personList);
		return mav;
	}
	
	//list_restaurant전체 리스트
	public ModelAndView list_restaurant(){
		ModelAndView mav = new ModelAndView();
		ArrayList<TripInfoVO> foodList = infoDAO.foodAll();
		mav.addObject("foodList", foodList);
		return mav;
	}
	
	//food_id 키값별 리스트
	public ModelAndView selectFood(String food_id) {
		ModelAndView mav = new ModelAndView();
		ArrayList<TripInfoVO> fvo = infoDAO.selectFood(food_id);
		mav.addObject("food_id", food_id);
		mav.addObject("foodList", fvo);
		return mav;
	}
	
	//list_shopping전체 리스트
	public ModelAndView list_shopping(String category_id){
		ModelAndView mav = new ModelAndView();
		ArrayList<TripInfoVO> shopList = infoDAO.shopAll(category_id);
		mav.addObject("shopList", shopList);
		return mav;
	}
	
	//연령별 전체 리스트
	public ModelAndView age_view(){
		ModelAndView mav = new ModelAndView();
		ArrayList<TripInfoVO> topList = infoDAO.ageAll();
		mav.addObject("ageList", topList);
		return mav;
	}
	
	//age_id 키값에 따른 리스트
	public ModelAndView selectListAge(String age_id) {
		ModelAndView mav = new ModelAndView();
		ArrayList<TripInfoVO> avo = infoDAO.selectListAge(age_id);
		mav.addObject("age_id", age_id);
		mav.addObject("ageList", avo);
		return mav;
	}
	
	//테마별 전체 리스트
	public ModelAndView theme(){
		ModelAndView mav = new ModelAndView();
		ArrayList<TripInfoVO> seasonList = infoDAO.seasonAll();
		ArrayList<TripInfoVO> kpopList = infoDAO.kpopAll();
		mav.addObject("seasonList", seasonList);
		mav.addObject("kpopList", kpopList);
		return mav;
	}
	
	//seaon_id 키값에 따른 리스트
	public ModelAndView selectListSeason(String season_id) {
		ModelAndView mav = new ModelAndView();
		ArrayList<TripInfoVO> svo = infoDAO.selectSeason(season_id);
		mav.addObject("season_id", season_id);
		mav.addObject("seasonList", svo);
		return mav;
	}
	//kpop_id 키값에 따른 리스트
	public ModelAndView selectListKpop(String kpop_id) {
		ModelAndView mav = new ModelAndView();
		ArrayList<TripInfoVO> kvo = infoDAO.selectKpop(kpop_id);
		mav.addObject("kpop_id", kpop_id);
		mav.addObject("kpopList", kvo);
		return mav;
	}
	//인원별ALL 리스트
	public ModelAndView person() {
		ModelAndView mav = new ModelAndView();
		ArrayList<TripInfoVO> personList = infoDAO.personAll();
		mav.addObject("personList", personList);
		return mav;
	}
	//person_id 키값별 리스트
	public ModelAndView selectListPerson(String person_id) {
		ModelAndView mav = new ModelAndView();
		ArrayList<TripInfoVO> pvo = infoDAO.selectPerson(person_id);
		mav.addObject("person_id", person_id);
		mav.addObject("personList", pvo);
		return mav;
	}
	
}
