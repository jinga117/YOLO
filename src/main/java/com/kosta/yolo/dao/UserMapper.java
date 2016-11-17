package com.kosta.yolo.dao;

import java.io.Serializable;
import java.util.ArrayList;

import com.kosta.yolo.vo.UserVO;

public interface UserMapper  extends Serializable  {
	
	public void getWrite(UserVO uservo);// 회원가입
	
	public UserVO login(String user_id);	//로그인
	
	ArrayList<UserVO> selectAll();
	
	public void userUpdate(UserVO vo);
	
	public void userDelete(UserVO vo);
	
	public UserVO userSelect(String id);

}
