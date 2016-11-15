package com.kosta.yolo.dao;

import java.io.Serializable;
import java.util.ArrayList;

import com.kosta.yolo.vo.TripInfoVO;

public interface AdminMapper  extends Serializable  {
	
	ArrayList<TripInfoVO> selectAll();
	ArrayList<TripInfoVO> selectInfo(String trip_id);
	public void infoInsert(TripInfoVO vo);
	public void deletePro(String trip_id);
	
}