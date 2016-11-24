package com.kosta.yolo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.yolo.dao.MypageDAO;


@Service
public class MypageService {

	@Autowired
	private MypageDAO mypageDAO;

	public int s_login(String user_id) {///////////////// 회원가입
		System.out.println("서비스단 세션로그인아이디" + user_id);
		int result;
		if (user_id != null) {	// 로그인시 
			result = 1;
			return result;
		} else {
			result = 0;
			return result;
		}

	}

}
