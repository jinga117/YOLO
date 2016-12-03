package com.kosta.yolo.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.yolo.dao.BookmarkDAO;
import com.kosta.yolo.vo.BookMarkVO;
import com.kosta.yolo.vo.TripInfoVO;

@Service
public class BookmarkService {

	@Autowired
	private BookmarkDAO bookmarkDAO;

	public void bookmark_write(TripInfoVO tripinfovo,BookMarkVO bookmarkvo) {//북마크추가
		bookmarkDAO.bookmarkWrite(bookmarkvo);
	}

	public ArrayList<BookMarkVO> select(BookMarkVO bookmarkvo){	////북마크중복안되게
		ArrayList<BookMarkVO> list = bookmarkDAO.select_s(bookmarkvo);
		return list;
	}
}
