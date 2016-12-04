package com.kosta.yolo.vo;

public class TripPlanVO {

   //일정 짜기 
   //사용자 ID, 여행지 이름, 여행지 가격,  내 메모
   private String user_id; // user아이디
   private String trip_start; //일정 시작일
   private String trip_title; //일정 제목
   
//일정정보 3일까지
   private int plan_no;
   private String trip_id_1, trip_nickname_1, trip_plan_memo_1, trip_plan_pay_1;
   private String trip_id_2, trip_nickname_2, trip_plan_memo_2, trip_plan_pay_2;
   private String trip_id_3, trip_nickname_3, trip_plan_memo_3, trip_plan_pay_3;
   
   public int getPlan_no() {
      return plan_no;
   }
   public String getUser_id() {
      return user_id;
   }
   public void setUser_id(String user_id) {
      this.user_id = user_id;
   }
   public String getTrip_start() {
      return trip_start;
   }
   public void setTrip_start(String trip_start) {
      this.trip_start = trip_start;
   }
   public void setPlan_no(int plan_no) {
      this.plan_no = plan_no;
   }
   public String getTrip_id_1() {
      return trip_id_1;
   }
   public void setTrip_id_1(String trip_id_1) {
      this.trip_id_1 = trip_id_1;
   }
   public String getTrip_nickname_1() {
      return trip_nickname_1;
   }
   public void setTrip_nickname_1(String trip_nickname_1) {
      this.trip_nickname_1 = trip_nickname_1;
   }
   public String getTrip_plan_memo_1() {
      return trip_plan_memo_1;
   }
   public void setTrip_plan_memo_1(String trip_plan_memo_1) {
      this.trip_plan_memo_1 = trip_plan_memo_1;
   }
   public String getTrip_plan_pay_1() {
      return trip_plan_pay_1;
   }
   public void setTrip_plan_pay_1(String trip_plan_pay_1) {
      this.trip_plan_pay_1 = trip_plan_pay_1;
   }
   public String getTrip_id_2() {
      return trip_id_2;
   }
   public void setTrip_id_2(String trip_id_2) {
      this.trip_id_2 = trip_id_2;
   }
   public String getTrip_nickname_2() {
      return trip_nickname_2;
   }
   public void setTrip_nickname_2(String trip_nickname_2) {
      this.trip_nickname_2 = trip_nickname_2;
   }
   public String getTrip_plan_memo_2() {
      return trip_plan_memo_2;
   }
   public void setTrip_plan_memo_2(String trip_plan_memo_2) {
      this.trip_plan_memo_2 = trip_plan_memo_2;
   }
   public String getTrip_plan_pay_2() {
      return trip_plan_pay_2;
   }
   public void setTrip_plan_pay_2(String trip_plan_pay_2) {
      this.trip_plan_pay_2 = trip_plan_pay_2;
   }
   public String getTrip_id_3() {
      return trip_id_3;
   }
   public void setTrip_id_3(String trip_id_3) {
      this.trip_id_3 = trip_id_3;
   }
   public String getTrip_nickname_3() {
      return trip_nickname_3;
   }
   public void setTrip_nickname_3(String trip_nickname_3) {
      this.trip_nickname_3 = trip_nickname_3;
   }
   public String getTrip_plan_memo_3() {
      return trip_plan_memo_3;
   }
   public void setTrip_plan_memo_3(String trip_plan_memo_3) {
      this.trip_plan_memo_3 = trip_plan_memo_3;
   }
   public String getTrip_plan_pay_3() {
      return trip_plan_pay_3;
   }
   public void setTrip_plan_pay_3(String trip_plan_pay_3) {
      this.trip_plan_pay_3 = trip_plan_pay_3;
   }
   public String getTrip_title() {
		return trip_title;
	}
	public void setTrip_title(String trip_title) {
		this.trip_title = trip_title;
	}
}
   