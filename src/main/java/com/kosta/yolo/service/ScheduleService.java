package com.kosta.yolo.service;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.StringReader;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.itextpdf.text.Document;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.tool.xml.XMLWorker;
import com.itextpdf.tool.xml.XMLWorkerFontProvider;
import com.itextpdf.tool.xml.XMLWorkerHelper;
import com.itextpdf.tool.xml.css.CssFile;
import com.itextpdf.tool.xml.css.StyleAttrCSSResolver;
import com.itextpdf.tool.xml.html.CssAppliers;
import com.itextpdf.tool.xml.html.CssAppliersImpl;
import com.itextpdf.tool.xml.html.Tags;
import com.itextpdf.tool.xml.parser.XMLParser;
import com.itextpdf.tool.xml.pipeline.css.CSSResolver;
import com.itextpdf.tool.xml.pipeline.css.CssResolverPipeline;
import com.itextpdf.tool.xml.pipeline.end.PdfWriterPipeline;
import com.itextpdf.tool.xml.pipeline.html.HtmlPipeline;
import com.itextpdf.tool.xml.pipeline.html.HtmlPipelineContext;
import com.kosta.yolo.dao.ScheduleDAO;
import com.kosta.yolo.vo.TripPlanVO;

@Service
public class ScheduleService {

	@Autowired
	private ScheduleDAO scheduleDAO;
	
	//마이플랜
	public HttpServletRequest calendar(HttpServletRequest request, HttpSession session) throws Exception{
		TripPlanVO vo = new TripPlanVO();
		//정보저장할 객체 생성
		String planstart = "";  		int plan_no = 0;  	
		 String tripInfo="" ;String tripInfo2="" ; String tripInfo3="" ; 
		 int day=0;  int tDay =0; int eDay =0;

		//-----------------달력만들기-----------------
		Calendar cal= Calendar.getInstance();
		
	    int currentYear = cal.get(Calendar.YEAR); 
	    int currentMonth = cal.get(Calendar.MONTH)+1; // month는 0~11까지 있음
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
			     
			   //1월부터 12월까지 범위 지정.
			     if(month<1) { month=12; year=year-1; } 
			     if(month>12) { month=1; year=year+1; }
	    }//if end
	    
	    cal.set(year, month-1 , 1); //현재 날짜를 현재 월의 1일로 설정
	    int startDay=cal.get(Calendar.DAY_OF_WEEK); //현재날짜(1일)의 요일
	    int end=cal.getActualMaximum(Calendar.DAY_OF_MONTH); //이 달의 끝나는 날
	    
	    //해당아이디의 일정정보 select
		String user_id = (String) session.getAttribute("user_id");
		vo.setUser_id(user_id);

		//가공된 year/month 값 가져오기
		String year_ = String.valueOf(year); 
		String month_ = String.valueOf(month);
		
		//월 1자리일때 '02'이런타입으로 변경
		if(month_.length() == 1){
			month_ = "0"+month_;
		}

		//db 비교문에서 비교후 planList에 담기
		vo.setTrip_start(year_+"-"+month_);
		ArrayList<TripPlanVO> planList = scheduleDAO.cal(vo);
	
		//해당일에 포함된 정보 //1일차
		for(int i = 0; i < planList.size(); i++){
			//db에서 받아온 날짜를 저장
			planstart = planList.get(i).getTrip_start();

			plan_no = planList.get(i).getPlan_no();
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date date = sdf.parse(year_+"-"+month_+"-"+planstart.substring(8));
			cal.setTime(date);
			cal.add(Calendar.DATE, 1);
			//출발
			day = Integer.parseInt(planstart.substring(8));
			//둘째..
			tDay = Integer.parseInt((sdf.format(cal.getTime())).substring(8));
			//셋째..
			cal.add(Calendar.DATE, 1);
			eDay = Integer.parseInt((sdf.format(cal.getTime())).substring(8));
			
			tripInfo= planList.get(i).getTrip_nickname_1();
			tripInfo2= planList.get(i).getTrip_nickname_2();
			tripInfo3= planList.get(i).getTrip_nickname_3();
		}

	    request.setAttribute("year", new Integer(year));
	    request.setAttribute("month", new Integer(month));
	    request.setAttribute("currentYear", new Integer(currentYear));
	    request.setAttribute("currentMonth", new Integer(currentMonth));
	    request.setAttribute("currentDate", new Integer(currentDate));
	    request.setAttribute("startDay", new Integer(startDay));
	    request.setAttribute("end", new Integer(end));
	    
	    //정보 보내기
	    request.setAttribute("plan_no", plan_no);
	    request.setAttribute("tripInfo", tripInfo);
	    request.setAttribute("tripInfo2", tripInfo2);
	    request.setAttribute("tripInfo3", tripInfo3);
	    request.setAttribute("day", day);
	    request.setAttribute("tDay", tDay);
	    request.setAttribute("eDay", eDay);
	    return request;
	}
	
	
	//상세보기!! 
	public ModelAndView planInfo(String plan_no) throws Exception{
		ModelAndView mav = new ModelAndView();
		TripPlanVO listVO = scheduleDAO.planInfo(plan_no);


		//--------------------------일정뿌리기------------------------
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = listVO.getTrip_start();
		Date date = sdf.parse(today);
		cal.setTime(date);
		//2일차 날짜 구하기
		cal.add(Calendar.DATE, 1);
		String tDay = sdf.format(cal.getTime());
		//3일차 날짜 구하기
		cal.add(Calendar.DATE, 1);
		String eDay = sdf.format(cal.getTime());
		
		int pay = Integer.parseInt(listVO.getTrip_plan_pay_1());
		int pay2 = Integer.parseInt(listVO.getTrip_plan_pay_2());
		int pay3 = Integer.parseInt(listVO.getTrip_plan_pay_3());
		int hap = pay+pay2+pay3;
		
		mav.addObject("vo", listVO);
		mav.addObject("hap", hap);
		
		//값이 있을때만 넘겨주기~!!
		if(listVO.getTrip_id_2().length()>0){
			mav.addObject("tDay", tDay);
		}
		if(listVO.getTrip_id_3().length()>0){
			mav.addObject("eDay", eDay);
		}
		 return mav;
	}
	
	public void download(HttpServletRequest request, HttpServletResponse response, String plan_no) throws Exception {
		
		TripPlanVO listVO = scheduleDAO.planInfo(plan_no);
		//--------------------------일정뿌리기------------------------
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = listVO.getTrip_start();
		Date date = sdf.parse(today);
		cal.setTime(date);
		//2일차 날짜 구하기
		cal.add(Calendar.DATE, 1);
		String tDay = sdf.format(cal.getTime());
		//3일차 날짜 구하기
		cal.add(Calendar.DATE, 1);
		String eDay = sdf.format(cal.getTime());
		
		int pay = Integer.parseInt(listVO.getTrip_plan_pay_1());
		int pay2 = Integer.parseInt(listVO.getTrip_plan_pay_2());
		int pay3 = Integer.parseInt(listVO.getTrip_plan_pay_3());
		int hap = pay+pay2+pay3;
		
		   try {

			   String planHtml ="	<div class='Info_calendar'><div class='trip_Info'><div class='cal_title' >"
						+listVO.getTrip_title()
						+"<div class='days'><span class='day_day'>Day1</span><span class='start_day'>"
						+listVO.getTrip_start() 
						+"</span></div><div class='t_info'><div class='trip_name'>"
						+listVO.getTrip_nickname_1()
						+"</div><div class='t_memo'>"+listVO.getTrip_plan_memo_1() 
						+"</div><div class='t_pay'>"+listVO.getTrip_plan_pay_1()
						+"</div></div><div class='days' ><span class='day_day'>Day2</span><span class='start_day'>"
						+tDay+"</span></div><div class='t_info'><div class='trip_name'>"
						+listVO.getTrip_nickname_2()
						+"</div><div class='t_memo'>"+listVO.getTrip_plan_memo_2()
						+"</div><div class='t_pay'>"+listVO.getTrip_plan_pay_2()
						+"</div></div><div class='days'><span class='day_day'>Day3</span><span class='start_day'>"
						+eDay +"</span></div><div class='t_info'><div class='trip_name'>"
						+listVO.getTrip_nickname_3()+"</div><div class='t_memo'>"
						+listVO.getTrip_plan_memo_3() +"</div><div class='t_pay'>"
						+listVO.getTrip_plan_pay_3() +"</div></div><div class='foot'>&nbsp;&nbsp;"
						+hap+"</div></div></div>";

				//파일을 만들어 주세요.
				String saveName = request.getParameter("saveName") ;
				
			   OutputStream file = new FileOutputStream(new File("C:/yolo/YOLO/src/main/webapp/WEB-INF/views/downloads/"+saveName)); // 바로 다운로드.

			    // Document 생성
			    Document document = new Document(PageSize.A4, 50, 50, 50, 50);
			    // PdfWriter 생성
			    PdfWriter writer = PdfWriter.getInstance(document, file);
			    writer.setInitialLeading(12.5f);
	            
	   		 // 파일 다운로드 설정
			    response.setContentType("application/pdf");
			    String fileName = URLEncoder.encode("한글파일명", "UTF-8"); // 파일명이 한글일 땐 인코딩 필요
			    response.setHeader("Content-Transper-Encoding", "binary");
			    response.setHeader("Content-Disposition", "inline; filename=" + fileName + ".pdf");
			    
			    // Document 오픈
			    document.open();
			    XMLWorkerHelper helper = XMLWorkerHelper.getInstance();
			 
			    // CSS
			    CSSResolver cssResolver = new StyleAttrCSSResolver();
			    //    String cssH = request.getSession().getServletContext().getRealPath();
			    // System.out.println("cssH : "+cssH);
			    CssFile cssFile = helper.getCSS(new FileInputStream("C:/yolo/YOLO/src/main/webapp/WEB-INF/views/common/css/plan.css"));
			    cssResolver.addCss(cssFile);
			    
			    // HTML, 폰트 설정
			    XMLWorkerFontProvider fontProvider = new XMLWorkerFontProvider(XMLWorkerFontProvider.DONTLOOKFORFONTS);
			 // MalgunGothic은 alias,
			    fontProvider.register("C:/yolo/YOLO/src/main/webapp/WEB-INF/views/common/font/malgun_boot.ttf", "Malgun Gothic"); 
			    CssAppliers cssAppliers = new CssAppliersImpl(fontProvider);
			     
			    HtmlPipelineContext htmlContext = new HtmlPipelineContext(cssAppliers);
			    htmlContext.setTagFactory(Tags.getHtmlTagProcessorFactory());
			    
			    // Pipelines
			    PdfWriterPipeline pdf = new PdfWriterPipeline(document, writer);
			    HtmlPipeline html = new HtmlPipeline(htmlContext, pdf);
			    CssResolverPipeline css = new CssResolverPipeline(cssResolver, html);
			    
			    XMLWorker worker = new XMLWorker(css, true);
			    XMLParser xmlParser = new XMLParser(worker, Charset.forName("UTF-8"));
			    
	            InputStream is = new ByteArrayInputStream(planHtml.getBytes());
	            
	            StringReader strReader = new StringReader(planHtml);
			    xmlParser.parse(strReader);
	           // helper.parseXHtml(writer, document, is);
			    document.add(new Paragraph(planHtml));
			    is.close();
			    document.close();
	            file.close();

	            
	
	            
	            
	        } catch (Exception e) {

	            e.printStackTrace();
	        }
	}
	
	//업데이트
	public void planUpdate(TripPlanVO vo){
		scheduleDAO.planUp(vo);
	}
	
	//삭제
	public void planDelete(TripPlanVO vo){
		scheduleDAO.planDe(vo);
	}
	
/*	//--------------------------파일다운로드--------------------------------
	public void download(HttpServletRequest request, HttpServletResponse response) throws Exception{

		//파일을 만들어 주세요.
		String saveName = request.getParameter("saveName") ;
		
		File file = new File(saveName);
		
		try {
		    // Document 생성
		    Document document = new Document(PageSize.A4, 50, 50, 50, 50);
		 
		    // PdfWriter 생성
		    // PdfWriter writer = PdfWriter.getInstance(document, new
		    // FileOutputStream("d:/test.pdf")); // 바로 다운로드.
		    PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(file));
		    writer.setInitialLeading(12.5f);
		 
		 // 파일 다운로드 설정
		    response.setContentType("application/pdf");
		    String fileName = URLEncoder.encode("한글파일명", "UTF-8"); // 파일명이 한글일 땐 인코딩 필요
		    response.setHeader("Content-Transper-Encoding", "binary");
		    response.setHeader("Content-Disposition", "inline; filename=" + fileName + ".pdf");
		    
		    // Document 오픈
		    document.open();
		    XMLWorkerHelper helper = XMLWorkerHelper.getInstance();
		 
		    // CSS
		    CSSResolver cssResolver = new StyleAttrCSSResolver();
		//    String cssH = request.getSession().getServletContext().getRealPath();
		   // System.out.println("cssH : "+cssH);
		    CssFile cssFile = helper.getCSS(new FileInputStream("C:/yolo/YOLO/src/main/webapp/WEB-INF/views/common/css/plan.css"));
		    cssResolver.addCss(cssFile);
		 
		    // HTML, 폰트 설정
		    XMLWorkerFontProvider fontProvider = new XMLWorkerFontProvider(XMLWorkerFontProvider.DONTLOOKFORFONTS);
		 // MalgunGothic은 alias,
		    fontProvider.register("C:/yolo/YOLO/src/main/webapp/WEB-INF/views/common/font/malgun_boot.ttf", "Malgun Gothic"); 
		    CssAppliers cssAppliers = new CssAppliersImpl(fontProvider);
		     
		    HtmlPipelineContext htmlContext = new HtmlPipelineContext(cssAppliers);
		    htmlContext.setTagFactory(Tags.getHtmlTagProcessorFactory());
		 
		    // Pipelines
		    PdfWriterPipeline pdf = new PdfWriterPipeline(document, writer);
		    HtmlPipeline html = new HtmlPipeline(htmlContext, pdf);
		    CssResolverPipeline css = new CssResolverPipeline(cssResolver, html);
		     
		    XMLWorker worker = new XMLWorker(css, true);
		    XMLParser xmlParser = new XMLParser(worker, Charset.forName("UTF-8"));
		 
		    // 폰트 설정에서 별칭으로 줬던 "MalgunGothic"을 html 안에 폰트로 지정한다.
		    String planHtml ="	<div class='Info_calendar'><div class='trip_Info'><div class='cal_title' >"
		    						+vo.getTrip_title()
		    						+"<div class='days'><span class='day_day'>Day1</span><span class='start_day'>"
		    						+vo.getTrip_start() 
		    						+"</span></div><div class='t_info'><div class='trip_name'>"
		    						+vo.getTrip_nickname_1()
		    						+"</div><div class='t_memo'>"+vo.getTrip_plan_memo_1() 
		    						+"</div><div class='t_pay'>"+vo.getTrip_plan_pay_1()
		    						+"</div></div><div class='days' ><span class='day_day'>Day2</span><span class='start_day'>"
		    						+tDay+"</span></div><div class='t_info'><div class='trip_name'>"
		    						+vo.getTrip_nickname_2()
		    						+"</div><div class='t_memo'>"+vo.getTrip_plan_memo_2()
		    						+"</div><div class='t_pay'>"+vo.getTrip_plan_pay_2()
		    						+"</div></div><div class='days'><span class='day_day'>Day3</span><span class='start_day'>"
		    						+eDay +"</span></div><div class='t_info'><div class='trip_name'>"
		    						+vo.getTrip_nickname_3()+"</div><div class='t_memo'>"
		    						+vo.getTrip_plan_memo_3() +"</div><div class='t_pay'>"
		    						+vo.getTrip_plan_pay_3() +"</div></div><div class='foot'>&nbsp;&nbsp;"
		    						+hap+"</div></div></div>";
		 
		    StringReader strReader = new StringReader(planHtml);
		    xmlParser.parse(strReader);
		    
		    HTMLWorker htmlWorker = new HTMLWorker(document);
		    HashMap<String,Object> interfaceProps = new HashMap<String,Object>();
		    StyleSheet styles = new StyleSheet();
		    
		    
		    List<Element> objects = htmlWorker.parseToList(strReader, styles, interfaceProps);
		    
		    for (int k = 0; k < objects.size(); ++k){
		     
		     document.add((Element) objects.get(k));
		    }
		    document.close();   
		    
		    writer.close();
		} catch (Exception e) {
		    throw e;
		} 
	}
 */
}
