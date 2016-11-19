package com.kosta.yolo.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class ScheduleDAO {

	@Autowired
	private SqlSession sqlSession;
	
}
