package com.kosta.yolo.controller;

import javax.servlet.http.HttpServletRequest;
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

   @RequestMapping("/userWrite_view") // 회원가입 페이지로 이동
   public String write_view(Model model) {
      System.out.println("write_view() method");
      return "user/user_write"; // /WEB-INF/views/write_view.jsp
   } // write_view() end

   @RequestMapping(value="/userwrite", method=RequestMethod.POST)
   public String write(UserVO uservo) {// , Model model

      System.out.println("여기까지.");
      userService.insert(uservo);

      return "index";
   }

   @RequestMapping("/loginPro") // 로그인
   public String loginPro(HttpServletRequest request) {
	  String user_id = request.getParameter("user_id");
	  
	  System.out.println("user_id : "+user_id);
      int result = userService.login(request);
   /*   UserVO vo = userService.userSelect(user_id);
      request.setAttribute("isadmin", vo.getIsadmin());
   */   
      System.out.println("result값:"+result);
      if (result == 1) {
    	  request.setAttribute("result", result);
         return "index";
      }else if(result == 2){
    	  request.setAttribute("result", result);
         return "login/loginFail";
      }else{
    	  request.setAttribute("result", result);
    	 return "login/loginFail";
      }
   }

   
   @RequestMapping("/logout")
   public String logout(HttpServletRequest request){
      
      HttpSession session = request.getSession();
      System.out.println("세션값:"+session.getAttribute("user_id"));
      
      session.invalidate();
      
      return "login/loginOut";
      
   }
   @RequestMapping("/userlist")
   public ModelAndView list(){
      System.out.println("여긴 컨트롤러!!! ");
      ModelAndView mav = userService.list();
      mav.setViewName("user/list");
      return mav;
   }


   @RequestMapping("/user_update")
   public ModelAndView update(HttpServletRequest request) {
		  HttpSession session = request.getSession();
		  
		   String user_id = (String) session.getAttribute("user_id");
		  System.out.println("유저아이디"+user_id);
	      ModelAndView mav = new ModelAndView();
	      UserVO vo = userService.userSelect(user_id);
	      mav.addObject("vo",vo);
	      mav.setViewName("user/user_update");
	      return mav;
	   }

   @RequestMapping(value = "/user_updatePro", method = RequestMethod.POST)
   public ModelAndView updatePro(UserVO vo) {
      System.out.println("여긴 update 컨트롤러!!! ");
      ModelAndView mav = userService.updatePro(vo);
      mav.setViewName("mypage/mypage_main");
      return mav;
   }

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
      System.out.println("여긴 delete 컨트롤러!!! ");
      ModelAndView mav = new ModelAndView();
      String user_id = vo.getUser_id();
      String pwd = vo.getPassword();
      System.out.println("user_id:"+user_id+"pwd:"+pwd);
      
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
   @RequestMapping("/findid") // 회원가입 페이지로 이동
   public String find_id(Model model) {
     
      return "user/findid"; 
   } 
   
   @RequestMapping("/find_idCheck")
   public ModelAndView find_idPro(UserVO vo){
	   ModelAndView mav = new ModelAndView();
	   int check = userService.userIdFindCheck(vo);
	   System.out.println(check + " " + vo.getUser_id());
	   if(check ==1){
		   mav.addObject("check", check);
		   mav.addObject("user_id",vo.getUser_id());
		   mav.setViewName("user/find_idPro");
		   return mav;
	   }else{
		   mav.addObject("check", check);
		   mav.setViewName("user/find_idPro");
		   return mav;
	   }
	   
   }
}// class end