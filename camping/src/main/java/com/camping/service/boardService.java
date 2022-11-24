package com.camping.service;

import java.util.List;

import com.camping.VO.boardVO;

public interface boardService {

	public List<boardVO> BoardLst() throws Exception; 

	public void insert(boardVO boardvo) throws Exception;

	public boardVO boardView(int banum) throws Exception;

	public void boarddel(int badel) throws Exception;

	public boardVO boardmodlist(int bamodnum) throws Exception; //수정전 리스트

	public void boardmod(boardVO bavo) throws Exception; //수정 완료
	

}
