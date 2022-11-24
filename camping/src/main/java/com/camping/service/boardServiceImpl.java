package com.camping.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.camping.DAO.boardDAO;
import com.camping.VO.boardVO;

@Service
public class boardServiceImpl implements boardService {
	@Inject
	private boardDAO badao;
	
	@Override
	public List<boardVO> BoardLst() throws Exception {
		return badao.BoardList();
	}

	@Override
	public void insert(boardVO boardvo) throws Exception {
		badao.insert(boardvo);
	}
	//자세히보기
	@Override
	public boardVO boardView(int banum) throws Exception {
		badao.boardcnt(banum);
		return badao.BoardView(banum);
	}
	//삭제하기
	@Override
	public void boarddel(int badel) throws Exception {
		badao.boarddel(badel);
	}

	@Override
	public boardVO boardmodlist(int bamodnum) throws Exception {
		return badao.boardmodlist(bamodnum);
	}

	@Override
	public void boardmod(boardVO bavo) throws Exception {
		badao.boardmod(bavo);
	}

}
