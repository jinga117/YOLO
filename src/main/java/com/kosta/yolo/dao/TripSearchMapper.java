package com.kosta.yolo.dao;

import java.io.Serializable;
import java.util.ArrayList;

import com.kosta.yolo.vo.TripInfoVO;

public interface TripSearchMapper extends Serializable  {
	
	ArrayList<TripInfoVO> selectInfoAll(TripInfoVO vo);
	
}
