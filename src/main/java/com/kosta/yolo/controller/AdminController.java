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
	@RequestMapping("/admin/list")
	public ModelAndView list(){
		ModelAndView mav = adminService.list();
		mav.setViewName("admin/list");
		return mav;
	}
	
	// 여행지 입력
	@RequestMapping(value="/admin/write", method=RequestMethod.GET)
	public String write(){
		return "admin/write";
	}

	// 여행지 입력
	@RequestMapping(value="/admin/write", method=RequestMethod.POST)
	public ModelAndView writePro(HttpServletRequest request){
		ModelAndView mav = adminService.writePro(request);
		mav.setViewName("redirect:list");
		
		return mav;
	}
	
	// 여행지 정보
	@RequestMapping("/admin/info")
	public ModelAndView info(@RequestParam String trip_id){
		ModelAndView mav = adminService.info(trip_id);
		mav.setViewName("admin/info");
		
		return mav;
	}
	
	// 여행지 삭제
	@RequestMapping("/admin/delete")
    public String deleteTrip(@RequestParam(value="trip_id") String trip_id) {
        adminService.deleteTrip(trip_id);
        return "redirect:/admin/list";
    }
	
	// 여행지 수정폼
	@RequestMapping("/admin/update")
	public ModelAndView update(HttpServletRequest request) {
		String trip_id = request.getParameter("trip_id");
		ModelAndView mav = new ModelAndView();
		TripInfoVO vo = adminService.selectTrip(trip_id);
		mav.addObject("tvo", vo);
		mav.setViewName("admin/updateForm");
	    return mav;
	}
    
	// 여행지 수정
	@RequestMapping(value = "/admin/updateTrip", method = RequestMethod.POST)
	public ModelAndView updatePro(TripInfoVO vo) {
		ModelAndView mav = adminService.updatePro(vo);
		mav.setViewName("redirect:/admin/list");
	    return mav;
	}

}