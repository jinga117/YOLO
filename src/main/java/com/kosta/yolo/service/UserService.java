package com.kosta.yolo.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.yolo.dao.UserDAO;
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
	// 리스트
	public ModelAndView list() {

		ModelAndView mav = new ModelAndView();
		ArrayList<UserVO> list = userDAO.selectAll();
		System.out.println("여긴!! 서비스닷!!! " + list);
		mav.addObject("list", list);

		return mav;
	}
	// 수정
		public ModelAndView updatePro(UserVO vo) {
			ModelAndView mav = new ModelAndView();

			userDAO.userUpdate(vo);

			return mav;
		}

		public UserVO userSelect(String id) {
			System.out.println(id);
			UserVO vo = userDAO.userSelect(id);

			System.out.println("여기가 브이오 겟트리아이디 " + vo.getId());
			System.out.println("여긴!! 서비스닷!!! " + vo);
			return vo;
		}

		public ModelAndView deletePro(String id) {
			ModelAndView mav = new ModelAndView();
			System.out.println(id);
			userDAO.userDelete(id);
			mav.addObject("id", id);
			return mav;

		}
}
