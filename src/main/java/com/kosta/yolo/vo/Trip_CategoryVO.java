package com.kosta.yolo.vo;

public class Trip_CategoryVO {

	//카테고리
	//조인할 key값, 카테고리이름(ex. Attraction), 카테고리 값(ex.명소)
	private String category_id, category_name, category_value;

	public String getCategory_id() {
		return category_id;
	}

	public void setCategory_id(String category_id) {
		this.category_id = category_id;
	}

	public String getCategory_name() {
		return category_name;
	}

	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}

	public String getCategory_value() {
		return category_value;
	}

	public void setCategory_value(String category_value) {
		this.category_value = category_value;
	}
	
}
