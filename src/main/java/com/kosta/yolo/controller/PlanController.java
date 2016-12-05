package com.kosta.yolo.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.yolo.service.TripPlanService;
import com.kosta.yolo.vo.TripPlanVO;

@Controller
public class PlanController {
   
   @Autowired
   private TripPlanService planService;
  
   
   //여행 일정 보기.
	@RequestMapping("/my_schedule")
	public ModelAndView mySchedule( ){
		ModelAndView mav = new ModelAndView();
		ArrayList<TripPlanVO> list= planService.my_schedule();	//session id에 저장된 일정정보 뽑아오기.
	
		  if(list.size()==0){	//저장된 일정이 없을경우
			  int result = 0;
			  mav.addObject("result", result);
			  mav.setViewName("myplan/myschedule_fail");	//실패시
		  }else{//저장된 일정이 있을경우
			  mav.addObject("list", list);
			  mav.setViewName("myplan/myschedule_suc");
		}
		  
		return mav;
		
	}
	// 일정짜기
	@RequestMapping(value = "/tripPlan", method = RequestMethod.POST)
	public ModelAndView writeTripPlan(HttpServletRequest request, HttpServletResponse response,  TripPlanVO vo) throws IOException {
		if (vo.getTrip_plan_pay_1()==null || vo.getTrip_plan_pay_1().equals("")) vo.setTrip_plan_pay_1("0"); // 비용이 null 일때 0으로 셋팅함
		if (vo.getTrip_plan_pay_2()==null || vo.getTrip_plan_pay_2().equals("")) vo.setTrip_plan_pay_2("0");
		if (vo.getTrip_plan_pay_3()==null || vo.getTrip_plan_pay_3().equals("")) vo.setTrip_plan_pay_3("0");
		planService.tripPlan(vo);
		   PrintWriter out = response.getWriter();
		   JSONObject obj = new JSONObject();
		   obj.put("result", "ok");
		   out.print(obj);
		   out.flush();
		   out.close();          

      return null;
  }
	
	// 일정뿌리기
	@RequestMapping(value = "/getTripPlan", method = RequestMethod.POST,  produces = "application/text; charset=utf8")
	public ModelAndView getTripPlan(HttpServletRequest request, HttpServletResponse response,  TripPlanVO vo) throws IOException {
		TripPlanVO resultVo = planService.tripPlanView(vo);
		if (resultVo == null) return null; 	// 로그인 안했을때 null값을 리턴함
		
		   String json = "{\"trip_start\":\"" + resultVo.getTrip_start() + "\","
					+ "\"trip_title\":\"" + resultVo.getTrip_title() + "\","
					+ "\"trip_id_1\":\"" + resultVo.getTrip_id_1() + "\","
					+ "\"trip_nickname_1\":\"" + resultVo.getTrip_nickname_1() + "\","
					+ "\"trip_plan_pay_1\":\"" + resultVo.getTrip_plan_pay_1() + "\","
					+ "\"trip_plan_memo_1\":\"" + resultVo.getTrip_plan_memo_1() + "\","
					+ "\"trip_id_2\":\"" + resultVo.getTrip_id_2() + "\","
					+ "\"trip_nickname_2\":\"" + resultVo.getTrip_nickname_2() + "\","
					+ "\"trip_plan_pay_2\":\"" + resultVo.getTrip_plan_pay_2() + "\","
					+ "\"trip_plan_memo_2\":\"" + resultVo.getTrip_plan_memo_2() + "\","
					+ "\"trip_id_3\":\"" + resultVo.getTrip_id_3() + "\","
					+ "\"trip_nickname_3\":\"" + resultVo.getTrip_nickname_3() + "\","
					+ "\"trip_plan_pay_3\":\"" + resultVo.getTrip_plan_pay_3() + "\","
					+ "\"trip_plan_memo_3\":\"" + resultVo.getTrip_plan_memo_3() + "\""
					+ "}";
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().print(json);

       return null;
   }
	
   // 추천일정 전체보기 리스트
   @RequestMapping("/list_recommand")
   public ModelAndView list_recommand(@RequestParam String re_num) {
      ModelAndView mav = planService.list_recommand(re_num); // re_num LIKE 로 "re"만 가져와  메인 데이터를 가져오기위함
      mav.setViewName("myplan/list_recommand");
      return mav;
   }
   
   // 추천일정 상세보기 리스트
   @RequestMapping(value = "/detail_view_recommand", method = RequestMethod.GET)
   public ModelAndView RecommOnum(@RequestParam String re_onum) throws Exception {
      ModelAndView mav = planService.detail_view_recommand(re_onum); // get방식으로 re_num값을 re_onum에 가져옴
      mav.setViewName("myplan/detail_view_recommand");
      return mav;
   }    // re_num 과 re_onum의 차이는 re_num은 전체리스트에 메인 값을 뿌려주기 위함
      // re_onum 은 전체리스트에서 메인값 클릭시 상세보기에서 대표와 일치하는 값을 가져오기 위함
}