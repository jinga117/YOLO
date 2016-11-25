package com.kosta.yolo.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.yolo.vo.BookMarkVO;

@Repository
public class BookmarkDAO {

	@Autowired
	private SqlSession sqlSession;
	
	public void bookmarkWrite(BookMarkVO bookmarkvo){
		BookmarkMapper bookmarkMapper= sqlSession.getMapper(BookmarkMapper.class);
			bookmarkMapper.bookmarkWrite(bookmarkvo);
		}
	}


