package com.kosta.yolo.dao;

import java.io.Serializable;
import java.util.ArrayList;

import com.kosta.yolo.vo.BookMarkVO;
import com.kosta.yolo.vo.TripInfoVO;


public interface BookmarkMapper  extends Serializable  {
	
	public void bookmarkWrite(BookMarkVO bookmarkvo);// 북마크
	
}
