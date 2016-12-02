package com.kosta.yolo.vo;

public class TripInfoVO {
	
	//여행정보
	private String trip_id; //여행지key값
	private String category_id, age_id, food_id, season_id, person_id, kpop_id; //카테고리key값
	private String trip_nickname; //여행지 별칭
	private String trip_address; //주소
	private String trip_image, trip_content, trip_time; //이미지경로, 내용, 이용시간
	private String trip_site, trip_tel, trip_way; //사이트, 전화번호, 가는방법
	private String  trip_pay; //비용
	private String trip_add1, trip_add2, trip_add3; //상세주소(시/구/나머지)
	private int trip_like, trip_view, trip_review; //좋아요, 조회수, 댓글수
	private double pos_x, pos_y; //위도, 경도
	
	private String re_id;	// 추천 일정 조인 시 필요(Recommand 테이블의 key 값)
	private String re_content; // 추천 일정 메인 제목
	
	public String getRe_content() {
		return re_content;
	}
	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}
	public String getTrip_id() {
		return trip_id;
	}
	public void setTrip_id(String trip_id) {
		this.trip_id = trip_id;
	}
	public String getCategory_id() {
		return category_id;
	}
	public void setCategory_id(String category_id) {
		this.category_id = category_id;
	}
	public String getAge_id() {
		return age_id;
	}
	public void setAge_id(String age_id) {
		this.age_id = age_id;
	}
	public String getFood_id() {
		return food_id;
	}
	public void setFood_id(String food_id) {
		this.food_id = food_id;
	}
	public String getSeason_id() {
		return season_id;
	}
	public void setSeason_id(String season_id) {
		this.season_id = season_id;
	}
	public String getPerson_id() {
		return person_id;
	}
	public void setPerson_id(String person_id) {
		this.person_id = person_id;
	}
	public String getKpop_id() {
		return kpop_id;
	}
	public void setKpop_id(String kpop_id) {
		this.kpop_id = kpop_id;
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
	public String getTrip_site() {
		return trip_site;
	}
	public void setTrip_site(String trip_site) {
		this.trip_site = trip_site;
	}
	public String getTrip_tel() {
		return trip_tel;
	}
	public void setTrip_tel(String trip_tel) {
		this.trip_tel = trip_tel;
	}
	public String getTrip_way() {
		return trip_way;
	}
	public void setTrip_way(String trip_way) {
		this.trip_way = trip_way;
	}
	public String getTrip_pay() {
		return trip_pay;
	}
	public void setTrip_pay(String trip_pay) {
		this.trip_pay = trip_pay;
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
	public String getTrip_add3() {
		return trip_add3;
	}
	public void setTrip_add3(String trip_add3) {
		this.trip_add3 = trip_add3;
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
	public double getPos_x() {
		return pos_x;
	}
	public void setPos_x(double pos_x) {
		this.pos_x = pos_x;
	}
	public double getPos_y() {
		return pos_y;
	}
	public void setPos_y(double pos_y) {
		this.pos_y = pos_y;
	}
	public String getRe_id() {
		return re_id;
	}
	public void setRe_id(String re_id) {
		this.re_id = re_id;
	}
	
}	