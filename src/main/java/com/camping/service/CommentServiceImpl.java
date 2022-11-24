package com.camping.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.camping.DAO.CommentDAO;
import com.camping.VO.CommentVO;

@Service
public class CommentServiceImpl implements CommentService{
	@Inject
	CommentDAO cmdao;

	@Override
	public int insert(CommentVO cpvo) throws Exception {
		return cmdao.insert(cpvo);
	}
	@Override
	public List<CommentVO> cmList(int cpnum) throws Exception {
		return cmdao.cmList(cpnum);
	}
	@Override
	public int del(int id) throws Exception {
		return cmdao.del(id);
	}
}
