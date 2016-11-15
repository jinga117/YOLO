package com.kosta.yolo.dao;

import java.io.Serializable;

import com.kosta.yolo.vo.UserVO;

public interface UserMapper  extends Serializable  {
	
	public void getWrite(UserVO uservo);// 회원가입
	public UserVO login(String id);	//로그인

}
