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

	public void getWrite(UserVO uservo) { /////////// 회원가입
		UserMapper usermapper = sqlSession.getMapper(UserMapper.class);
		usermapper.getWrite(uservo);
	}

	public UserVO login(String id) {
		UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
		if (userMapper.login(id) != null) {
			return userMapper.login(id);
		} else {
			return null;
		}
	}
	
	//리스트
		public ArrayList<UserVO> selectAll() {
			System.out.println("여긴 listDao닷!! ");
			UserMapper user = sqlSession.getMapper(UserMapper.class);
			ArrayList<UserVO> list = user.selectAll();
			return list;
		}
		
	public void userUpdate(UserVO vo){
		System.out.println("여긴 updateDao닷!! ");
		UserMapper user = sqlSession.getMapper(UserMapper.class);
		user.userUpdate(vo);
	}
	
	public UserVO userSelect(String id){
		System.out.println("여긴 selectDao닷!! ");
		UserMapper user = sqlSession.getMapper(UserMapper.class);
		UserVO vo = user.userSelect(id);
		return vo;
	}
	
	public void userDelete(String id){
		System.out.println("여긴 deleteDao닷!! ");
		System.out.println(id);
		UserMapper user = sqlSession.getMapper(UserMapper.class);
		user.userDelete(id);
	}
}
