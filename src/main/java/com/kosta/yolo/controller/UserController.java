package com.kosta.yolo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.yolo.service.UserService;
import com.kosta.yolo.vo.UserVO;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	@RequestMapping("/userWrite_view") // 회원가입 페이지로 이동
	public String write_view(Model model) {
		System.out.println("write_view() method");
		return "userWrite/user_write"; // /WEB-INF/views/write_view.jsp
	} // write_view() end

	@RequestMapping("/userWrite")
	public String write(UserVO uservo) {// , Model model

		System.out.println("여기까지.");
		userService.insert(uservo);

		return "redirect:list";
	}

	@RequestMapping("/loginPro") // 로그인
	public String loginPro(HttpServletRequest request) {

		int result = userService.login(request);
		if (result == 1) {
			return "login/loginPro";
		} else {
			return "login/loginfail";
		}
	}
	@RequestMapping("/userlist")
	public ModelAndView list(){
		System.out.println("여긴 컨트롤러!!! ");
		ModelAndView mav = userService.list();
		mav.setViewName("user/list");
		return mav;
	}


	@RequestMapping("/user_update")
	public ModelAndView update(@RequestParam String id) {
		ModelAndView mav = userService.userSelect(id);
		mav.setViewName("user/user_update");
		return mav;
	}

	@RequestMapping(value = "/user_updatePro", method = RequestMethod.POST)
	public ModelAndView updatePro(UserVO vo) {
		System.out.println("여긴 update 컨트롤러!!! ");
		ModelAndView mav = userService.updatePro(vo);
		mav.setViewName("redirect:index");
		return mav;
	}

	@RequestMapping("/user_delete")
	public ModelAndView delete(@RequestParam String id) {
		ModelAndView mav = userService.userSelect(id);
		mav.setViewName("user/user_delete");
		return mav;
	}

	//회원삭제 (수정해야되는부분)
	@RequestMapping(value = "/user_deletePro", method = RequestMethod.POST)
	public ModelAndView DeletePro(String id) {
		System.out.println("여긴 delete 컨트롤러!!! ");
		ModelAndView mav = userService.deletePro(id);
		mav.setViewName("redirect:index");
		return mav;
	}

}// class end
