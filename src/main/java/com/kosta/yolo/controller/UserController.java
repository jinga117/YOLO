package com.kosta.yolo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

   // 회원가입 페이지로 이동
   @RequestMapping("/userWrite_view")
   public String write_view(Model model) {
      return "user/user_write"; // /WEB-INF/views/write_view.jsp
   } 

   @RequestMapping(value="/userwrite", method=RequestMethod.POST)
   public ModelAndView write(UserVO uservo) {	// , Model model
	   ModelAndView mav = new ModelAndView();
	   int num = userService.confirmCheck(uservo);
	   if(num == 1){
		   mav.addObject("num",num);
		   mav.setViewName("user/FindFail");
		   return mav;
	   }else{
		   userService.insert(uservo);
		   mav.setViewName("user/FindFail");
		   return mav;
	   }
   }

   // 로그인
   @RequestMapping("/loginPro")
   public String loginPro(HttpServletRequest request, HttpServletResponse response) throws Exception {
	  String user_id = request.getParameter("user_id");
	  HttpSession session = request.getSession();
	  
      int result = userService.login(request);
      UserVO vo = null;
      
      if (result == 1) {
    	  request.setAttribute("result", result);
    	  vo = userService.userSelect(user_id);
    	  session.setAttribute("user_id", user_id);
    	  session.setAttribute("isadmin", vo.getIsadmin());		// 관리자 세션 유지
    	  session.setAttribute("vo", vo);
      }else if(result == 2){
    	  request.setAttribute("result", result);
      }else{
    	  request.setAttribute("result", result);
      }

	String json = "{\"result\":\"" + result + "\"}";
	response.getWriter().print(json);
      
      return null;
   }

   // 로그아웃
   @RequestMapping("/logout")
   public String logout(HttpServletRequest request){
      
      HttpSession session = request.getSession();
      session.invalidate();
      
      return "login/loginOut";
   }
   
   // 회원 리스트
   @RequestMapping("/userlist")
   public ModelAndView list(){
      System.out.println("여긴 컨트롤러!!! ");
      ModelAndView mav = userService.list();
      mav.setViewName("user/userlist");
      
      return mav;
   }

   // 회원 수정
   @RequestMapping("/user_update")
   public ModelAndView update(HttpServletRequest request) {
	  HttpSession session = request.getSession();
	  String user_id = (String) session.getAttribute("user_id");
	  ModelAndView mav = new ModelAndView();
	  UserVO vo = userService.userSelect(user_id);
	  mav.addObject("vo",vo);
	  mav.setViewName("user/user_update");
	      
	  return mav;
   }

   @RequestMapping(value = "/user_updatePro", method = RequestMethod.POST)
   public ModelAndView updatePro(UserVO vo) {
      ModelAndView mav = userService.updatePro(vo);
      mav.setViewName("mypage/mypage_main");
      
      return mav;
   }

   // 회원 삭제
   @RequestMapping("/user_delete")
   public ModelAndView delete(@RequestParam String user_id) {
      ModelAndView mav = new ModelAndView();
      UserVO vo = userService.userSelect(user_id);
      mav.addObject("vo",vo);
      mav.setViewName("user/user_delete");
      
      return mav;
   }

   //회원삭제 (수정해야되는부분)
   @RequestMapping(value = "/user_deletePro", method = RequestMethod.POST)
   public ModelAndView DeletePro(UserVO vo) {
      ModelAndView mav = new ModelAndView();
      String user_id = vo.getUser_id();
      String pwd = vo.getPassword();
      
      userService.userSelect(user_id);
      userService.deletePro(vo);
      
      mav.setViewName("redirect:userlist");
      
      return mav;
   }
   
   @RequestMapping("/confirm_Id")
   public ModelAndView confirm_Id(UserVO vo){
	   ModelAndView mav = new ModelAndView();
	   int check = userService.confirmCheck(vo);
	   System.out.println(check);
	   if (check == 1) {
		   mav.addObject("check",check);
		   mav.addObject("user_id",vo.getUser_id());
		   mav.setViewName("login/confirm_Id");
	       return mav;
	   }else if(check == 0){
		   mav.addObject("check",check);
		   mav.addObject("user_id",vo.getUser_id());
		   mav.setViewName("login/confirm_Id");
	       return mav;
	   }else{
		   mav.setViewName("login/confirm_Id");
	       return mav;
	   }
   }
   
   // 아이디 찾기
   @RequestMapping("/findid") 
   public String find_id(Model model) {
     
      return "user/findid"; 
   } 
   
   // 비밀번호 찾기
   @RequestMapping("/findpwd") 
   public String find_pwd(Model model) {
     
      return "user/findpwd"; 
   }
   
   // 아이디 중복확인
   @RequestMapping("/find_idCheck")
   public ModelAndView find_idPro(UserVO vo){
	   ModelAndView mav = new ModelAndView();
	  vo = userService.userIdFindCheck(vo);
	   if(vo!=null){
		   int num =1;
		   mav.addObject("num",num);
		   mav.addObject("user_id",vo.getUser_id());
		   mav.setViewName("user/find_idPro");
		   return mav;
	   }
	   else{
		   int num=0;
		   mav.addObject("num", num);
		   mav.setViewName("user/find_idPro");
		   return mav;
	   }
	   
   }
   
   @RequestMapping("/find_pwdCheck")
   public ModelAndView find_pwdPro(UserVO vo){
	   ModelAndView mav = new ModelAndView();
	  vo = userService.userPwdFindCheck(vo);
	   if(vo!=null){
		   int num =1;
		   mav.addObject("num",num);
		   mav.addObject("password",vo.getPassword());
		   mav.setViewName("user/find_pwdPro");
		   return mav;
	   }
	   else{
		   int num=0;
		   mav.addObject("num", num);
		   mav.setViewName("user/find_pwdPro");
		   return mav;
	   }
	   
   }
}