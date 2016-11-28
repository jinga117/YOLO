package com.kosta.yolo.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.yolo.vo.BookMarkVO;
import com.kosta.yolo.vo.TripInfoVO;
import com.kosta.yolo.vo.UserReviewVO;

@Repository
public class MypageDAO {
	
	@Autowired
	private SqlSession sqlSession;
	//마이페이지 내가쓴 댓글
	public ArrayList<UserReviewVO> reviewMypage(String user_id){
		MypageMapper mypageMapper = sqlSession.getMapper(MypageMapper.class);
		 
		System.out.println("user_id는"+user_id+"입니다.");
		ArrayList<UserReviewVO> list = mypageMapper.reviewMypage(user_id);
		System.out.println("쿼리다음이요");
		return list;		
	}
	//북마크
	public ArrayList<TripInfoVO> bookmark_mypage(String user_id) {
		System.out.println("DAO측 유저아이디 넘어오는지:"+user_id);
		MypageMapper mypageMapper = sqlSession.getMapper(MypageMapper.class);
		ArrayList<TripInfoVO> list =mypageMapper.bookmark_mypage(user_id);
		return list;
		
		
	}//함수 end
	//북마크 삭제
	public void bookmark_delete(String trip_id){
		MypageMapper mypageMapper= sqlSession.getMapper(MypageMapper.class);
	 mypageMapper.bookmark_delete(trip_id);
				
		
	}
	}//class end


