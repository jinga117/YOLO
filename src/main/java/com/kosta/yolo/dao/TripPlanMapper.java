package com.kosta.yolo.dao;

import java.io.Serializable;

public interface TripPlanMapper  extends Serializable  {
	void tripPlan(String trip_id, String trip_day, String trip_nickname);	
}
