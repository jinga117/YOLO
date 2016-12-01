package com.kosta.yolo.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.yolo.dao.ScheduleDAO;
import com.kosta.yolo.vo.TripInfoVO;
import com.kosta.yolo.vo.TripPlanVO;

@Service
public class ScheduleService {

	@Autowired
	private ScheduleDAO scheduleDAO;


	//로그인한 계정에 권한
	public int s_login(String user_id) {
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
	
	//전체리스트
	public ModelAndView allList(){
		ModelAndView mav = new ModelAndView();
		ArrayList<TripInfoVO> list = scheduleDAO.all(); //연령별
		mav.addObject("list", list);
		return mav;
	}
	

	public ModelAndView calendar(HttpSession session){   
	      ModelAndView mav = new ModelAndView();
	      String user_id = (String) session.getAttribute("user_id");//로그인된 아이디를 TripPlan에서 가져오려구
	      ArrayList<TripPlanVO> list = scheduleDAO.mycalendar(user_id); 
	   /*   System.out.println("aa");
	      System.out.println(list.get(0).getUser_id());
	      int pay1=Integer.parseInt(list.get(0).getTrip_plan_pay_1()),
	         pay2=Integer.parseInt(list.get(0).getTrip_plan_pay_2()),
	         pay3=Integer.parseInt(list.get(0).getTrip_plan_pay_3());
	   */
	         //int cost =pay1+pay2+pay3;// Total pay
	         //System.out.println(cost+"원");
	      //mav.addObject("cost", cost);
	      mav.addObject("list", list);

	      return mav;
	   }
	
	//마이플랜
	public HttpServletRequest calen(HttpServletRequest request) throws Exception{
		
		HttpSession session = request.getSession();
		TripPlanVO vo = new TripPlanVO();

		//-----------------달력만들기-----------------
		Calendar cal= Calendar.getInstance();
		
	    int currentYear = cal.get(Calendar.YEAR); 
	    int currentMonth = cal.get(Calendar.MONTH)+1;
	    int currentDate = cal.get(Calendar.DATE);
		//나타내고자 하는 날짜 가져오기 위한... 변수들
		String Year = request.getParameter("year"); 
	    String Month = request.getParameter("month");
	    int year, month;
	    
	    System.out.println(currentMonth);
	    if(Year == null && Month == null){ //처음 호출했을 때
			    year = currentYear;
			    month = currentMonth;
	    }
	    else { //나타내고자 하는 날짜를 숫자로 변환
			     year = Integer.parseInt(Year);
			     month = Integer.parseInt(Month);
			     if(month<1) { month=12; year=year-1; } //1월부터 12월까지 범위 지정.
			     if(month>12) { month=1; year=year+1; }
	    }
	    cal.set(year, month-1 , 1); //현재 날짜를 현재 월의 1일로 설정
	    int startDay=cal.get(Calendar.DAY_OF_WEEK); //현재날짜(1일)의 요일
	    int end=cal.getActualMaximum(Calendar.DAY_OF_MONTH); //이 달의 끝나는 날
	    
	    //해당아이디의 일정정보 select
		String user_id = (String) session.getAttribute("user_id");
		vo.setUser_id(user_id);
		
		HashMap<Integer, String> trip = new HashMap<>();
		HashMap<Integer, String> trip2 = new HashMap<>();
		HashMap<Integer, String> trip3 = new HashMap<>();
		String planstart = "";
		int day;

		//가공된 year/month 값 가져오기
		String year_ = String.valueOf(year); 
		String month_ = String.valueOf(month);
		
		if(month_.length() == 1){
			month_ = "0"+month_;
		}
		vo.setTrip_start(year_+"-"+month_);
		
		ArrayList<TripPlanVO> planList = scheduleDAO.cal(vo);
		//해당일에 포함된 정보
		for(int i = 0; i < planList.size(); i++){
			planstart = planList.get(i).getTrip_start();
			String day_ = planstart.substring(8);
			System.out.println("day_"+day_);
			day = Integer.parseInt(day_);
			trip.put(day, planList.get(i).getTrip_nickname_1());
		}
		

		
		//해당일에 포함된 정보
		for(int i = 0; i < planList.size(); i++){
			//2틀날
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			Date date = sdf.parse(year_+month_+planstart.substring(8));
			cal.setTime(date);
			cal.add(Calendar.DATE, 1);
			String str = sdf.format(cal.getTime());
			String year1 = str.substring(0, 4);
			String month1 = str.substring(4, 6);
			vo.setTrip_start(year1+"-"+month1);
			System.out.println("1 : "+str);
			int day1 = Integer.parseInt(str.substring(6));
			trip2.put(day1, planList.get(i).getTrip_nickname_2());
			
			//3일날
			cal.add(Calendar.DATE, 1);
			str = sdf.format(cal.getTime());
			System.out.println("2 : "+str);
			String year2 = str.substring(0, 4);
			String month2 = str.substring(4, 6);
			vo.setTrip_start(year2+"-"+month2);
			int day2 = Integer.parseInt(str.substring(6));
			trip3.put(day2, planList.get(i).getTrip_nickname_3());
		}

	    request.setAttribute("year", new Integer(year));
	    request.setAttribute("month", new Integer(month));
	    request.setAttribute("currentYear", new Integer(currentYear));
	    request.setAttribute("currentMonth", new Integer(currentMonth));
	    request.setAttribute("currentDate", new Integer(currentDate));
	    request.setAttribute("startDay", new Integer(startDay));
	    request.setAttribute("end", new Integer(end));
	   
	    
	    //정보 보내기
	    request.setAttribute("trip", trip);
	    request.setAttribute("trip2", trip2);
	    request.setAttribute("trip3", trip3);
	    
	    return request;
	}
}
