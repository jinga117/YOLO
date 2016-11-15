package com.kosta.yolo.infoMapper;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.yolo.vo.UserVO;

@Repository
public class UserDAO {

	@Autowired
	private SqlSession sqlSession;

	public void getWrite(UserVO uservo) {	///////////회원가입
		UserMapper usermapper = sqlSession.getMapper(UserMapper.class);
		usermapper.getWrite(uservo);
	}
	public UserVO login(String id) {
		UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
		if(userMapper.login(id)!=null){
			return userMapper.login(id);	
		}else{
			return null;
		}
			}
}
