package com.kosta.yolo.infoMapper;

import java.io.Serializable;
import java.util.ArrayList;

import com.kosta.yolo.vo.TripInfoVO;

public interface TripInfoMapper  extends Serializable  {
	
	ArrayList<TripInfoVO> selectAll();
	ArrayList<TripInfoVO> selectInfo(String category_id);
	public void infoInsert(TripInfoVO vo);
	public void deletePro(String trip_id);
	
}
