package com.kosta.yolo.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.yolo.infoMapper.UserDAO;
import com.kosta.yolo.vo.UserVO;

@Service
public class UserService {

	@Autowired
	private UserDAO userDAO;

	public void insert(UserVO uservo) {///////////////// 회원가입

		System.out.println("insert안에 ID = " + uservo.getId());

		userDAO.getWrite(uservo);
	}

	public int login(HttpServletRequest request) { // 로그인
		int result = 1;
		HttpSession session = request.getSession();
		session.setAttribute("id", request.getParameter("id"));
		String id = (String) session.getAttribute("id");
		UserVO userVo = userDAO.login(id);
		System.out.println(userVo);

		String inputPwd = request.getParameter("password");
		if (userVo != null) {
			
			if(userVo.getPassword().equals(inputPwd)) { // 로그인성공
				result = 1;
			}
			
		}//userVO != null end
		else{
			result = 0;
		}
		return result;
	}
}
