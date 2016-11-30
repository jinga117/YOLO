package com.kosta.yolo.dao;

import java.io.Serializable;
import java.util.ArrayList;

import com.kosta.yolo.vo.TripInfoVO;
import com.kosta.yolo.vo.TripPlanVO;
import com.kosta.yolo.vo.UserVO;

public interface ScheduleMapper  extends Serializable  {
	
	ArrayList<TripInfoVO> all();
	public ArrayList<TripPlanVO> mycalendar(String user_id);	//YoloPlan
	
}
