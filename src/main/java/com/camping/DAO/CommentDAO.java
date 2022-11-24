package com.camping.DAO;

import java.util.List;

import com.camping.VO.CommentVO;

public interface CommentDAO {
	
	public int insert(CommentVO cpvo) throws Exception;

	public List<CommentVO> cmList(int cpnum) throws Exception;

	public int del(int no) throws Exception;

	
	
}
