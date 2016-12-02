package com.kosta.yolo.dao;

import java.io.Serializable;
import com.kosta.yolo.vo.TripPlanVO;

public interface TripPlanMapper extends Serializable {
	// 일정
	public void tripPlan(TripPlanVO vo);
}
