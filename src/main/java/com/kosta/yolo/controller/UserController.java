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
   
   //회원 수정하기위해 기존값을 가져옴(select)
   @RequestMapping(value="/userwrite", method=RequestMethod.POST)
   public ModelAndView write(UserVO uservo) {	//vo 에 저장된 회원가입시 입력된값들
	   ModelAndView mav = new ModelAndView();
	   int num = userService.confirmCheck(uservo);//서비스 이동~
	   if(num == 1){//아이디가 존재하는경우.
		   mav.addObject("num",num);
		   mav.setViewName("user/FindFail");
		   return mav;
	   }else{//아이디가 존재하지않으므로 , 회원가입가능. 입력된값들 가지고 서비스이동.
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
   @RequestMapping("/logout")// Top에서 로그아웃클릭시 // Top에서 로그아웃클릭시 
   public String logout(HttpServletRequest request){
      
      HttpSession session = request.getSession(); 
      session.invalidate(); //세션값을 초기화시켜서 user_id값이 null로 변경됨.
      
      return "login/loginOut";//(로그아웃alert)
   }
   
   // 회원 리스트
   @RequestMapping("/userlist")
   public ModelAndView list(){
      ModelAndView mav = userService.list(); // 현재 가입되어 있는 유저들의 정보를 가져오기 위함 (관리자)
      mav.setViewName("user/userlist");
      
      return mav;
   }

   // 회원 수정
   @RequestMapping(value = "/user_update", method = RequestMethod.GET)
   public ModelAndView update(HttpServletRequest request) {
	  HttpSession session = request.getSession();//현재 로그인 되어있는 id를 가지고오기 위해 세션을 사용

	  String user_id = (String) session.getAttribute("user_id"); //현재 로그인 되어있는 id를 가지고오기 위해 세션을 사용
	  ModelAndView mav = new ModelAndView();
	  UserVO vo = userService.userSelect(user_id); //id의 정보를 가져옴
	  mav.addObject("vo",vo); 
	  mav.setViewName("user/user_update");
	      
	  return mav;
   }

   @RequestMapping(value = "/user_update", method = RequestMethod.POST)
   public ModelAndView updatePro(UserVO vo) {//입력한정보값이 vo로저장된걸 호출시킴
      ModelAndView mav = userService.updatePro(vo);//입력한값들 매개변수로보내줌. 
      mav.setViewName("mypage/mypage_main");
      
      return mav;
   }

   // 회원 삭제
   @RequestMapping("/user_delete")
   public ModelAndView delete(HttpServletRequest request) {
      ModelAndView mav = new ModelAndView();
      HttpSession session = request.getSession(); 
      String user_id = (String) session.getAttribute("user_id"); //현재 로그인 되어있는 id를 가지고오기 위해 세션을 사용
      UserVO vo = userService.userSelect(user_id); //id의 정보를 가져옴
      mav.addObject("vo",vo); // textbox 에 아이디가 자동 주입하기위해 셋 시켜줌
      mav.setViewName("user/user_delete");
      
      return mav;
   }

   //회원삭제 
   @RequestMapping(value = "/user_deletePro", method = RequestMethod.POST)
   public ModelAndView DeletePro(HttpServletRequest request, UserVO vo) {
      ModelAndView mav = new ModelAndView();
      HttpSession session = request.getSession(); 
      int check = 0;
      check =  userService.deletePro(vo); // 체크 값으로 비밀번호 true/false 를 분류해주기 위해서 return을 int로 받아줌
      if(check == 0)
      {
    	 check=0;
    	 mav.addObject("check",check);
    	 mav.setViewName("user/user_delete");
    	 return mav;
      }else
    	  session.invalidate(); // invalidate 를 한 이유는 탈퇴후 로그인이 되어있어서 
      							// 세션을 지우고 초기 페이지로 전환하기 위해 invalidate를 씀
    	  mav.setViewName("index"); 
      return mav;
   }
   // 관리자 회원삭제
   @RequestMapping("/admindelete")
   public ModelAndView adminDelete(@RequestParam String user_id) {
	  ModelAndView mav = new ModelAndView();
 	  userService.adminUserDelete(user_id); // 관리자는 user_id 값을 가져와 삭제가능
 	  mav.setViewName("redirect:userlist"); // 삭제후 url userlist 로 보내줌
 	  return mav;
   
   }
   
   @RequestMapping("/confirm_Id")
   public ModelAndView confirm_Id(UserVO vo){
	   ModelAndView mav = new ModelAndView();
	   int check = userService.confirmCheck(vo); // 중복아이디가 없게하기 위해 
	   											// 리턴 값을 int로 받아 처리
	   System.out.println(check);
	   if (check == 1) { // 이미 사용중인 아이디
		   mav.addObject("check",check);
		   mav.addObject("user_id",vo.getUser_id());
		   mav.setViewName("login/confirm_Id");
	       return mav;
	   }else if(check == 0){ // 사용 가능한 아이디
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
     
      return "user/findid"; // 뷰페이지
   } 
   
   // 비밀번호 찾기
   @RequestMapping("/findpwd") 
   public String find_pwd(Model model) {
     
      return "user/findpwd"; // 뷰페이지
   }
   
   // 아이디 중복확인
   @RequestMapping("/find_idCheck")
   public ModelAndView find_idPro(UserVO vo){
	   ModelAndView mav = new ModelAndView();
	  vo = userService.userIdFindCheck(vo); // 찾는 id가 db 상에 있는지 확인
	   if(vo!=null){ // db상에 id가 있을때의 처리
		   int num =1;
		   mav.addObject("num",num); 
		   mav.addObject("user_id",vo.getUser_id());
		   mav.setViewName("user/find_idPro"); 
		   return mav;
	   }
	   else{// db 상에 찾는 ID가 없을때의 처리
		   int num=0;
		   mav.addObject("num", num);
		   mav.setViewName("user/find_idPro");
		   return mav;
	   }
	   
   }
   
   @RequestMapping("/find_pwdCheck")
   public ModelAndView find_pwdPro(UserVO vo){
	   ModelAndView mav = new ModelAndView();
	  vo = userService.userPwdFindCheck(vo);// 찾는 password가 db 상에 있는지 확인
	   if(vo!=null){//db상에 password가 있을때의 처리
		   int num =1;
		   mav.addObject("num",num);
		   mav.addObject("password",vo.getPassword());
		   mav.setViewName("user/find_pwdPro");
		   return mav;
	   }
	   else{//db상에 password가 있을때의 처리
		   int num=0;
		   mav.addObject("num", num);
		   mav.setViewName("user/find_pwdPro");
		   return mav;
	   }
	   
   }
}