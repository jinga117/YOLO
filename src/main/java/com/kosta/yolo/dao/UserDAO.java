package com.kosta.yolo.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.yolo.vo.UserVO;

@Repository
public class UserDAO {

	@Autowired
	private SqlSession sqlSession;

	// 회원가입
	public void getWrite(UserVO uservo) { 
		UserMapper usermapper = sqlSession.getMapper(UserMapper.class);
		usermapper.getWrite(uservo);
	}

	public UserVO login(String user_id) {
		UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
		if (userMapper.login(user_id) != null) {
			return userMapper.login(user_id);
		} else {
			return null;
		}
	}
	
	//리스트
	public ArrayList<UserVO> selectAll() {
		UserMapper user = sqlSession.getMapper(UserMapper.class);
		ArrayList<UserVO> list = user.selectAll();
		return list;
		}
		//회원정보수정
	public void userUpdate(UserVO vo){
		UserMapper user = sqlSession.getMapper(UserMapper.class);
		user.userUpdate(vo);
		//UPDATE User SET password=#{password},name=#{name}, email=#{email}, gender=#{gender}, age=#{age} WHERE user_id = #{user_id }

	}
	
	public UserVO userSelect(String user_id){
		UserMapper user = sqlSession.getMapper(UserMapper.class);
		UserVO vo = user.userSelect(user_id);//아이디가 존재하는지 확인.
		return vo;
	}
	
	public int userDelete(UserVO vo){
		UserMapper user = sqlSession.getMapper(UserMapper.class);
		return user.userDelete(vo);
	}
	
	public void adminUserDelete(String user_id){
		UserMapper user = sqlSession.getMapper(UserMapper.class);
		user.adminUserDelete(user_id);
	}
	
	public UserVO userIdFind(UserVO vo){
		UserMapper user = sqlSession.getMapper(UserMapper.class); 
		return user.userIdFind(vo);
	}
	
	public UserVO userPwdFind(UserVO vo){
		UserMapper user = sqlSession.getMapper(UserMapper.class); 
		return user.userPwdFind(vo);
	}
}
