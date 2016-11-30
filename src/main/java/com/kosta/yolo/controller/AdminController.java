package com.kosta.yolo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.yolo.service.AdminService;
import com.kosta.yolo.vo.TripInfoVO;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	// 여행지 리스트
	@RequestMapping("/info_list")
	public ModelAndView list(){
		ModelAndView mav = adminService.list();
		mav.setViewName("admin/info_list");
		return mav;
	}
	
	// 여행지 입력
	@RequestMapping(value="/info_write", method=RequestMethod.GET)
	public String write(){
		return "admin/info_write";
	}

	// 여행지 입력
	@RequestMapping(value="/info_write", method=RequestMethod.POST)
	public ModelAndView writePro(HttpServletRequest request){
		ModelAndView mav = adminService.writePro(request);
		mav.setViewName("admin/info_write");
		
		return mav;
	}
	
	// 여행지 삭제
	@RequestMapping("/delete")
    public String deleteTrip(@RequestParam(value="trip_id") String trip_id) {
        adminService.deleteTrip(trip_id);
        return "redirect:info_list";
    }
	
	// 여행지 수정폼
	@RequestMapping("/update")
	public ModelAndView update(HttpServletRequest request) {
		String trip_id = request.getParameter("trip_id");
		ModelAndView mav = new ModelAndView();
		TripInfoVO vo = adminService.selectTrip(trip_id);
		mav.addObject("tvo", vo);
		mav.setViewName("admin/updateForm");
	    return mav;
	}
    
	// 여행지 수정
	@RequestMapping(value = "/updatePro", method = RequestMethod.POST)
	public ModelAndView updatePro(TripInfoVO vo) {
		ModelAndView mav = adminService.updatePro(vo);
		mav.setViewName("redirect:info_list");
	    return mav;
	}
	
	// 전체 리뷰 보기
	@RequestMapping("/review_list")
	public ModelAndView reviewAll() {
		ModelAndView mav = adminService.reviewAll();
		mav.setViewName("admin/review_list");
		return mav;
	}
	
	// 리뷰 삭제
	@RequestMapping("/reviewDelete")
	public String reviewDelete(int review_no){
		ModelAndView mav = new ModelAndView();
		adminService.reviewDelete(review_no);
		return "redirect:review_list";
	}
}