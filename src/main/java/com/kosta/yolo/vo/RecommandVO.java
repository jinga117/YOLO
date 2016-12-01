package com.kosta.yolo.vo;

public class RecommandVO {
   private String trip_id, re_id, re_num, re_onum, trip_nickname, trip_content, trip_address, trip_add1, trip_add2;
   private int trip_like, trip_view, trip_review; //좋아요, 조회수, 댓글수


   public String getRe_onum() {
      return re_onum;
   }

   public void setRe_onum(String re_onum) {
      this.re_onum = re_onum;
   }

   public int getTrip_like() {
      return trip_like;
   }

   public void setTrip_like(int trip_like) {
      this.trip_like = trip_like;
   }

   public int getTrip_view() {
      return trip_view;
   }

   public void setTrip_view(int trip_view) {
      this.trip_view = trip_view;
   }

   public int getTrip_review() {
      return trip_review;
   }

   public void setTrip_review(int trip_review) {
      this.trip_review = trip_review;
   }

   public String getTrip_address() {
      return trip_address;
   }

   public void setTrip_address(String trip_address) {
      this.trip_address = trip_address;
   }

   public String getTrip_add1() {
      return trip_add1;
   }

   public void setTrip_add1(String trip_add1) {
      this.trip_add1 = trip_add1;
   }

   public String getTrip_add2() {
      return trip_add2;
   }

   public void setTrip_add2(String trip_add2) {
      this.trip_add2 = trip_add2;
   }

   public String getTrip_nickname() {
      return trip_nickname;
   }

   public void setTrip_nickname(String trip_nickname) {
      this.trip_nickname = trip_nickname;
   }

   public String getTrip_content() {
      return trip_content;
   }

   public void setTrip_content(String trip_content) {
      this.trip_content = trip_content;
   }

   public String getRe_num() {
      return re_num;
   }

   public void setRe_num(String re_num) {
      this.re_num = re_num;
   }

   public String getRe_id() {
      return re_id;
   }

   public void setRe_id(String re_id) {
      this.re_id = re_id;
   }

   public String getTrip_id() {
      return trip_id;
   }

   public void setTrip_id(String trip_id) {
      this.trip_id = trip_id;
   }
   
}