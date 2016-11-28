package com.kosta.yolo.vo;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

public class UserReviewVO {
	
	private int review_no;
	private String user_id, trip_id; //조인할 키값
	private String review_content;//리뷰내용
	private Timestamp review_time;
	
	
	public int getReview_no() {
		return review_no;
	}
	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getTrip_id() {
		return trip_id;
	}
	public void setTrip_id(String trip_id) {
		this.trip_id = trip_id;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public Timestamp getReview_time() {
		return review_time;
	}
	public void setReview_time(Timestamp review_time) {
		this.review_time = review_time;
	}
	
}
