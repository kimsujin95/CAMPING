package com.camping.DAO;

import java.util.List;

import com.camping.VO.boardVO;

public interface boardDAO {

	public List<boardVO> BoardList() throws Exception;

	public void insert(boardVO boardvo) throws Exception;

	public boardVO BoardView(int banum) throws Exception; //자세히보기
	
	public void boardcnt(int banum) throws Exception; //자세히보기 카운트

	public void boarddel(int badel) throws Exception; //삭제하기

	public boardVO boardmodlist(int bamodnum) throws Exception;

	public void boardmod(boardVO bavo) throws Exception;

}
