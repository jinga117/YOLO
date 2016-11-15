package com.kosta.yolo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.yolo.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping("/list")
	public ModelAndView list(){
		System.out.println("여긴 컨트롤러!!! ");
		ModelAndView mav = adminService.list();
		mav.setViewName("admin/list");
		return mav;
	}
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public String write(){
		return "admin/write";
	}

	@RequestMapping(value="/write", method=RequestMethod.POST)
	public ModelAndView writePro(HttpServletRequest request){
		System.out.println("여긴 write 컨트롤러!!! ");
	
		ModelAndView mav = adminService.writePro(request);
		mav.setViewName("admin/write");
		return mav;
	}
	
	@RequestMapping("/info")
	public ModelAndView info(@RequestParam String trip_id){
		System.out.println("여긴 info ");
		
		ModelAndView mav = adminService.info(trip_id);
		mav.setViewName("admin/info");
		
		return mav;
	}
	
	@RequestMapping("/delete")
	public ModelAndView delete(@RequestParam String trip_id){
		
		System.out.println("여긴 delete");
		ModelAndView mav = adminService.delete(trip_id);
		mav.setViewName("redirect:list");
		
		return mav;
	}
	
}
