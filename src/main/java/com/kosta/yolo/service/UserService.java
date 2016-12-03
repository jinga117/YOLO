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

	// 회원가입
	public void insert(UserVO uservo) {
		userDAO.getWrite(uservo);
	}
	
	public int confirmCheck(UserVO vo){
		int check = 1;
		String user_id = vo.getUser_id();//user_id안에 입력받은 아이디를 넣는다.
		vo = userDAO.userSelect(user_id);//입력받은 user_id를 DAO에 매개변수로보내줌.
		
		if(vo != null){// 아이디가존재함.
			check = 1;
		}else {
			check = 0;	// 아이디가 존재하지않음.
		}
		return check;
	}
	
	public UserVO userIdFindCheck(UserVO vo){
		vo = userDAO.userIdFind(vo);
		return vo;
	}
	
	public UserVO userPwdFindCheck(UserVO vo){
		vo = userDAO.userPwdFind(vo);
		return vo;
	}

	//로그인
	public int login(HttpServletRequest request) {
		int result = 1;
		HttpSession session = request.getSession();
		session.setAttribute("user_id", request.getParameter("user_id"));
		String user_id = (String) session.getAttribute("user_id");
		UserVO userVo = userDAO.login(user_id);
		
		String inputPwd = request.getParameter("password");

	      if (userVo != null) {
	         if(userVo.getPassword().equals(inputPwd)) { // 로그인성공
	            result = 1;
	    		request.setAttribute("isadmin", userVo.getIsadmin());
	         }
	         else{
	            result = 3;   //비밀번호를 잘못입력하셧습니다.
		         session.invalidate();
	         }
	      }//userVO != null end
	      else{
	         result = 2;   //아이디를 잘못입력하셧습니다.
	         session.invalidate();
	      }
	      return result;
	   }

	// 리스트
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView();
		ArrayList<UserVO> list = userDAO.selectAll();
		System.out.println("여긴!! 서비스닷!!! " + list);
		int count = list.size();
		System.out.println("회원수!!! : "+count);
		mav.addObject("userCount", count);
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
		UserVO vo = userDAO.userSelect(user_id);
		return vo;
	}
	
	public UserVO userIdFind(UserVO vo) {
		return vo = userDAO.userIdFind(vo);
	}

	public int deletePro(UserVO vo) {
		return userDAO.userDelete(vo);
	}
	
	public void adminUserDelete(String user_id) {	
		userDAO.adminUserDelete(user_id);
	}
}