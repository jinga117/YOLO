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

		System.out.println("insert안에 ID = " + uservo.getUser_id());

		userDAO.getWrite(uservo);
	}
	public int confirmCheck(UserVO vo){
		int check = 1;
		String user_id = vo.getUser_id();
		vo = userDAO.userSelect(user_id);
		
		if(vo != null){
			check = 1;
		}else {
			check = 0;	
		}
		return check;
	}


	public int login(HttpServletRequest request) { // 로그인
		int result = 1;
		HttpSession session = request.getSession();
		session.setAttribute("user_id", request.getParameter("user_id"));
		String user_id = (String) session.getAttribute("user_id");
		System.out.println("써비쓰~~~~");
		UserVO userVo = userDAO.login(user_id);
		
		String inputPwd = request.getParameter("password");

	      if (userVo != null) {
	         
	         if(userVo.getPassword().equals(inputPwd)) { // 로그인성공
	            result = 1;
	    		request.setAttribute("isadmin", userVo.getIsadmin());

	         }
	         else{
	            result = 3;   //비밀번호를 잘못입력하셧습니다.
	         }
	         
	      }//userVO != null end
	      else{
	         result = 2;   //아이디를 잘못입력하셧습니다.
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

		public UserVO userSelect(String user_id) {
			System.out.println(user_id);
			UserVO vo = userDAO.userSelect(user_id);

			System.out.println("여기가 브이오 겟트리아이디 " + vo.getUser_id());
			System.out.println("여긴!! 서비스닷!!! " + vo);
			return vo;
		}

		public ModelAndView deletePro(UserVO vo) {
			ModelAndView mav = new ModelAndView();
			System.out.println("서비스:"+vo.getUser_id()+" 서비스 :"+vo.getPassword());
			userDAO.userDelete(vo);
			
			return mav;

		}
}
