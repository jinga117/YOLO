package com.kosta.yolo.vo;

public class TripThemeVO {
	
	private String trip_id; //조인할 키값
	private String trip_season, trip_kpop;
	private int trip_person, trip_age;
	
	
	public String getTrip_id() {
		return trip_id;
	}
	public void setTrip_id(String trip_id) {
		this.trip_id = trip_id;
	}
	public String getTrip_season() {
		return trip_season;
	}
	public void setTrip_season(String trip_season) {
		this.trip_season = trip_season;
	}
	public String getTrip_kpop() {
		return trip_kpop;
	}
	public void setTrip_kpop(String trip_kpop) {
		this.trip_kpop = trip_kpop;
	}
	public int getTrip_person() {
		return trip_person;
	}
	public void setTrip_person(int trip_person) {
		this.trip_person = trip_person;
	}
	public int getTrip_age() {
		return trip_age;
	}
	public void setTrip_age(int trip_age) {
		this.trip_age = trip_age;
	}

}
