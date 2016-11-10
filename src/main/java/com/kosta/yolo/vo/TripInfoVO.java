package com.kosta.yolo.vo;

public class TripInfoVO {
	
	//여행정보

	private String trip_id; //여행지key값
	private String trip_category_id; //카테고리key값
	private String trip_nickname; //여행지 별칭
	private String trip_address; //주소
	private String trip_image, trip_content, trip_time, trip_pay; //이미지경로, 내용, 이용시간, 비용

	public String getTrip_id() {
		return trip_id;
	}

	public void setTrip_id(String trip_id) {
		this.trip_id = trip_id;
	}

	public String getTrip_category_id() {
		return trip_category_id;
	}

	public void setTrip_category_id(String trip_category_id) {
		this.trip_category_id = trip_category_id;
	}

	public String getTrip_nickname() {
		return trip_nickname;
	}

	public void setTrip_nickname(String trip_nickname) {
		this.trip_nickname = trip_nickname;
	}

	public String getTrip_address() {
		return trip_address;
	}

	public void setTrip_address(String trip_address) {
		this.trip_address = trip_address;
	}

	public String getTrip_image() {
		return trip_image;
	}

	public void setTrip_image(String trip_image) {
		this.trip_image = trip_image;
	}

	public String getTrip_content() {
		return trip_content;
	}

	public void setTrip_content(String trip_content) {
		this.trip_content = trip_content;
	}

	public String getTrip_time() {
		return trip_time;
	}

	public void setTrip_time(String trip_time) {
		this.trip_time = trip_time;
	}

	public String getTrip_pay() {
		return trip_pay;
	}

	public void setTrip_pay(String trip_pay) {
		this.trip_pay = trip_pay;
	}
	
	
}
