package com.camping.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.camping.DAO.campingListDAO;
import com.camping.VO.PageVO;
import com.camping.VO.campingVO;

@Service
public class campingListServiceImpl implements campingListService{
	@Inject
	private campingListDAO cpDAO;

	
	@Override
	public List<campingVO> campingList(PageVO pagevo) throws Exception {
		return cpDAO.campingList(pagevo);
	}
	//카운트
	@Override 
	public int cpcnt() throws Exception {
		return cpDAO.cpcnt();
	}

	
	@Override
	public List<campingVO> pnamelist() throws Exception {
		return cpDAO.pnamelist();
	}
	@Override
	public campingVO cpOneview(int cpnum) throws Exception {
		cpDAO.cntplus(cpnum); //조회수
		return cpDAO.cpOneview(cpnum); //자세히보기
	}
	//관리자 페이지 캠핑장 삭제---------------------------------------------------
	@Override
	public void campingdel(int cpno) throws Exception {
		cpDAO.campingdel(cpno);
	}
	//캠핑장 수정 전 
	@Override
	public campingVO cpmodList(String cp) throws Exception {
		return cpDAO.cpmodList(cp);
	}
	//수정 후
	@Override
	public void cpMod(campingVO cpvo) throws Exception {
		cpDAO.cpmod(cpvo);
	}
	@Override
	public List<campingVO> admincampingList(PageVO pagevo) throws Exception {
		return cpDAO.campingList(pagevo);
	}
	@Override
	public void cpinput(campingVO cpvo) throws Exception {
		cpDAO.cpinput(cpvo);
	}
	
	
	
	public campingVO pnameSearch(String index) throws Exception {
		return cpDAO.SelectAll(index);
	}
	@Override
	public List<campingVO> citylist(String pnamechoice) {
		return cpDAO.citylist(pnamechoice);
	}
	@Override
	public List<campingVO> CtList() throws Exception {
		return cpDAO.CTList();
	}

}
