package com.kosta.yolo.dao;

import java.io.Serializable;
import java.util.ArrayList;

import com.kosta.yolo.vo.TripInfoVO;

public interface TripSearchMapper extends Serializable  {
	
	ArrayList<TripInfoVO> selectInfoAll(TripInfoVO vo); //index단 검색
	ArrayList<TripInfoVO> selectAll(TripInfoVO vo); //top단 검색
	
	public int selectInfoAllCount(TripInfoVO vo); //index단 카운트수 검색
	public int selectAllCount(TripInfoVO vo); //top단 카운트수 검색
}
