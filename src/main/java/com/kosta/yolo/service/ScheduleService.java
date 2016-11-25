package com.kosta.yolo.service;

import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.yolo.dao.ScheduleDAO;
import com.kosta.yolo.vo.TripInfoVO;

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
	
	//달력만들기
	public HttpServletRequest calendar(HttpServletRequest request){
		
		ModelAndView mav = new ModelAndView();

		Calendar cal= Calendar.getInstance();
		
	    int currentYear = cal.get(Calendar.YEAR); 
	    int currentMonth = cal.get(Calendar.MONTH);
	    int currentDate = cal.get(Calendar.DATE);
	    String Year = request.getParameter("year"); //나타내고자 하는 날짜
	    String Month = request.getParameter("month");
	    int year, month;
	    
	    if(Year == null && Month == null){ //처음 호출했을 때
			    year = currentYear;
			    month = currentMonth;
	    }
	    else { //나타내고자 하는 날짜를 숫자로 변환
			     year = Integer.parseInt(Year);
			     month = Integer.parseInt(Month);
			     if(month<0) { month=11; year=year-1; } //1월부터 12월까지 범위 지정.
			     if(month>11) { month=0; year=year+1; }
	    }
	    
	    
	    cal.set(year, month, 1); //현재 날짜를 현재 월의 1일로 설정
	    int startDay=cal.get(Calendar.DAY_OF_WEEK); //현재날짜(1일)의 요일
	    int end=cal.getActualMaximum(Calendar.DAY_OF_MONTH); //이 달의 끝나는 날
	    int br = 0; //7일마다 줄 바꾸기
	    int count = 0;
	    
	    
	    request.setAttribute("year", new Integer(year));
	    request.setAttribute("month", new Integer(month));
	    request.setAttribute("currentYear", new Integer(currentYear));
	    request.setAttribute("currentMonth", new Integer(currentMonth));
	    request.setAttribute("currentDate", new Integer(currentDate));
	    request.setAttribute("startDay", new Integer(startDay));
	    request.setAttribute("end", new Integer(end));
	    request.setAttribute("br", br);
	    request.setAttribute("count", count);
	    
	    return request;
	}
}
