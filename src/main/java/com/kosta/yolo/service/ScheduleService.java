package com.kosta.yolo.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.yolo.dao.ScheduleDAO;
import com.kosta.yolo.dao.UserDAO;
import com.kosta.yolo.vo.UserVO;

@Service
public class ScheduleService {

	@Autowired
	private ScheduleDAO scheduleDAO;

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
