package com.camping.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.camping.VO.PageVO;
import com.camping.VO.campingVO;
import com.camping.cp1.searchController;

@Repository
public class campingListiDAOImpl implements campingListDAO {
	
	@Autowired
	private SqlSession sqlSession;  // mybatis에서 제공한 객체 
	private static String mapperquery ="com.camping.DAO.campingListDAO";
	
	@Override
	public List<campingVO> campingList(PageVO pagevo) throws Exception {		
		return sqlSession.selectList(mapperquery +".campingList",pagevo);
	}

	@Override
	public int cpcnt() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(mapperquery+ ".cpcnt");
	}

	@Override
	public List<campingVO> pnamelist() throws Exception {
		return sqlSession.selectList(mapperquery + ".pnamelist");
	}
	//조회수증가
	@Override
	public void cntplus(int cpnum) throws Exception {
		sqlSession.update(mapperquery + ".updateCntplus",cpnum);
	}
	//자세히보기
	@Override
	public campingVO cpOneview(int cpnum) throws Exception {
		return sqlSession.selectOne(mapperquery+".selectOne",cpnum);
	}
	//관리자페이지 캠핑장 삭제///
	@Override
	public void campingdel(int cpno) throws Exception {
		sqlSession.delete(mapperquery + ".campongdel",cpno);
	}

	@Override
	public campingVO cpmodList(String cp) throws Exception {
		return sqlSession.selectOne(mapperquery+ ".cpmodList",cp);
	}

	@Override
	public void cpmod(campingVO cpvo) throws Exception {
		sqlSession.update(mapperquery+ ".cpmod",cpvo);
	}

	@Override
	public void cpinput(campingVO cpvo) throws Exception {
		sqlSession.insert(mapperquery + ".cpin",cpvo);
	}
	

	@Override
	public List<campingVO> citylist(String pnamechoice) {
		return sqlSession.selectList(mapperquery + ".citylist",pnamechoice);
	}

	@Override
	public campingVO SelectAll(String index) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(mapperquery+".SelectList",index);
		}

	@Override
	public List<campingVO> CTList() throws Exception {
		return sqlSession.selectList(mapperquery+".ctlist");
	}



	}

	



