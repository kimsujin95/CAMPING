package com.camping.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.camping.VO.boardVO;

@Repository
public class boardDAOImpl implements boardDAO{
	
	@Autowired
	private SqlSession sqlSession;  // mybatis에서 제공한 객체 
	private static String mapperquery ="com.camping.DAO.boardDAO";
	
	@Override
	public List<boardVO> BoardList() throws Exception {
		return sqlSession.selectList(mapperquery +".boardList");
	}

	@Override
	public void insert(boardVO boardvo) throws Exception {
		sqlSession.insert(mapperquery+ ".boardinsert",boardvo);
	}
	//자세히보기
	@Override
	public boardVO BoardView(int banum) throws Exception {
		return sqlSession.selectOne(mapperquery +".boardview",banum);
	}
	//자세히보기 카운트
	@Override
	public void boardcnt(int banum) throws Exception {
		sqlSession.update(mapperquery + ".boardcnt",banum);
	}

	@Override
	public void boarddel(int badel) throws Exception {
		sqlSession.delete(mapperquery+ ".del",badel);
	}

	@Override
	public boardVO boardmodlist(int bamodnum) throws Exception {
		return sqlSession.selectOne(mapperquery+ ".bamodlist",bamodnum);
	}

	@Override
	public void boardmod(boardVO bavo) throws Exception {
		sqlSession.update(mapperquery +".bamod",bavo);
	}
	
	

}
