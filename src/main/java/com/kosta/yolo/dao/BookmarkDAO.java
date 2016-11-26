package com.kosta.yolo.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.yolo.vo.BookMarkVO;
import com.kosta.yolo.vo.TripInfoVO;

@Repository
public class BookmarkDAO {

	@Autowired
	private SqlSession sqlSession;
	
	public void bookmarkWrite(BookMarkVO bookmarkvo){
		BookmarkMapper bookmarkMapper= sqlSession.getMapper(BookmarkMapper.class);
			bookmarkMapper.bookmarkWrite(bookmarkvo);
		}
	public ArrayList<BookMarkVO> select_s(BookMarkVO bookmarkvo){
		System.out.println("4444444");
		BookmarkMapper bookmarkMapper = sqlSession.getMapper(BookmarkMapper.class);
		ArrayList<BookMarkVO> list = bookmarkMapper.select_s(bookmarkvo);
		return list;
	}
	
	}


