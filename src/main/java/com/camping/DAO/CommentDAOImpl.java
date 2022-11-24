package com.camping.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.camping.VO.CommentVO;

@Repository
public class CommentDAOImpl implements CommentDAO{
	
	@Autowired
	private SqlSession sqlSession;  // mybatis에서 제공한 객체 
	private static String mapperquery ="com.camping.DAO.CommentDAO";
	@Override
	public int insert(CommentVO cpvo) throws Exception {
		return sqlSession.insert(mapperquery +".insert",cpvo);
	}
	@Override
	public List<CommentVO> cmList(int cpnum) throws Exception {
		return sqlSession.selectList(mapperquery+".cmList",cpnum);
	}
	@Override
	public int del(int no) throws Exception {
		return sqlSession.delete(mapperquery+".del",no);
	}
}
