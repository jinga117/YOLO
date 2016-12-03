package com.kosta.yolo.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.yolo.vo.TripInfoVO;
import com.kosta.yolo.vo.UserReviewVO;

@Repository
public class MypageDAO {

	@Autowired
	private SqlSession sqlSession;

	// 마이페이지 내가쓴 댓글
	public ArrayList<UserReviewVO> reviewMypage(String user_id) {
		MypageMapper mypageMapper = sqlSession.getMapper(MypageMapper.class);
		ArrayList<UserReviewVO> list = mypageMapper.reviewMypage(user_id);
		//SELECT * FROM UserReview WHERE user_id LIKE concat('%',#{user_id}) //like사용한이유는 댓글입력시 db에 앞에한칸이 띄어지고 저장이되서.  
		return list;
	}

	// 북마크
	public ArrayList<TripInfoVO> bookmark_mypage(String user_id) {
		System.out.println("DAO측 유저아이디 넘어오는지:" + user_id);
		MypageMapper mypageMapper = sqlSession.getMapper(MypageMapper.class);
		ArrayList<TripInfoVO> list = mypageMapper.bookmark_mypage(user_id);
		//조인사용한 이유는 북마크현황클릭시 TripInfo테이블 값을 가져와야되므로 사용.
		
		//select * from TripInfo t , BookMark b where t.trip_id = b.trip_id and b.user_id = #{user_id}   

		return list;

	}// 함수 end
		// 북마크 삭제
	public void bookmark_delete(String trip_id) {
		MypageMapper mypageMapper = sqlSession.getMapper(MypageMapper.class);
		mypageMapper.bookmark_delete(trip_id);
		//DELETE FROM BookMark WHERE trip_id = #{trip_id}
	}
	
	//리뷰 삭제.
	public void review_delete(UserReviewVO vo){//mypage에서 리뷰 삭제
	MypageMapper mypageMapper = sqlSession.getMapper(MypageMapper.class);
	mypageMapper.review_delete(vo.getReview_no());
	//Delete from UserReview where review_no = #{review_no}
	}

}// class end
