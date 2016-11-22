package com.kosta.yolo.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.yolo.dao.ScheduleDAO;
import com.kosta.yolo.dao.TripInfoDAO;
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
	

}
