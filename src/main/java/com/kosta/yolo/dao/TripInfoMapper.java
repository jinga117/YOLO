package com.kosta.yolo.dao;

import java.io.Serializable;
import java.util.ArrayList;

import com.kosta.yolo.vo.TripInfoVO;

public interface TripInfoMapper  extends Serializable  {
	
	ArrayList<TripInfoVO> selectInfoAll();
	ArrayList<TripInfoVO> selectListAge();	
}
