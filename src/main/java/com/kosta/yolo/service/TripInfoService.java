package com.kosta.yolo.service;

import java.io.InputStreamReader;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.yolo.dao.TripInfoDAO;
import com.kosta.yolo.vo.TripInfoVO;
import com.kosta.yolo.vo.UserReviewVO;

@Service
public class TripInfoService {
	
	@Autowired
	private TripInfoDAO infoDAO;
	
/*	
	 public void Logic_Weather() {
		 String[] temp = new String[3];
		 String[] wfEn = new String[3];
		 String[] hour1 = new String[3];
		 
	  try {
	   DocumentBuilderFactory f = DocumentBuilderFactory.newInstance();
	   DocumentBuilder parser = f.newDocumentBuilder();
	 
	   Document xmlDoc = null;
	   String url = "http://www.kma.go.kr/wid/queryDFSRSS.jsp?zone=1121571000";
	   xmlDoc = (Document) parser.parse(url);
	 
	   Element root = xmlDoc.getDocumentElement();
	   // System.out.println(root.getTagName());
	    
	   for (int i = 0; i < temp.length; i++) {
	    Node xmlNode1 = root.getElementsByTagName("data").item(i);
	 
	    Node xmlNode21 = ((Element) xmlNode1).getElementsByTagName(
	      "temp").item(0);
	    Node xmlNode22 = ((Element) xmlNode1).getElementsByTagName(
	      "wfEn").item(0);
	    Node xmlNode23 = ((Element) xmlNode1).getElementsByTagName(
	      "hour").item(0);
	     
	    System.out.println(xmlNode21.getTextContent());
	    System.out.println(xmlNode22.getTextContent());
	    System.out.println( "기준시각 : " + xmlNode23.getTextContent() + "시");
	    
	    temp[i] = xmlNode21.getTextContent();
	    wfEn[i] = xmlNode22.getTextContent();
	    hour1[i] = "기준시각 : " + xmlNode23.getTextContent() + "시";
	   }
	 
	  } catch (Exception e) {
	   System.out.println(e.getMessage());
	   System.out.println(e.toString());
	  }
	 }
	*/
	
	/*private String rssFeed = "http://www.kma.go.kr/wid/queryDFS.jsp?gridx=%s&gridy=%s"; //주소
       
	

     *  해당 좌표의 날씨 정보를 반환.

    public List<Map<String, String>> getTownForecast(String x, String y) {        
               
        List<Map<String, String>> result = new ArrayList<Map<String, String>>();
                
        try {
        
            SAXBuilder parser = new SAXBuilder();        
            parser.setIgnoringElementContentWhitespace(true);
            
            //URL url = new URL(rssFeed);
            //InputSource is = new InputSource(url.openStream());
            //Document doc = parser.build(is);
            
            String url = String.format(rssFeed, x, y);
            Document doc = parser.build(url);
            Element root = doc.getRootElement();
            
            Element channel = root.getChild("body");
            List<Element> list = channel.getChildren("data");
           
            
           
            for (int i=0; i<list.size(); i++) {
              
                Element el = (Element)list.get(i);
                
                Map<String, String> data = new LinkedHashMap<String, String>();
                
                data.put("seq", el.getAttributeValue("seq"));   //48시간중 몇번째 인지 가르킴
                data.put("hour",el.getChildTextTrim("hour") );     //동네예보 3시간 단위 
                data.put("day",el.getChildTextTrim("day") );     //1번째날 (0: 오늘/1: 내일/2: 모레)
                data.put("temp",el.getChildTextTrim("temp") );    //현재 시간온도
                data.put("tmx",el.getChildTextTrim("tmx") );    //최고 온도 
                data.put("tmn",el.getChildTextTrim("tmn") );    //최저 온도
                data.put("sky",el.getChildTextTrim("sky") );    //하늘 상태코드 (1: 맑음, 2: 구름조금, 3:구름많음, 4:흐림)
                data.put("pty",el.getChildTextTrim("pty") );    //강수 상태코드 (0: 없음, 1: 비, 2: 비/눈, 3: 눈/비, 4: 눈)
                data.put("wfkor",el.getChildTextTrim("wfKor") ); //날씨 한국어
                data.put("wfEn",el.getChildTextTrim("wfEn") );      //날씨 영어
                data.put("pop",el.getChildTextTrim("pop") );     //강수 확률%
                data.put("r12",el.getChildTextTrim("r12") );     //12시간 예상 강수량
                data.put("s12",el.getChildTextTrim("s12") );     //12시간 예상 적설량
                data.put("ws",el.getChildTextTrim("ws") );         //풍속(m/s)
                data.put("wd",el.getChildTextTrim("wd") );         //풍향 (0~7:북, 북동, 동, 남동, 남, 남서, 서, 북서)
                data.put("wdKor",el.getChildTextTrim("wdKor") ); //풍향 한국어
                data.put("wdEn",el.getChildTextTrim("wdEn") );     //풍향 영어
                data.put("reh",el.getChildTextTrim("reh") );     //습도 %
                data.put("r06",el.getChildTextTrim("r06") );     //6시간 예상 강수량
                data.put("s06",el.getChildTextTrim("s06") );     //6시간 예상 적설량
                
                System.out.println(data);
                result.add(data);
            }

        } catch (JDOMException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        
        return result;
    }    
*/
	

	// 상세보기
	public ModelAndView detail_view(HttpServletRequest request, String trip_id) throws Exception {
		ModelAndView mav = new ModelAndView();

		//로그인 되었을 때 세션에 저장된 user_id 가져오기
		HttpSession session = request.getSession(false);
		String user = (String) session.getAttribute("user_id");
		if(user == null){
			mav.addObject("user", user);
					
		}else{ //로그인 되어있을시
			mav.addObject("user", user);
			mav.addObject("trip_id", trip_id);
		}
		
	   //    getTownForecast("59","125");     
		//Logic_Weather();
		int count = infoDAO.reviewCount(trip_id);
		ArrayList<TripInfoVO> detail = infoDAO.selectDetail(trip_id);
		ArrayList<TripInfoVO> review = infoDAO.inforeview(trip_id);
		mav.addObject("detailList", detail);
		mav.addObject("count", count);
		mav.addObject("reviewList", review);
		
		//원하는 포맷으로 오늘날짜 가져오기 
		Date date = new Date();
		//캘린더객체이용
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("MM / dd");
		String currentDate = sdf.format(date);
		List dList = new ArrayList();	
		//현재 날짜 담기
		dList.add(currentDate);
		//현재부터 +6일 날짜 담기
		for (int i = 0; i < 6; i++ ) {
			for (int j=1;j<2;j++) {
				cal.add(Calendar.DATE, j);
				String today = sdf.format(cal.getTime());
				
				dList.add(today);
			}
		}
	
		//날씨 데이터
		String x=Double.toString(detail.get(0).getPos_x()); //위도
		String y=Double.toString(detail.get(0).getPos_y()); //경도
		
		System.out.println("위도 : "+detail.get(0).getPos_x());
		System.out.println("경도 : "+detail.get(0).getPos_y());

		//위치에따른 정보가있는 json주소값
		URL url = new URL("http://api.openweathermap.org/data/2.5/forecast/daily?&APPID=7a9e4cfcb74be8bf1f5a726a03e4d451&lat="+x+"&lon="+y+"&mode=json&cnt=7");
		System.out.println(url);
		
		// 한글 처리를 위해 InputStreamReader를 UTF-8 인코딩으로 감싼다.
		InputStreamReader isr = new InputStreamReader(url.openConnection().getInputStream(), "UTF-8");
		// JSON을 Parsing 한다. 문법오류가 날 경우 Exception 발생, without Exception -> parse 메소드
		JSONObject object = (JSONObject)JSONValue.parseWithException(isr);
		Object obj = null;
		JSONParser parser = new JSONParser();
	    // list 배열
	    JSONArray bodyArray = (JSONArray)(object.get("list"));
		Iterator<String> Iterator = bodyArray.iterator();
		
		//뽑은날씨 아이콘을 담을 배열
		List wList = new ArrayList<>();
		
		while(Iterator.hasNext()){         
		    Object lObj = Iterator.next();
		    
		    JSONObject list = (JSONObject) lObj;
		    obj =  parser.parse(list.get("weather").toString());
		    JSONArray wArray = (JSONArray)obj;
		    
		    for(int i=0;i<wArray.size();i++){
		     JSONObject weather = (JSONObject)wArray.get(i); // Exception happens here.
		     String icon = (String) weather.get("icon");
		     wList.add(icon);
		    }
		}
		
		//뽑은 오늘 온도를 담을 배열
		List tList = new ArrayList<>();
		for(int i = 0 ; i < bodyArray.size(); i++) {
			JSONObject list = (JSONObject) bodyArray.get(i);        
			JSONObject tObject=(JSONObject) list.get("temp");
			//JSONObject wObject=(JSONObject) list.get("weather");
		
			//뽑은 day 저장
			String day = (tObject.get("day")).toString();
			//켈빈->썹씨 변형과정
			Double dayc = Double.parseDouble(day)-273.15;
			//int타입으로 변형 (썹씨)
			int dayC = Integer.parseInt(String.valueOf(Math.round(dayc)));
			
			tList.add(dayC);
		}
		
		System.out.println(dList);
		System.out.println(wList);
		System.out.println(tList);
		//오늘온도 list
		mav.addObject("today", dList.get(0));
		mav.addObject("today2", dList.get(1));
		mav.addObject("today3", dList.get(2));
		mav.addObject("today4", dList.get(3));
		mav.addObject("today5", dList.get(4));
		mav.addObject("today6", dList.get(5));
		mav.addObject("today7", dList.get(6));
		//오늘온도 list
		mav.addObject("day1", tList.get(0));
		mav.addObject("day2", tList.get(1));
		mav.addObject("day3", tList.get(2));
		mav.addObject("day4", tList.get(3));
		mav.addObject("day5", tList.get(4));
		mav.addObject("day6", tList.get(5));
		mav.addObject("day7", tList.get(6));
		//날씨 아이콘list
		mav.addObject("icon1", wList.get(0));
		mav.addObject("icon2", wList.get(1));
		mav.addObject("icon3", wList.get(2));
		mav.addObject("icon4", wList.get(3));
		mav.addObject("icon5", wList.get(4));
		mav.addObject("icon6", wList.get(5));
		mav.addObject("icon7", wList.get(6));
		
		return mav;
	}
	
	//리뷰 쓰기
	 public ArrayList<UserReviewVO> writeRe(HttpServletRequest request){
		UserReviewVO vo = new UserReviewVO();
		
		vo.setUser_id(request.getParameter("user_id"));
		vo.setTrip_id(request.getParameter("trip_id"));
		vo.setReview_content(request.getParameter("review_content"));
		
		infoDAO.writeReview(vo);		// 리뷰 쓰기
		infoDAO.reviewCount(vo.getTrip_id());		// 댓글수
		
		ArrayList<UserReviewVO> review = infoDAO.recentReview(vo.getTrip_id());
		return review;
	}
	
	// 조회수
	public int view_Count(String trip_id) {
		int count =  infoDAO.viewCount(trip_id);
		return count;
	}

	// 좋아요
	public int likeCount(String trip_id) {
		return infoDAO.likeCount(trip_id);
	}
	
	//전체리스트
	public ModelAndView list(){
		ModelAndView mav = new ModelAndView();
		ArrayList<TripInfoVO> list = infoDAO.InfoAll(); //연령별
		ArrayList<TripInfoVO> seasonList = infoDAO.seasonAll(); //계절별전체
		ArrayList<TripInfoVO> kpopList = infoDAO.kpopAll(); //한류별
		ArrayList<TripInfoVO> personList = infoDAO.personAll(); //인원별
		mav.addObject("list", list);
		mav.addObject("seasonList", seasonList);
		mav.addObject("kpopList", kpopList);
		mav.addObject("personList", personList);
		return mav;
	}
	
	//list_restaurant전체 리스트
	public ModelAndView list_restaurant(){
		ModelAndView mav = new ModelAndView();
		ArrayList<TripInfoVO> foodList = infoDAO.foodAll();
		ArrayList<TripInfoVO> foodTop = infoDAO.foodAllTop();
		mav.addObject("foodList", foodList);
		mav.addObject("foodTop", foodTop);
		return mav;
	}

	//list_shopping전체 리스트
	public ModelAndView list_shopping(String category_id){
		ModelAndView mav = new ModelAndView();
		ArrayList<TripInfoVO> shopList = infoDAO.categoryAll(category_id);
		ArrayList<TripInfoVO> shopTop = infoDAO.categoryTop(category_id);
		mav.addObject("cateList", shopList);
		mav.addObject("cateTop", shopTop);
		return mav;
	}
	
	//연령별 Top 리스트, 전체 리스트
	public ModelAndView age(){
		ModelAndView mav = new ModelAndView();
		ArrayList<TripInfoVO> topList = infoDAO.ageAllTop();
		ArrayList<TripInfoVO> allList = infoDAO.ageAll();
		mav.addObject("topList", topList);
		mav.addObject("allList", allList);
		return mav;
	}

	//테마별 Top 리스트,전체 리스트
	public ModelAndView theme(){
		ModelAndView mav = new ModelAndView();
		ArrayList<TripInfoVO> seasonTop = infoDAO.seasonAllTop();
		ArrayList<TripInfoVO> kpopTop = infoDAO.kpopAllTop();
		ArrayList<TripInfoVO> seasonList = infoDAO.seasonAll();
		ArrayList<TripInfoVO> kpopList = infoDAO.kpopAll();
		mav.addObject("seasonList", seasonList);
		mav.addObject("kpopList", kpopList);
		mav.addObject("seasonTop", seasonTop);
		mav.addObject("kpopTop", kpopTop);
		return mav;
	}
	
	//인원별Top 리스트
	public ModelAndView person() {
		ModelAndView mav = new ModelAndView();
		ArrayList<TripInfoVO> personTop = infoDAO.personAllTop();
		ArrayList<TripInfoVO> personList = infoDAO.personAll();
		mav.addObject("personTop", personTop);
		mav.addObject("personList", personList);
		return mav;
	}

	//age_id 키값에 따른 리스트
	public ModelAndView ageId(String age_id) {
		ModelAndView mav = new ModelAndView();
		ArrayList<TripInfoVO> avo = infoDAO.selectListAge(age_id);
		ArrayList<TripInfoVO> atop = infoDAO.ageTop(age_id);
		mav.addObject("age_id", age_id);
		mav.addObject("ageList", avo);
		mav.addObject("ageTop", atop);
		return mav;
	}
	
	//season_id 키값에 따른 리스트
	public ModelAndView seasonId(String season_id) {
		ModelAndView mav = new ModelAndView();
		ArrayList<TripInfoVO> svo = infoDAO.selectSeason(season_id);
		ArrayList<TripInfoVO> stop = infoDAO.seasonTop(season_id);
		mav.addObject("season_id", season_id);
		mav.addObject("seasonList", svo);
		mav.addObject("seasonTop", stop);
		return mav;
	}
	
	//kpop_id 키값에 따른 리스트
	public ModelAndView kpopId(String kpop_id) {
		ModelAndView mav = new ModelAndView();
		ArrayList<TripInfoVO> kvo = infoDAO.selectKpop(kpop_id);
		ArrayList<TripInfoVO> ktop = infoDAO.kpopTop(kpop_id);
		mav.addObject("kpop_id", kpop_id);
		mav.addObject("kpopList", kvo);
		mav.addObject("kpopTop", ktop);
		return mav;
	}

	//person_id 키값별 리스트
	public ModelAndView personId(String person_id) {
		ModelAndView mav = new ModelAndView();
		ArrayList<TripInfoVO> pvo = infoDAO.selectPerson(person_id);
		ArrayList<TripInfoVO> ptop = infoDAO.personTop(person_id);
		mav.addObject("person_id", person_id);
		mav.addObject("personList", pvo);
		mav.addObject("personTop", ptop);
		return mav;
	}
	
	//food_id 키값별 리스트
	public ModelAndView foodId(String food_id) {
		ModelAndView mav = new ModelAndView();
		ArrayList<TripInfoVO> fvo = infoDAO.selectFood(food_id);
		ArrayList<TripInfoVO> ftop = infoDAO.foodTop(food_id);
		mav.addObject("food_id", food_id);
		mav.addObject("foodList", fvo);
		mav.addObject("foodTop", ftop);
		return mav;
	}

	public void deleteReview(HttpServletRequest request) {
		infoDAO.deleteReview(request.getParameter("review_no"));
	}
	
}