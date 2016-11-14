package com.kosta.yolo.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.yolo.infoMapper.TripInfoDAO;
import com.kosta.yolo.vo.TripInfoVO;

@Service
public class TripInfoService {
	
	@Autowired
	private TripInfoDAO infoDAO;
	
	//리스트
	public ModelAndView list(){
		
		ModelAndView mav = new ModelAndView();
		ArrayList<TripInfoVO> list = infoDAO.selectAll();
		System.out.println("여긴!! 서비스닷!!! " + list);
		mav.addObject("list", list);
		
		return mav;
	}
	
	//글쓰기
		public ModelAndView writePro(TripInfoVO vo){
			
			ModelAndView mav = new ModelAndView();
			infoDAO.infoInsert(vo);

			return mav;
		}
		
		//상세보기
		public ModelAndView info(String trip_category_id){
			System.out.println("여긴!! info 서비스닷!!! ");
			ModelAndView mav = new ModelAndView();
			ArrayList<TripInfoVO> list = infoDAO.selectInfo(trip_category_id);
			mav.addObject("vo", list);

			return mav;
		}
		//정보삭제
		public ModelAndView delete(String trip_id){
			
			ModelAndView mav = new ModelAndView();
			infoDAO.deletePro(trip_id);
			
			return mav;
		}
	
}
