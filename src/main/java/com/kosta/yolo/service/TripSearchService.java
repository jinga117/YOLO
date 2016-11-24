package com.kosta.yolo.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.yolo.dao.TripSearchDAO;
import com.kosta.yolo.vo.TripInfoVO;

@Service
public class TripSearchService {
	
	@Autowired
	private TripSearchDAO infoSearchDAO;
	
	//index search 리스트
	public ArrayList<TripInfoVO> search_list(TripInfoVO vo){	
		return infoSearchDAO.selectInfoAll(vo);
	}
	
	//index search count 리스트
	public int search_listCount(TripInfoVO vo){
		return infoSearchDAO.selectInfoAllCount(vo);
	}
	
	//top search 리스트
	public ArrayList<TripInfoVO> searchAll_list(TripInfoVO vo){	
		return infoSearchDAO.selectAll(vo);
	}
	
	//top search count 리스트
	public int searchAll_listCount(TripInfoVO vo){
		return infoSearchDAO.selectAllCount(vo);
	}
	
}
