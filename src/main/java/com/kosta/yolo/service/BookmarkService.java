package com.kosta.yolo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.yolo.dao.BookmarkDAO;
import com.kosta.yolo.vo.BookMarkVO;
import com.kosta.yolo.vo.TripInfoVO;

@Service
public class BookmarkService {

	@Autowired
	private BookmarkDAO bookmarkDAO;

	public void bookmark_write(TripInfoVO tripinfovo,BookMarkVO bookmarkvo) {/////////////////
		
		bookmarkDAO.bookmarkWrite(bookmarkvo);
	}
}
