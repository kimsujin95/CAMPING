package com.camping.service;

import java.util.List;

import com.camping.VO.CommentVO;

public interface CommentService {

	public int insert(CommentVO cpvo) throws Exception;

	public List<CommentVO> cmList(int bno) throws Exception;

	public int del(int no) throws Exception;

	

}
